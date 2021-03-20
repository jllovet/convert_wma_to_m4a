# Converting WMA to M4A on Mac

## Setup

Install ffmpeg, a low-level audio conversion utility.
```brew install ffmpeg```


## Resources
- [SuperUser: Convert WMA to Apple Ecosystem Compatible Format - MP3, M4A, AAC](https://superuser.com/questions/1165164/convert-wma-to-apple-ecosystem-compatible-format-mp3-m4a-aac)
- [Stack Overflow: Question with Answer Describing Flags](https://stackoverflow.com/questions/3255674/convert-audio-files-to-mp3-using-ffmpeg)

### Notes

Some -acodec options may give warnings or errors similar to this:
`[mp3 @ 0x7f9d11814600] Application provided invalid, non monotonically increasing dts to muxer in stream 0: 13871 >= 12947`

[Stack Overflow Question: FFmpeg - What does non monotonically increasing dts mean?](https://stackoverflow.com/questions/46231348/ffmpeg-what-does-non-monotonically-increasing-dts-mean)