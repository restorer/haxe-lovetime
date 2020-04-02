package org.zamedev.lovetime.scene;

import motion.Actuate;
import motion.easing.Linear;
import openfl.events.Event;
import openfl.events.MouseEvent;
import org.zamedev.lovetime.util.Common;
import org.zamedev.ui.Scene;
import org.zamedev.ui.view.ImageView;
import org.zamedev.ui.view.TextView;
import org.zamedev.ui.view.ViewGroup;
import org.zamedev.ui.view.ViewVisibility;
import org.zamedev.ui.widget.Button;
import org.zamedev.lovetime.misc.BackgroundItem;

class EndScene extends BaseScene {
    private var backgroundItemList:Array<BackgroundItem> = new Array<BackgroundItem>();
    private var snakeView:ImageView;
    private var resultTextView:TextView;
    private var restartBtn:Button;

    override public function create() {
        super.create();

        contentView = (viewGroup = cast context.inflater.inflate(R.layout.scene_end));
        attachPressSounds();

        backgroundItemList.push({
            noColorView: cast viewGroup.findViewById(R.id.background_ep1_nocolor),
            hasColorView: cast viewGroup.findViewById(R.id.background_ep1_hascolor),
        });

        backgroundItemList.push({
            noColorView: cast viewGroup.findViewById(R.id.background_ep2_nocolor),
            hasColorView: cast viewGroup.findViewById(R.id.background_ep2_hascolor),
        });

        backgroundItemList.push({
            noColorView: cast viewGroup.findViewById(R.id.background_ep3_nocolor),
            hasColorView: cast viewGroup.findViewById(R.id.background_ep3_hascolor),
        });

        snakeView = cast viewGroup.findViewById(R.id.snake);
        resultTextView = cast viewGroup.findViewById(R.id.result_text);
        restartBtn = cast viewGroup.findViewById(R.id.restart_btn);

        restartBtn.addEventListener(MouseEvent.CLICK, function(_) {
            app.currentEpisode = 1;
            app.usedPhotoMap = new Map<String, Bool>();
            app.changeScene(app.preScene);
        });

        addEventListener(Scene.ADDING_TO_STAGE, function(_) {
            soundManager.playBgm(soundManager.endBgm);
            prepare();
        });

        addEventListener(Event.ADDED_TO_STAGE, function(_) {
            outroPart1();
        });
    }

    private function prepare():Void {
        for (item in backgroundItemList) {
            item.noColorView.visibility = ViewVisibility.GONE;
            item.hasColorView.visibility = ViewVisibility.GONE;
        }

        Actuate.apply(backgroundItemList[2].noColorView, { alpha: 1.0, offsetX: 0.0 });
        backgroundItemList[2].noColorView.visibility = ViewVisibility.VISIBLE;

        Actuate.apply(snakeView, { alpha: 1.0, offsetX: 0.0, scaleX: 1.0, scaleY: 1.0 });
        snakeView.visibility = ViewVisibility.VISIBLE;

        resultTextView.visibility = ViewVisibility.GONE;
        restartBtn.visibility = ViewVisibility.GONE;
    }

    private function outroPart1():Void {
        Common.shake(snakeView);
        soundManager.playSound(soundManager.shakeSound);

        Common.runDelayed(0.5, function() {
            Common.shake(snakeView);
            soundManager.playSound(soundManager.shakeSound);
        });

        Common.runDelayed(1.0, function() {
            Common.shake(snakeView);
            soundManager.playSound(soundManager.shakeSound);
        });

        Common.runDelayed(1.25, function() {
            soundManager.playSound(soundManager.disappearSound);
            Actuate.tween(snakeView, 0.5, { alpha: 0.0, scaleX: 0.5, scaleY: 0.5 });
        });

        Common.runDelayed(1.75, function() {
            Actuate.apply(backgroundItemList[2].hasColorView, { alpha: 1.0, offsetX: 0.0 });
            backgroundItemList[2].hasColorView.visibility = ViewVisibility.VISIBLE;

            Actuate.tween(backgroundItemList[2].noColorView, 1.0, { alpha: 0.0 }).ease(Linear.easeNone).onComplete(function() {
                backgroundItemList[2].noColorView.visibility = ViewVisibility.GONE;
            });

            Actuate.tween(backgroundItemList[2].hasColorView, 2.0, { alpha: 0.0, offsetX: 256.0 }).delay(1.0).onComplete(function() {
                backgroundItemList[2].hasColorView.visibility = ViewVisibility.GONE;
            });

            Actuate.apply(backgroundItemList[1].noColorView, { alpha: 0.0, offsetX: -256.0 });
            backgroundItemList[1].noColorView.visibility = ViewVisibility.VISIBLE;
            Actuate.tween(backgroundItemList[1].noColorView, 2.0, { alpha: 1.0, offsetX: 0.0 }).delay(1.0);

            Common.runDelayed(3.0, function() {
                Actuate.apply(backgroundItemList[1].hasColorView, { alpha: 1.0, offsetX: 0.0 });
                backgroundItemList[1].hasColorView.visibility = ViewVisibility.VISIBLE;

                Actuate.tween(backgroundItemList[1].noColorView, 1.0, { alpha: 0.0 }).ease(Linear.easeNone).onComplete(function() {
                    backgroundItemList[1].noColorView.visibility = ViewVisibility.GONE;
                });

                Actuate.tween(backgroundItemList[1].hasColorView, 2.0, { alpha: 0.0, offsetX: 256.0 }).delay(1.0).onComplete(function() {
                    backgroundItemList[1].hasColorView.visibility = ViewVisibility.GONE;
                });

                Actuate.apply(backgroundItemList[0].noColorView, { alpha: 0.0, offsetX: -256.0 });
                backgroundItemList[0].noColorView.visibility = ViewVisibility.VISIBLE;
                Actuate.tween(backgroundItemList[0].noColorView, 2.0, { alpha: 1.0, offsetX: 0.0 }).delay(1.0);

                Common.runDelayed(3.0, function() {
                    Actuate.apply(backgroundItemList[0].hasColorView, { alpha: 1.0, offsetX: 0.0 });
                    backgroundItemList[0].hasColorView.visibility = ViewVisibility.VISIBLE;

                    Actuate.tween(backgroundItemList[0].noColorView, 1.0, { alpha: 0.0 }).ease(Linear.easeNone).onComplete(function() {
                        backgroundItemList[0].noColorView.visibility = ViewVisibility.GONE;
                    });

                    Actuate.apply(restartBtn, { alpha: 0.0 });
                    restartBtn.visibility = ViewVisibility.VISIBLE;

                    Actuate.tween(restartBtn, 1.0, { alpha: 1.0 }).delay(1.0);

                    Actuate.apply(resultTextView, { alpha: 0.0, offsetY: -50.0 });
                    resultTextView.visibility = ViewVisibility.VISIBLE;

                    Actuate.tween(resultTextView, 2.0, { alpha: 1.0, offsetY: 0.0 }).delay(1.0);
                });
            });
        });
    }
}
