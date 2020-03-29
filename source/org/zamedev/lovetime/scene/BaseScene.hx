package org.zamedev.lovetime.scene;

import openfl.events.MouseEvent;
import org.zamedev.lovetime.SoundManager;
import org.zamedev.ui.Scene;
import org.zamedev.ui.view.ViewGroup;

class BaseScene extends Scene {
    private var app:App;
    private var soundManager:SoundManager;
    private var viewGroup:ViewGroup;

    override public function create() {
        super.create();

        app = cast application;
        soundManager = app.soundManager;
    }

    private function attachPressSounds():Void {
        for (view in viewGroup.findViewsByTag("pressSound")) {
            view.addEventListener(MouseEvent.MOUSE_DOWN, function(_) {
                soundManager.playSound(soundManager.pressSound);
            });
        }
    }
}
