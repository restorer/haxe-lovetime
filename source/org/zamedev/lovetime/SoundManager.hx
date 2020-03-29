package org.zamedev.lovetime;

import openfl.Assets;
import openfl.media.Sound;
import openfl.media.SoundChannel;
import openfl.media.SoundTransform;

class SoundManager {
    private var _enabled:Bool;

    private var bgmMusic:Sound;
    private var bgmChannel:SoundChannel;

    public var startBgm:Sound;
    public var preBgm:Sound;
    public var gameBgm:Sound;
    public var endBgm:Sound;
    public var pressSound:Sound;
    public var rightSound:Sound;
    public var wrongSound:Sound;
    public var shakeSound:Sound;
    public var disappearSound:Sound;

    public var enabled(get, set):Bool;

    public function new() {
        _enabled = false;
        bgmMusic = null;
        bgmChannel = null;

        startBgm = Assets.getMusic("bgm_start");
        preBgm = Assets.getMusic("bgm_pre");
        gameBgm = Assets.getMusic("bgm_game");
        endBgm = Assets.getMusic("bgm_end");

        pressSound = Assets.getSound("press");
        rightSound = Assets.getSound("right");
        wrongSound = Assets.getSound("wrong");
        shakeSound = Assets.getSound("shake");
        disappearSound = Assets.getSound("disappear");
    }

    public function playSound(sound:Sound):Void {
        if (_enabled) {
            #if html5
                sound.play(0.0, 1, new SoundTransform(1, -0.0001));
            #else
                sound.play();
            #end
        }
    }

    public function playBgm(sound:Sound):Void {
        if (sound == bgmMusic) {
            return;
        }

        if (_enabled && bgmChannel != null) {
            bgmChannel.stop();
            bgmChannel = null;
        }

        bgmMusic = sound;

        if (_enabled) {
            #if flash
                bgmChannel = bgmMusic.play(0.0, -1);
            #elseif html5
                bgmChannel = bgmMusic.play(0.0, 99999999, new SoundTransform(1, -0.0001));
            #else
                bgmChannel = bgmMusic.play(0.0, 99999999);
            #end
        }
    }

    @:noCompletion
    private function get_enabled():Bool {
        return _enabled;
    }

    private function set_enabled(value:Bool):Bool {
        if (value != _enabled) {
            _enabled = value;

            if (_enabled && bgmChannel == null && bgmMusic != null) {
                #if flash
                    bgmChannel = bgmMusic.play(0.0, -1);
                #elseif html5
                    bgmChannel = bgmMusic.play(0.0, 99999999, new SoundTransform(1, -0.0001));
                #else
                    bgmChannel = bgmMusic.play(0.0, 99999999);
                #end
            } else if (!_enabled && bgmChannel != null) {
                bgmChannel.stop();
                bgmChannel = null;
            }
        }

        return value;
    }
}
