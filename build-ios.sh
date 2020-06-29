#!/bin/bash

git clone -b n4.2 https://github.com/FFmpeg/FFmpeg.git

cd FFmpeg

./configure --disable-everything --enable-demuxer=rtsp --enable-muxer=rtsp --enable-demuxer=flv --enable-muxer=flv --enable-decoder=h264 --enable-decoder=h264_vda --enable-decoder=h264_mediacodec --enable-protocol=rtp --enable-protocol=rtmp --disable-filters --enable-small --enable-static --enable-shared --enable-hwaccel=h264_vda --enable-hwaccel=h264_videotoolbox --disable-iconv
