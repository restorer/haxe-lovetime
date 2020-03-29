package org.zamedev.lovetime.scene;

import haxe.Timer;
import motion.Actuate;
import openfl.events.Event;
import openfl.events.MouseEvent;
import org.zamedev.lovetime.misc.PhotoPair;
import org.zamedev.lovetime.util.Common;
import org.zamedev.ui.Scene;
import org.zamedev.ui.graphics.Dimension;
import org.zamedev.ui.graphics.Drawable;
import org.zamedev.ui.graphics.DrawableType;
import org.zamedev.ui.view.ImageView;
import org.zamedev.ui.view.Rect;
import org.zamedev.ui.view.TextView;
import org.zamedev.ui.view.View;
import org.zamedev.ui.view.ViewGroup;
import org.zamedev.ui.view.ViewVisibility;

class GameScene extends BaseScene {
    private var backgroundImageView:ImageView;
    private var leftPhotoGroupView:ViewGroup;
    private var leftPhotoBorderView:Rect;
    private var leftPhotoImageView:ImageView;
    private var rightPhotoGroupView:ViewGroup;
    private var rightPhotoBorderView:Rect;
    private var rightPhotoImageView:ImageView;
    private var leftPhotoResultTextView:TextView;
    private var rightPhotoResultTextView:TextView;
    private var catGroupView:ViewGroup;
    private var catView:View;
    private var currentGroupView:ViewGroup;
    private var doneGroupView:ViewGroup;
    private var canClick:Bool = false;
    private var currentStep:Int;
    private var leftPhotoTime:Int;
    private var rightPhotoTime:Int;
    private var rightTextList:Array<String>;
    private var wrongTextList:Array<String>;

    override public function create() {
        super.create();

        contentView = (viewGroup = cast context.inflater.inflate(R.layout.scene_game));
        attachPressSounds();

        backgroundImageView = cast viewGroup.findViewById("background_image");
        leftPhotoGroupView = cast viewGroup.findViewById("left_photo_group");
        leftPhotoBorderView = cast viewGroup.findViewById("left_photo_border");
        leftPhotoImageView = cast viewGroup.findViewById("left_photo_image");
        rightPhotoGroupView = cast viewGroup.findViewById("right_photo_group");
        rightPhotoBorderView = cast viewGroup.findViewById("right_photo_border");
        rightPhotoImageView = cast viewGroup.findViewById("right_photo_image");
        leftPhotoResultTextView = cast viewGroup.findViewById("left_photo_result_text");
        rightPhotoResultTextView = cast viewGroup.findViewById("right_photo_result_text");
        catGroupView = cast viewGroup.findViewById("cat_group");
        catView = cast viewGroup.findViewById("cat");
        currentGroupView = cast viewGroup.findViewById("current_group");
        doneGroupView = cast viewGroup.findViewById("done_group");

        rightTextList = [
            context.resourceManager.getString(R.string.game_right_1),
            context.resourceManager.getString(R.string.game_right_2),
            context.resourceManager.getString(R.string.game_right_3),
        ];

        wrongTextList = [
            context.resourceManager.getString(R.string.game_wrong_1),
            context.resourceManager.getString(R.string.game_wrong_2),
            context.resourceManager.getString(R.string.game_wrong_3),
        ];

        leftPhotoImageView.addEventListener(MouseEvent.CLICK, function(_) {
            if (!canClick) {
                return;
            }

            canClick = false;
            Actuate.tween(leftPhotoImageView, 0.5, { alpha: 1.0 });
            Actuate.tween(rightPhotoImageView, 0.5, { alpha: 0.25 });
            showResult(leftPhotoResultTextView, leftPhotoTime <= rightPhotoTime);
        });

        rightPhotoImageView.addEventListener(MouseEvent.CLICK, function(_) {
            if (!canClick) {
                return;
            }

            canClick = false;
            Actuate.tween(leftPhotoImageView, 0.5, { alpha: 0.25 });
            Actuate.tween(rightPhotoImageView, 0.5, { alpha: 1.0 });
            showResult(rightPhotoResultTextView, rightPhotoTime <= leftPhotoTime);
        });

        addEventListener(Scene.ADDING_TO_STAGE, onAddingToStage);
        addEventListener(Event.ADDED_TO_STAGE, onAddedToStage);
        addEventListener(Event.REMOVED_FROM_STAGE, onRemovedFromStage);
    }

    private function onAddingToStage(_):Void {
        soundManager.playBgm(soundManager.gameBgm);

        switch (app.currentEpisode) {
            case 1:
                backgroundImageView.drawable = context.resourceManager.getDrawable(R.drawable.background_ep1_nocolor);

            case 2:
                backgroundImageView.drawable = context.resourceManager.getDrawable(R.drawable.background_ep2_nocolor);

            case 3:
                backgroundImageView.drawable = context.resourceManager.getDrawable(R.drawable.background_ep3_nocolor);
        };

        for (i in 1 ... 5) {
            Actuate.apply(currentGroupView.children[i], { alpha: 0.0 });
            Actuate.apply(doneGroupView.children[i], { alpha: 0.0 });
        }

        Actuate.apply(currentGroupView.children[0], { alpha: 1.0 });
        Actuate.apply(doneGroupView.children[0], { alpha: 0.0 });

        Actuate.apply(catGroupView, { offsetX: 0.0 });
        Actuate.apply(leftPhotoGroupView, { alpha: 0.0 });
        Actuate.apply(rightPhotoGroupView, { alpha: 0.0 });

        leftPhotoResultTextView.visibility = ViewVisibility.GONE;
        rightPhotoResultTextView.visibility = ViewVisibility.GONE;

        currentStep = 0;
        sceneSprite.addEventListener(Event.ENTER_FRAME, onEnterFrame);
    }

    private function onAddedToStage(_):Void {
        selectAndSetPhotos();
    }

    private function onRemovedFromStage(_):Void {
        sceneSprite.removeEventListener(Event.ENTER_FRAME, onEnterFrame);
    }

    private function onEnterFrame(_):Void {
        var dt = Timer.stamp();
        catView.offsetY = Math.sin(dt * 2.0) * 4.0 - 1.0;
    }

    private function showResult(resultTextView:TextView, isAnswerRight:Bool):Void {
        if (isAnswerRight) {
            soundManager.playSound(soundManager.rightSound);
        } else {
            soundManager.playSound(soundManager.wrongSound);
        }

        Actuate.apply(resultTextView, { alpha: 0.0, offsetY: 25.0 });
        resultTextView.visibility = ViewVisibility.VISIBLE;

        if (isAnswerRight) {
            resultTextView.text = Random.fromArray(rightTextList);
            resultTextView.textColor = context.resourceManager.getColor(R.color.game_right_text);

            currentStep++;
            Actuate.tween(doneGroupView.children[currentStep - 1], 0.5, { alpha: 1.0 });

            if (currentStep < 5) {
                Actuate.tween(currentGroupView.children[currentStep], 0.5, { alpha: 1.0 });
                Actuate.tween(catGroupView, 0.5, { offsetX: currentStep * 65 });
            }
        } else {
            resultTextView.text = Random.fromArray(wrongTextList);
            resultTextView.textColor = context.resourceManager.getColor(R.color.game_wrong_text);

            if (currentStep > 0) {
                currentStep--;
                Actuate.tween(doneGroupView.children[currentStep], 0.5, { alpha: 0.0 });
                Actuate.tween(currentGroupView.children[currentStep + 1], 0.5, { alpha: 0.0 });
                Actuate.tween(catGroupView, 0.5, { offsetX: currentStep * 65 });
            }
        }

        Actuate.tween(resultTextView, 0.5, { alpha: 1.0, offsetY: 0.0 });

        Common.runDelayed(1.0, function() {
            if (currentStep >= 5) {
                app.currentEpisode++;

                if (app.currentEpisode > 3) {
                    app.changeScene(app.endScene);
                } else {
                    app.changeScene(app.preScene);
                }
            } else {
                Actuate.tween(leftPhotoGroupView, 0.5, { alpha: 0.0, offsetY: 50.0 });
                Actuate.tween(rightPhotoGroupView, 0.5, { alpha: 0.0, offsetY: 50.0 });

                Actuate.tween(resultTextView, 0.5, { alpha: 0.0, offsetY: 25.0 }).onComplete(function() {
                    resultTextView.visibility = ViewVisibility.GONE;
                });

                Common.runDelayed(0.5, selectAndSetPhotos);
            }
        });
    }

    private function selectAndSetPhotos():Void {
        var list = new Array<PhotoPair>();

        while (true) {
            for (photoPair in app.photoPairList) {
                if (photoPair.episode == app.currentEpisode
                    && !app.usedPhotoMap.exists(photoPair.photoNameA)
                    && !app.usedPhotoMap.exists(photoPair.photoNameB)
                ) {
                    list.push(photoPair);
                }
            }

            if (list.length == 0) {
                app.usedPhotoMap = new Map<String, Bool>();
                continue;
            }

            break;
        }

        var photoPair = Random.fromArray(list);

        app.usedPhotoMap[photoPair.photoNameA] = true;
        app.usedPhotoMap[photoPair.photoNameB] = true;

        if (Random.bool()) {
            leftPhotoTime = photoPair.photoTimeA;
            rightPhotoTime = photoPair.photoTimeB;
            setPhotos(photoPair.photoNameA, photoPair.photoNameB);
        } else {
            leftPhotoTime = photoPair.photoTimeB;
            rightPhotoTime = photoPair.photoTimeA;
            setPhotos(photoPair.photoNameB, photoPair.photoNameA);
        }
    }

    private function setPhotos(leftPhotoName:String, rightPhotoName:String):Void {
        var leftDrawable = Drawable.fromAssetBitmap('photo/${leftPhotoName}');
        var leftBitmapData = leftDrawable.resolveBitmapData();
        leftPhotoBorderView.layoutParams.width = Dimension.EXACT(leftBitmapData.width + 20);
        leftPhotoBorderView.layoutParams.height = Dimension.EXACT(leftBitmapData.height + 20);
        leftPhotoImageView.drawable = leftDrawable;

        var rightDrawable = Drawable.fromAssetBitmap('photo/${rightPhotoName}');
        var rightBitmapData = rightDrawable.resolveBitmapData();
        rightPhotoBorderView.layoutParams.width = Dimension.EXACT(rightBitmapData.width + 20);
        rightPhotoBorderView.layoutParams.height = Dimension.EXACT(rightBitmapData.height + 20);
        rightPhotoImageView.drawable = rightDrawable;

        leftPhotoGroupView.rotation = Math.random() * 5.0 - 2.5;
        rightPhotoGroupView.rotation = Math.random() * 5.0 - 2.5;

        Actuate.apply(leftPhotoImageView, { alpha: 0.75 });
        Actuate.apply(rightPhotoImageView, { alpha: 0.75 });

        Actuate.apply(leftPhotoGroupView, { alpha: 0.0, offsetY: -50.0 });
        Actuate.apply(rightPhotoGroupView, { alpha: 0.0, offsetY: -50.0 });

        Actuate.tween(leftPhotoGroupView, 0.5, { alpha: 1.0, offsetY: 0.0 });
        Actuate.tween(rightPhotoGroupView, 0.5, { alpha: 1.0, offsetY: 0.0 });

        Common.runDelayed(0.25, function() {
            canClick = true;
        });
    }
}
