#!/bin/bash

function convertOne {
    if [ "$1" != "1" ] ; then
        sox -v "$1" "$2" -r 22050 "$3" silence 1 0.1 0.1% reverse silence 1 0.1 0.1% reverse
    else
        sox "$2" -r 22050 "$3" silence 1 0.1 0.1% reverse silence 1 0.1 0.1% reverse
    fi
}

function convertMusic {
    echo "$2 ..."
    convertOne "$1" "sound-original/$2" "../assets/sound/$3.mp3"
    convertOne "$1" "sound-original/$2" "../assets/sound/$3.ogg"
    convertOne "$1" "sound-original/$2" "../assets/sound/$3.wav"
}

cd `dirname "$0"`

convertMusic 0.5 bgm_end.mp3 bgm_end
convertMusic 0.5 bgm_game.mp3 bgm_game
convertMusic 0.5 bgm_pre.mp3 bgm_pre
convertMusic 0.5 bgm_start.mp3 bgm_start
convertMusic 1 disappear.mp3 disappear
convertMusic 1 press.ogg press
convertMusic 1 right.ogg right
convertMusic 1 wrong.ogg wrong
convertMusic 1 shake.wav shake
