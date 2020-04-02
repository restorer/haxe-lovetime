package org.zamedev.lovetime.scene;

import motion.Actuate;
import motion.easing.Linear;
import openfl.events.Event;
import openfl.events.MouseEvent;
import org.zamedev.lovetime.misc.BackgroundItem;
import org.zamedev.lovetime.util.Common;
import org.zamedev.ui.Scene;
import org.zamedev.ui.view.ImageView;
import org.zamedev.ui.view.TextView;
import org.zamedev.ui.view.ViewGroup;
import org.zamedev.ui.view.ViewVisibility;
import org.zamedev.ui.widget.Button;

// import tween.Delta;
// import tween.utils.Stopwatch;

class StartScene extends BaseScene {
    private var backgroundItemList:Array<BackgroundItem> = new Array<BackgroundItem>();
    private var introText1View:TextView;
    private var introText2View:TextView;
    private var introText3View:TextView;
    private var snakeSmallView:ImageView;
    private var catSmallView:ImageView;
    private var vsGroupView:ViewGroup;
    private var nextBtn:Button;
    private var step:Int;

    override public function create() {
        super.create();

        contentView = (viewGroup = cast context.inflater.inflate(R.layout.scene_start));
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

        introText1View = cast viewGroup.findViewById(R.id.intro_1_text);
        introText2View = cast viewGroup.findViewById(R.id.intro_2_text);
        introText3View = cast viewGroup.findViewById(R.id.intro_3_text);
        snakeSmallView = cast viewGroup.findViewById(R.id.snake_small);
        catSmallView = cast viewGroup.findViewById(R.id.cat_small);
        vsGroupView = cast viewGroup.findViewById(R.id.vs_group);
        nextBtn = cast viewGroup.findViewById(R.id.next_btn);

        nextBtn.addEventListener(MouseEvent.CLICK, function(_) {
            onNext();
        });

        addEventListener(Scene.ADDING_TO_STAGE, function(_) {
            soundManager.playBgm(soundManager.startBgm);
            prepare();
        });

        addEventListener(Event.ADDED_TO_STAGE, function(_) {
            introPart1();
        });

        // sceneSprite.addEventListener(Event.ENTER_FRAME, update);
    }

    private function prepare():Void {
        for (item in backgroundItemList) {
            item.noColorView.visibility = ViewVisibility.GONE;
            item.hasColorView.visibility = ViewVisibility.GONE;
        }

        Actuate.apply(backgroundItemList[0].hasColorView, { alpha: 1.0, offsetX: 0.0 });
        backgroundItemList[0].hasColorView.visibility = ViewVisibility.VISIBLE;

        introText1View.visibility = ViewVisibility.GONE;
        introText2View.visibility = ViewVisibility.GONE;
        introText3View.visibility = ViewVisibility.GONE;
        snakeSmallView.visibility = ViewVisibility.GONE;
        catSmallView.visibility = ViewVisibility.GONE;
        vsGroupView.visibility = ViewVisibility.GONE;
        nextBtn.visibility = ViewVisibility.GONE;
        nextBtn.disabled = true;

        step = 1;
    }

    private function onNext():Void {
        if (step == 1) {
            step = 2;
            introPart2();
        } else if (step == 2) {
            step = 3;
            introPart3();
        } else if (step == 3) {
            step = 4;
            introPart4();
        } else {
            app.changeScene(app.preScene);
        }
    }

    /*
    private function update(e:Event):Void {
        Delta.step(Stopwatch.tock());
        Stopwatch.tick();
    }

    private function introPart1_delta():Void {
        Delta.tween(snakeSmallView)
            .propMultiple({
                alpha: 0.0,
                scaleX: 2.0,
                scaleY: 2.0,
                offsetY: 0.0,
            }, 0.0)
            .onComplete(function() {
                snakeSmallView.visibility = ViewVisibility.VISIBLE;
            })
            .tween(snakeSmallView)
            .propMultiple({
                alpha: 1.0,
                scaleX: 1.0,
                scaleY: 1.0,
            }, 1.0)
            .ease(tween.easing.Expo.easeInOut)
            .tween(introText1View)
            .propMultiple({
                alpha: 0.0,
                offsetY: -32.0,
            }, 0.0)
            .onComplete(function() {
                introText1View.visibility = ViewVisibility.VISIBLE;
            })
            .tween(introText1View)
            .propMultiple({
                alpha: 1.0,
                offsetY: 0.0,
            }, 1.0)
            .ease(tween.easing.Expo.easeInOut)
            .tween(backgroundItemList[0].noColorView)
            .propMultiple({
                alpha: 1.0,
                offsetX: 0.0,
            }, 0.0)
            .onComplete(function() {
                backgroundItemList[0].noColorView.visibility = ViewVisibility.VISIBLE;
            })
            .tween(backgroundItemList[0].hasColorView)
            .propMultiple({
                alpha: 0.0,
            }, 1.0)
            .ease(tween.easing.Linear.none)
            .onComplete(function() {
                backgroundItemList[0].hasColorView.visibility = ViewVisibility.GONE;
            })
            .tween(backgroundItemList[0].noColorView)
            .propMultiple({
                alpha: 0.0,
                offsetX: -256.0,
            }, 2.0)
            .onComplete(function() {
                backgroundItemList[0].noColorView.visibility = ViewVisibility.GONE;
            })
        ;
    }
    */

    private function introPart1():Void {
        Actuate.apply(snakeSmallView, { alpha: 0.0, scaleX: 2.0, scaleY: 2.0, offsetY: 0.0 });
        snakeSmallView.visibility = ViewVisibility.VISIBLE;
        Actuate.tween(snakeSmallView, 1.0, { alpha: 1.0, scaleX: 1.0, scaleY: 1.0 });

        Actuate.apply(introText1View, { alpha: 0.0, offsetY: -32.0 });
        introText1View.visibility = ViewVisibility.VISIBLE;
        Actuate.tween(introText1View, 1.0, { alpha: 1.0, offsetY: 0.0 }).delay(1.0);

        Common.runDelayed(2.0, function() {
            Actuate.apply(backgroundItemList[0].noColorView, { alpha: 1.0, offsetX: 0.0 });
            backgroundItemList[0].noColorView.visibility = ViewVisibility.VISIBLE;

            Actuate.tween(backgroundItemList[0].hasColorView, 1.0, { alpha: 0.0 }).ease(Linear.easeNone).onComplete(function() {
                backgroundItemList[0].hasColorView.visibility = ViewVisibility.GONE;
            });

            Actuate.tween(backgroundItemList[0].noColorView, 2.0, { alpha: 0.0, offsetX: -256.0 }).delay(1.0).onComplete(function() {
                backgroundItemList[0].noColorView.visibility = ViewVisibility.GONE;
            });

            Actuate.apply(backgroundItemList[1].hasColorView, { alpha: 0.0, offsetX: 256.0 });
            backgroundItemList[1].hasColorView.visibility = ViewVisibility.VISIBLE;
            Actuate.tween(backgroundItemList[1].hasColorView, 2.0, { alpha: 1.0, offsetX: 0.0 }).delay(1.0);

            Common.runDelayed(3.0, function() {
                Actuate.apply(backgroundItemList[1].noColorView, { alpha: 1.0, offsetX: 0.0 });
                backgroundItemList[1].noColorView.visibility = ViewVisibility.VISIBLE;

                Actuate.tween(backgroundItemList[1].hasColorView, 1.0, { alpha: 0.0 }).ease(Linear.easeNone).onComplete(function() {
                    backgroundItemList[1].hasColorView.visibility = ViewVisibility.GONE;
                });

                Actuate.tween(backgroundItemList[1].noColorView, 2.0, { alpha: 0.0, offsetX: -256.0 }).delay(1.0).onComplete(function() {
                    backgroundItemList[1].noColorView.visibility = ViewVisibility.GONE;
                });

                Actuate.apply(backgroundItemList[2].hasColorView, { alpha: 0.0, offsetX: 256.0 });
                backgroundItemList[2].hasColorView.visibility = ViewVisibility.VISIBLE;
                Actuate.tween(backgroundItemList[2].hasColorView, 2.0, { alpha: 1.0, offsetX: 0.0 }).delay(1.0);

                Common.runDelayed(3.0, function() {
                    Actuate.apply(backgroundItemList[2].noColorView, { alpha: 1.0, offsetX: 0.0 });
                    backgroundItemList[2].noColorView.visibility = ViewVisibility.VISIBLE;

                    Actuate.tween(backgroundItemList[2].hasColorView, 1.0, { alpha: 0.0 }).ease(Linear.easeNone).onComplete(function() {
                        backgroundItemList[2].hasColorView.visibility = ViewVisibility.GONE;
                    });

                    Actuate.apply(nextBtn, { alpha: 0.0 });
                    nextBtn.visibility = ViewVisibility.VISIBLE;

                    Actuate.tween(nextBtn, 1.0, { alpha: 1.0 }).delay(1.0);

                    Common.runDelayed(1.5, function() {
                        nextBtn.disabled = false;
                    });
                });
            });
        });
    }

    private function introPart2():Void {
        nextBtn.disabled = true;
        Actuate.tween(nextBtn, 1.0, { alpha: 0.0 });

        Actuate.tween(introText1View, 1.0, { alpha: 0.0, offsetY: 32.0 }).onComplete(function() {
            introText1View.visibility = ViewVisibility.GONE;
        });

        Actuate.apply(catSmallView, { alpha: 0.0, scaleX: 2.0, scaleY: 2.0, offsetY: 0.0 });
        catSmallView.visibility = ViewVisibility.VISIBLE;
        Actuate.tween(catSmallView, 1.0, { alpha: 1.0, scaleX: 1.0, scaleY: 1.0 }).delay(1.0);

        Actuate.apply(introText2View, { alpha: 0.0, offsetY: -32.0 });
        introText2View.visibility = ViewVisibility.VISIBLE;
        Actuate.tween(introText2View, 1.0, { alpha: 1.0, offsetY: 0.0 }).delay(2.0);

        Actuate.tween(nextBtn, 1.0, { alpha: 1.0 }, false).delay(3.0);

        Common.runDelayed(3.5, function() {
            nextBtn.disabled = false;
        });
    }

    private function introPart3():Void {
        nextBtn.disabled = true;
        Actuate.tween(nextBtn, 1.0, { alpha: 0.0 });

        Actuate.tween(introText2View, 1.0, { alpha: 0.0, offsetY: 32.0 }).onComplete(function() {
            introText2View.visibility = ViewVisibility.GONE;
        });

        Actuate.apply(introText3View, { alpha: 0.0, offsetY: -32.0 });
        introText3View.visibility = ViewVisibility.VISIBLE;
        Actuate.tween(introText3View, 1.0, { alpha: 1.0, offsetY: 0.0 }).delay(1.0);

        Actuate.tween(nextBtn, 1.0, { alpha: 1.0 }, false).delay(1.0);

        Common.runDelayed(1.5, function() {
            nextBtn.disabled = false;
        });
    }

    private function introPart4():Void {
        nextBtn.disabled = true;
        Actuate.tween(nextBtn, 1.0, { alpha: 0.0 });

        Actuate.tween(snakeSmallView, 1.0, { alpha: 0.0, offsetY: 32.0 }).onComplete(function() {
            snakeSmallView.visibility = ViewVisibility.GONE;
        });

        Actuate.tween(catSmallView, 1.0, { alpha: 0.0, offsetY: 32.0 }).onComplete(function() {
            catSmallView.visibility = ViewVisibility.GONE;
        });

        Actuate.tween(introText3View, 1.0, { alpha: 0.0, offsetY: 32.0 }).onComplete(function() {
            introText3View.visibility = ViewVisibility.GONE;
        });

        Actuate.apply(vsGroupView, { alpha: 0.0, offsetY: -32.0 });
        vsGroupView.visibility = ViewVisibility.VISIBLE;
        Actuate.tween(vsGroupView, 1.0, { alpha: 1.0, offsetY: 0.0 }).delay(1.0);

        Actuate.tween(nextBtn, 1.0, { alpha: 1.0 }, false).delay(1.0);

        Common.runDelayed(1.5, function() {
            nextBtn.disabled = false;
        });
    }
}
