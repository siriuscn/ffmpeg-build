#!/bin/bash

git clone -b n4.2 https://github.com/FFmpeg/FFmpeg.git

cd FFmpeg

mkdir gaspp && cd gaspp && \
    wget -q https://raw.githubusercontent.com/yuvi/gas-preprocessor/master/gas-preprocessor.pl && \
    chmod +x gas-preprocessor.pl

export PATH=/Users/travis/build/siriuscn/ffmpeg-build/FFmpeg/gaspp:$PATH

export AS="gas-preprocessor.pl ${CC}"
export ASCPP="gas-preprocessor.pl ${CC}"
export CCAS="gas-preprocessor.pl ${CC}"
export LDFLAGS="-lmsvcr120_app ${LDFLAGS}"

pwd

cd ..

env CFLAGS="-O3 -w -arch arm64" CXXFLAGS="-O3 -w -arch arm64" LDFLAGS="-O3 -w -arch arm64" ./configure --enable-cross-compile --arch=arm64 --target-os=darwin --cc="clang -isysroot /Applications/Xcode.app/Contents/Developer/Platforms/iPhoneOS.platform/Developer/SDKs/iPhoneOS.sdk" --as=$AS  --sysroot=/Applications/Xcode.app/Contents/Developer/Platforms/iPhoneOS.platform/Developer/SDKs/iPhoneOS.sdk --disable-everything --enable-demuxer=rtsp --enable-muxer=rtsp --enable-demuxer=flv --enable-muxer=flv --enable-decoder=h264 --enable-decoder=h264_vda --enable-decoder=h264_mediacodec --enable-protocol=rtp --enable-protocol=rtmp --disable-filters --enable-small --enable-static --enable-shared --enable-hwaccel=h264_vda --enable-hwaccel=h264_videotoolbox --disable-iconv

make
