# Converting WMA to M4A on Mac

## About

This is a shell script that converts Windows Media Audio (`.wma`) files to MPEG-4 Part 14 (`.m4a`). You may be interested in doing this if you have audio files that were created in an older Windows environment in the `.wma` format that you want to be able to use in another environment that can't use `.wma`, like on MacOS.

The script takes one argument, the directory containing the files you want to convert. Subdirectories will be included in the conversion.

For example, both of these are valid structures, and any `.wma` files contained in any of these folders will be converted.

```
.
├── bluegrass
│   ├── appalachia.wma
│   └── banjo
│       └── appalachia_wonder.wma
├── funk
│   ├── favorites
│   └── retro.wma
└── jazz
    └── smooth.wma
```


The paths to all of the files that are converted will be placed in a file name `wma-files.txt`. The converted files are placed in an directory called `out` that is placed at the base of the directory you specified. The input directory structure will be re-created in the `out` directory for all directories that contained `.wma` files. Empty directories will be ignored.

Building on the example above, here is the expected directory structure after running the shell script.

```
.
├── bluegrass
│   ├── appalachia.wma
│   └── banjo
│       └── appalachia_wonder.wma
├── funk
│   ├── favorites
│   └── retro.wma
├── jazz
│   └── smooth.wma
├── out
│   ├── bluegrass
│   │   ├── appalachia.m4a
│   │   └── banjo
│   │       └── appalachia_wonder.m4a
│   ├── funk
│   │   └── retro.m4a
│   └── jazz
│       └── smooth.m4a
└── wma-files.txt
```

## Setup

Install ffmpeg, a low-level audio conversion utility.

```brew install ffmpeg```

## Usage

Assuming you are in the directory that contains the script, you can run this command to perform the conversions.

```./convert_wma_to_m4a.sh .```

Assuming that you don't have an `out` directory already created, you can run this to have the conversions happen silently. The conversion logs will be redirected to a file.

```./convert_wma_to_m4a.sh . > ./conversion_logs.txt 2>&1```

Note: If you redirect the logs to a file like this, any prompts about overwriting files will not be displayed to the terminal. If you want those prompts to be displayed to you, then use the first usage example above.

## Resources
- [SuperUser: Convert WMA to Apple Ecosystem Compatible Format - MP3, M4A, AAC](https://superuser.com/questions/1165164/convert-wma-to-apple-ecosystem-compatible-format-mp3-m4a-aac)
- [Stack Overflow: Question with Answer Describing Flags](https://stackoverflow.com/questions/3255674/convert-audio-files-to-mp3-using-ffmpeg)
- [How do I remove the file suffix and path portion from a path string in Bash?](https://stackoverflow.com/questions/125281/how-do-i-remove-the-file-suffix-and-path-portion-from-a-path-string-in-bash)
- [Case Insensitive Grep Usage](https://stackoverflow.com/questions/22924548/what-is-the-most-efficient-case-insensitive-grep-usage)
- [Use Find and Regular Expressions to List Files](https://stackoverflow.com/a/1448069)
- [Check Whether Directory Exists in Bash](https://www.cyberciti.biz/faq/howto-check-if-a-directory-exists-in-a-bash-shellscript/)
- [How to Create a File and Its Parent Directories](https://unix.stackexchange.com/questions/305844/how-to-create-a-file-and-parent-directories-in-one-command)
- [Remove First Characters of String in Bash](https://stackoverflow.com/questions/6594085/remove-first-character-of-a-string-in-bash/20195713)
- [How to Get a File Directory Path from a File Path](https://stackoverflow.com/a/6121114)

### Notes

Some -acodec options may give warnings or errors similar to this:
`[mp3 @ 0x7f9d11814600] Application provided invalid, non monotonically increasing dts to muxer in stream 0: 13871 >= 12947`

[Stack Overflow Question: FFmpeg - What does non monotonically increasing dts mean?](https://stackoverflow.com/questions/46231348/ffmpeg-what-does-non-monotonically-increasing-dts-mean)
