package org.zamedev.lovetime;

import org.zamedev.lovetime.misc.PhotoInfo;
import org.zamedev.lovetime.misc.PhotoPair;
import org.zamedev.lovetime.scene.EndScene;
import org.zamedev.lovetime.scene.GameScene;
import org.zamedev.lovetime.scene.PreScene;
import org.zamedev.lovetime.scene.StartScene;
import org.zamedev.ui.Application;
import org.zamedev.ui.graphics.ScaleMode;

using org.zamedev.lib.LambdaExt;

class App extends Application {
    public var currentEpisode:Int = 1;
    public var usedPhotoMap:Map<String, Bool> = new Map<String, Bool>();
    public var photoPairList:Array<PhotoPair> = new Array<PhotoPair>();

    public var soundManager:SoundManager;
    public var startScene:StartScene;
    public var preScene:PreScene;
    public var gameScene:GameScene;
    public var endScene:EndScene;

    override private function create():Void {
        super.create();

        fillPhotoPairMap();
        soundManager = new SoundManager();

        #if html5
            applicationStage.setStageSize(1024, 768);
        #else
            applicationStage.setStageSize(1024, 768, ScaleMode.FIT_XY);
        #end

        applicationStage.setWeightSums(1024, 768);

        startScene = new StartScene(this);
        preScene = new PreScene(this);
        gameScene = new GameScene(this);
        endScene = new EndScene(this);

        changeScene(startScene);
        // changeScene(preScene);

        soundManager.enabled = true;
    }

    private function fillPhotoPairMap():Void {
        var photoNameList = PhotoInfo.infoMap.keys().array();
        var minTimeDiff = -1;
        var maxTimeDiff = -1;

        for (i in 0 ... (photoNameList.length - 1)) {
            var photoNameA = photoNameList[i];
            var photoTimeA = PhotoInfo.infoMap[photoNameA];

            for (j in (i + 1) ... photoNameList.length) {
                var photoNameB = photoNameList[j];
                var photoTimeB = PhotoInfo.infoMap[photoNameB];
                var timeDiff = Std.int(Math.abs(photoTimeA - photoTimeB));

                if (minTimeDiff < 0 || timeDiff < minTimeDiff) {
                    minTimeDiff = timeDiff;
                }

                if (maxTimeDiff < 0 || timeDiff > maxTimeDiff) {
                    maxTimeDiff = timeDiff;
                }

                photoPairList.push({
                    photoNameA: photoNameA,
                    photoNameB: photoNameB,
                    photoTimeA: photoTimeA,
                    photoTimeB: photoTimeB,
                    timeDiff: timeDiff,
                    episode: 0,
                });
            }
        }

        var epDiff = Std.int((maxTimeDiff - minTimeDiff) / 6);

        for (photoPair in photoPairList) {
            if (photoPair.timeDiff < minTimeDiff + epDiff) {
                photoPair.episode = 3;
            } else if (photoPair.timeDiff < minTimeDiff + epDiff * 3) {
                photoPair.episode = 2;
            } else {
                photoPair.episode = 1;
            }
        }
    }
}
