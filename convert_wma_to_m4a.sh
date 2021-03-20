#!/usr/bin/env bash

# Written by Jonathan Llovet - jonathan.llovet@gmail.com
# Initial version: 3-20-2021

find $1 -type f | grep -i wma$ > wma-files.txt

readarray -t files < wma-files.txt

outdir="$1/out"

if [ ! -d $outdir ]
then
    echo "Creating output directory at: $outdir"
    mkdir $outdir
else
    echo "Output directory exists at: $outdir"
fi

for file in "${files[@]}"; do
    tmp_out="${file%.*}.m4a"
    out="$outdir/${tmp_out:2}"
    file_outdir=$(dirname $out)
    echo $file_outdir
    if [ ! -d $file_outdir ]
    then
        echo "Couldn't find intermediate output directories. Creating them."
        mkdir -p $file_outdir
    fi
    ffmpeg -i "$file" -vn -ac 2 -c:a aac -b:a 192k $out
done;
