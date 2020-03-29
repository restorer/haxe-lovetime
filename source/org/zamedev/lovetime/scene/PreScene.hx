package org.zamedev.lovetime.scene;

import haxe.Timer;
import openfl.display.Bitmap;
import openfl.display.BitmapData;
import openfl.display.PixelSnapping;
import openfl.events.Event;
import openfl.events.MouseEvent;
import org.zamedev.ui.Scene;
import org.zamedev.ui.view.ImageView;
import org.zamedev.ui.view.TextView;
import org.zamedev.ui.view.View;
import org.zamedev.ui.view.ViewGroup;

typedef CellInfo = {
    bitmap:Bitmap,
    y:Float,
};

typedef RowColInfo = {
    row:Int,
    col:Int,
};

typedef CellPosition = {
    x:Float,
    y:Float,
};

class PreScene extends BaseScene {
    private var backgroundImageView:ImageView;
    private var titleTextView:TextView;
    private var containerView:View;
    private var cellMap:Array<Array<CellInfo>>;
    private var catGroupView:ViewGroup;
    private var catPos:RowColInfo;

    override public function create() {
        super.create();

        contentView = (viewGroup = cast context.inflater.inflate(R.layout.scene_pre));
        attachPressSounds();

        backgroundImageView = cast viewGroup.findViewById("background_image");
        titleTextView = cast viewGroup.findViewById("title_text");
        containerView = cast viewGroup.findViewById("container");
        catGroupView = cast viewGroup.findViewById("cat_group");

        createCellMap([
            [   0,  0,  0,  0,  0,  0,  4,  4,  0,  3,  3   ],
            [ 0,  0,  0,  0,  0,  2,  2,  0,  4,  3,  3,  3 ],
            [   1,  1,  0,  0,  2,  2,  2,  0,  0,  3,  3   ],
            [ 1,  1,  1,  4,  0,  2,  2,  0,  0,  0,  0,  0 ],
            [   1,  1,  0,  4,  4,  0,  0,  0,  0,  0,  0   ],
        ]);

        viewGroup.findViewById("play_btn").addEventListener(MouseEvent.CLICK, function(_) {
            app.changeScene(app.gameScene);
        });

        addEventListener(Scene.ADDING_TO_STAGE, onAddingToStage);
        addEventListener(Event.REMOVED_FROM_STAGE, onRemovedFromStage);
    }

    private function onAddingToStage(_):Void {
        soundManager.playBgm(soundManager.preBgm);

        switch (app.currentEpisode) {
            case 1:
                catPos = { row: 3, col: 1 };
                titleTextView.text = context.resourceManager.getString(R.string.pre_title_1);
                backgroundImageView.drawable = context.resourceManager.getDrawable(R.drawable.background_ep1_nocolor);

            case 2:
                catPos = { row: 2, col: 5 };
                titleTextView.text = context.resourceManager.getString(R.string.pre_title_2);
                backgroundImageView.drawable = context.resourceManager.getDrawable(R.drawable.background_ep2_nocolor);

            case 3:
                catPos = { row: 1, col: 10 };
                titleTextView.text = context.resourceManager.getString(R.string.pre_title_3);
                backgroundImageView.drawable = context.resourceManager.getDrawable(R.drawable.background_ep3_nocolor);
        };

        var pos = computeCellPosition(catPos.row, catPos.col);
        catGroupView.x = pos.x + 7;
        catGroupView.y = pos.y - 25;

        sceneSprite.addEventListener(Event.ENTER_FRAME, onEnterFrame);
    }

    private function onRemovedFromStage(_):Void {
        sceneSprite.removeEventListener(Event.ENTER_FRAME, onEnterFrame);
    }

    private function onEnterFrame(_):Void {
        var row = 0;
        var dt = Timer.stamp();

        for (line in cellMap) {
            var col = 0;

            for (info in line) {
                var off = Math.sin(dt * 2.0 + (row + col) * 0.5) * 5.0;

                if (info != null) {
                    info.bitmap.y = info.y + off;
                }

                if (row == catPos.row && col == catPos.col) {
                    catGroupView.offsetY = off;
                }

                col++;
            }

            row++;
        }
    }

    private function createCellMap(map:Array<Array<Int>>):Void {
        var bitmapDataList:Array<BitmapData> = [
            context.resourceManager.getDrawable(R.drawable.tile_ep1).resolveBitmapData(),
            context.resourceManager.getDrawable(R.drawable.tile_ep2).resolveBitmapData(),
            context.resourceManager.getDrawable(R.drawable.tile_ep3).resolveBitmapData(),
            context.resourceManager.getDrawable(R.drawable.tile_hollow).resolveBitmapData(),
        ];

        var row = 0;
        var containerSprite = containerView.sprite;
        cellMap = new Array<Array<CellInfo>>();

        for (list in map) {
            var col = 0;
            var line = new Array<CellInfo>();

            for (item in list) {
                if (item > 0) {
                    var pos = computeCellPosition(row, col);

                    var bitmap = new Bitmap(bitmapDataList[item - 1], PixelSnapping.AUTO, true);
                    bitmap.x = pos.x;
                    bitmap.y = pos.y;
                    containerSprite.addChild(bitmap);

                    line.push({
                        bitmap: bitmap,
                        y: bitmap.y,
                    });
                } else {
                    line.push(null);
                }

                col++;
            }

            cellMap.push(line);
            row++;
        }
    }

    private function computeCellPosition(row:Int, col:Int):CellPosition {
        return {
            x: 65 * col + ((row + 1) % 2) * 32 - 65 * 6 + 512,
            y: 50 * row - 50 * 2.6 + 384,
        };
    }
}
