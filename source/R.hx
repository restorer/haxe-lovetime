package ;

import org.zamedev.ui.graphics.Dimension;
import org.zamedev.ui.graphics.DimensionType;
import org.zamedev.ui.graphics.Drawable;
import org.zamedev.ui.graphics.DrawableType;
import org.zamedev.ui.graphics.FontExt;
import org.zamedev.ui.graphics.GravityType;
import org.zamedev.ui.graphics.TextAlignExt;
import org.zamedev.ui.res.ResourceManager;
import org.zamedev.ui.res.Selector;
import org.zamedev.ui.res.Style;
import org.zamedev.ui.res.Styleable;
import org.zamedev.ui.view.ImageView;
import org.zamedev.ui.view.LayoutParams;
import org.zamedev.ui.view.Rect;
import org.zamedev.ui.view.TextView;
import org.zamedev.ui.view.View;
import org.zamedev.ui.view.ViewVisibility;
import org.zamedev.ui.widget.AbsoluteLayout;
import org.zamedev.ui.widget.Button;
import org.zamedev.ui.widget.LinearLayout;
import org.zamedev.ui.widget.LinearLayoutOrientation;

@:access(org.zamedev.ui.res.ResourceManager)
class R {
	public static var nameToIdMap:Map<String, Int> = [
		"drawable/background_ep1_hascolor" => 1,
		"drawable/background_ep1_nocolor" => 2,
		"drawable/background_ep2_hascolor" => 3,
		"drawable/background_ep2_nocolor" => 4,
		"drawable/background_ep3_hascolor" => 5,
		"drawable/background_ep3_nocolor" => 6,
		"drawable/packed_1" => 7,
		"layout/scene_end" => 8,
		"layout/scene_game" => 9,
		"layout/scene_pre" => 10,
		"layout/scene_start" => 11,
		"color/common_text" => 12,
		"color/game_photoBorder_fillColor" => 13,
		"color/game_right_text" => 14,
		"color/game_wrong_text" => 15,
		"dimen/start_intro_textSize" => 16,
		"dimen/start_vs_textSize" => 17,
		"dimen/start_next_textSize" => 18,
		"dimen/pre_title_textSize" => 19,
		"dimen/pre_play_textSize" => 20,
		"dimen/game_title_textSize" => 21,
		"dimen/game_result_textSize" => 22,
		"dimen/end_result_textSize" => 23,
		"dimen/end_restart_textSize" => 24,
		"drawable/snake_big" => 25,
		"drawable/cat_big" => 26,
		"drawable/snake_small" => 27,
		"drawable/cat_small" => 28,
		"drawable/tile_ep2" => 29,
		"drawable/tile_ep3" => 30,
		"drawable/tile_todo" => 31,
		"drawable/tile_ep1" => 32,
		"drawable/tile_current" => 33,
		"drawable/tile_done" => 34,
		"drawable/tile_hollow" => 35,
		"drawable/cat_avatar" => 36,
		"drawable/cat_avatar_shadow" => 37,
		"font/primary" => 38,
		"string/start_intro_1" => 39,
		"string/start_intro_2" => 40,
		"string/start_intro_3" => 41,
		"string/start_vs" => 42,
		"string/start_next" => 43,
		"string/pre_title_1" => 44,
		"string/pre_title_2" => 45,
		"string/pre_title_3" => 46,
		"string/pre_play" => 47,
		"string/game_title" => 48,
		"string/game_wrong_1" => 49,
		"string/game_wrong_2" => 50,
		"string/game_wrong_3" => 51,
		"string/game_right_1" => 52,
		"string/game_right_2" => 53,
		"string/game_right_3" => 54,
		"string/end_restart" => 55,
		"string/end_result" => 56,
		"style/common_text" => 57,
		"selector/common_button" => 58,
	];

	public static var color = {
		common_text: 12,
		game_photoBorder_fillColor: 13,
		game_right_text: 14,
		game_wrong_text: 15,
	};

	public static var dimen = {
		start_intro_textSize: 16,
		start_vs_textSize: 17,
		start_next_textSize: 18,
		pre_title_textSize: 19,
		pre_play_textSize: 20,
		game_title_textSize: 21,
		game_result_textSize: 22,
		end_result_textSize: 23,
		end_restart_textSize: 24,
	};

	public static var string = {
		start_intro_1: 39,
		start_intro_2: 40,
		start_intro_3: 41,
		start_vs: 42,
		start_next: 43,
		pre_title_1: 44,
		pre_title_2: 45,
		pre_title_3: 46,
		pre_play: 47,
		game_title: 48,
		game_wrong_1: 49,
		game_wrong_2: 50,
		game_wrong_3: 51,
		game_right_1: 52,
		game_right_2: 53,
		game_right_3: 54,
		end_restart: 55,
		end_result: 56,
	};

	public static var font = {
		primary: 38,
	};

	public static var drawable = {
		background_ep1_hascolor: 1,
		background_ep1_nocolor: 2,
		background_ep2_hascolor: 3,
		background_ep2_nocolor: 4,
		background_ep3_hascolor: 5,
		background_ep3_nocolor: 6,
		packed_1: 7,
		snake_big: 25,
		cat_big: 26,
		snake_small: 27,
		cat_small: 28,
		tile_ep2: 29,
		tile_ep3: 30,
		tile_todo: 31,
		tile_ep1: 32,
		tile_current: 33,
		tile_done: 34,
		tile_hollow: 35,
		cat_avatar: 36,
		cat_avatar_shadow: 37,
	};

	public static var style = {
		common_text: 57,
	};

	public static var selector = {
		common_button: 58,
	};

	public static var layout = {
		scene_end: 8,
		scene_game: 9,
		scene_pre: 10,
		scene_start: 11,
	};

	public static function _loadInto(r:ResourceManager, locale:String):Void {
		r.colorMap[color.common_text] = 0x4c7180;
		r.colorMap[color.game_photoBorder_fillColor] = 0xffffff;
		r.colorMap[color.game_right_text] = 0x648c44;
		r.colorMap[color.game_wrong_text] = 0xe07850;

		r.dimenMap[dimen.start_intro_textSize] = Dimension.EXACT(48);
		r.dimenMap[dimen.start_vs_textSize] = Dimension.EXACT(150);
		r.dimenMap[dimen.start_next_textSize] = Dimension.EXACT(72);
		r.dimenMap[dimen.pre_title_textSize] = Dimension.EXACT(48);
		r.dimenMap[dimen.pre_play_textSize] = Dimension.EXACT(72);
		r.dimenMap[dimen.game_title_textSize] = Dimension.EXACT(48);
		r.dimenMap[dimen.game_result_textSize] = Dimension.EXACT(48);
		r.dimenMap[dimen.end_result_textSize] = Dimension.EXACT(48);
		r.dimenMap[dimen.end_restart_textSize] = Dimension.EXACT(72);

		r.stringMap[string.start_intro_1] = "Доктор Вредник похитил все цвета...";
		r.stringMap[string.start_intro_2] = "Помоги доброму котёнку вернуть их";
		r.stringMap[string.start_intro_3] = "Для этого расположи\nнаши фографии\nв правильном порядке";
		r.stringMap[string.start_vs] = "VS";
		r.stringMap[string.start_next] = "Далее >";
		r.stringMap[string.pre_title_1] = "Эпизод 1:\nМексикос";
		r.stringMap[string.pre_title_2] = "Эпизод 2:\nПустынное солнце";
		r.stringMap[string.pre_title_3] = "Эпизод 3:\nТуманный лес";
		r.stringMap[string.pre_play] = "Играть!";
		r.stringMap[string.game_title] = "Выбери то фото,\nкоторое сфотано раньше";
		r.stringMap[string.game_wrong_1] = "Как же так...";
		r.stringMap[string.game_wrong_2] = "Попробуй ещё...";
		r.stringMap[string.game_wrong_3] = "Увы :(";
		r.stringMap[string.game_right_1] = "Правильно!";
		r.stringMap[string.game_right_2] = "Люблю :*";
		r.stringMap[string.game_right_3] = "Молодец!";
		r.stringMap[string.end_restart] = "Заново";
		r.stringMap[string.end_result] = "Ты прошла игру :*\nЯ тебя люблю :*";

		r.fontMap[font.primary] = FontExt.createTtf("font/Neucha.ttf");

		r.drawableMap[drawable.background_ep1_hascolor] = Drawable.fromAssetBitmap("drawable/background_ep1_hascolor.png");
		r.drawableMap[drawable.background_ep1_nocolor] = Drawable.fromAssetBitmap("drawable/background_ep1_nocolor.png");
		r.drawableMap[drawable.background_ep2_hascolor] = Drawable.fromAssetBitmap("drawable/background_ep2_hascolor.png");
		r.drawableMap[drawable.background_ep2_nocolor] = Drawable.fromAssetBitmap("drawable/background_ep2_nocolor.png");
		r.drawableMap[drawable.background_ep3_hascolor] = Drawable.fromAssetBitmap("drawable/background_ep3_hascolor.png");
		r.drawableMap[drawable.background_ep3_nocolor] = Drawable.fromAssetBitmap("drawable/background_ep3_nocolor.png");
		r.drawableMap[drawable.packed_1] = Drawable.fromAssetBitmap("drawable/packed_1.png");
		r.drawableMap[drawable.snake_big] = Drawable.fromAssetPacked("drawable/packed_1.png", 1, 1, 284, 321);
		r.drawableMap[drawable.cat_big] = Drawable.fromAssetPacked("drawable/packed_1.png", 1, 323, 284, 318);
		r.drawableMap[drawable.snake_small] = Drawable.fromAssetPacked("drawable/packed_1.png", 1, 642, 150, 170);
		r.drawableMap[drawable.cat_small] = Drawable.fromAssetPacked("drawable/packed_1.png", 1, 813, 150, 168);
		r.drawableMap[drawable.tile_ep2] = Drawable.fromAssetPacked("drawable/packed_1.png", 152, 813, 65, 89);
		r.drawableMap[drawable.tile_ep3] = Drawable.fromAssetPacked("drawable/packed_1.png", 152, 903, 65, 89);
		r.drawableMap[drawable.tile_todo] = Drawable.fromAssetPacked("drawable/packed_1.png", 218, 903, 65, 89);
		r.drawableMap[drawable.tile_ep1] = Drawable.fromAssetPacked("drawable/packed_1.png", 284, 903, 65, 89);
		r.drawableMap[drawable.tile_current] = Drawable.fromAssetPacked("drawable/packed_1.png", 350, 903, 65, 89);
		r.drawableMap[drawable.tile_done] = Drawable.fromAssetPacked("drawable/packed_1.png", 416, 903, 65, 89);
		r.drawableMap[drawable.tile_hollow] = Drawable.fromAssetPacked("drawable/packed_1.png", 482, 903, 65, 76);
		r.drawableMap[drawable.cat_avatar] = Drawable.fromAssetPacked("drawable/packed_1.png", 548, 903, 50, 58);
		r.drawableMap[drawable.cat_avatar_shadow] = Drawable.fromAssetPacked("drawable/packed_1.png", 1, 993, 32, 16);

		r.styleMap[style.common_text] = new Style([
			Styleable.textColor => r.colorMap[color.common_text],
			Styleable.textAlign => TextAlignExt.CENTER,
			Styleable.font => r.fontMap[font.primary],
		]);

		r.selectorMap[selector.common_button] = new Selector([
			Styleable.alpha => [{
				stateMap: [
					"pressed" => true,
				],
				value: 0.5,
			}, {
				stateMap: new Map<String, Bool>(),
				value: 1,
			}],
		]);

		r.layoutMap[layout.scene_end] = _inflateLayout_scene_end;
		r.layoutMap[layout.scene_game] = _inflateLayout_scene_game;
		r.layoutMap[layout.scene_pre] = _inflateLayout_scene_pre;
		r.layoutMap[layout.scene_start] = _inflateLayout_scene_start;
	}

	private static function _inflateLayout_scene_end(l:LayoutParams, r:ResourceManager):View {
		var v1 = new AbsoluteLayout(r.context);
		v1.onInflateStarted();
		v1.layoutParams = (l == null ? new LayoutParams() : l);
		v1.inflate(Styleable.layout_width, Dimension.MATCH_PARENT);
		v1.inflate(Styleable.layout_height, Dimension.MATCH_PARENT);

		var v2 = new ImageView(r.context);
		v2.onInflateStarted();
		v2.layoutParams = v1.createLayoutParams();
		v2.inflate(Styleable.layout_x, Dimension.EXACT(0));
		v2.inflate(Styleable.layout_y, Dimension.EXACT(0));
		v2.inflate(Styleable.drawable, r.drawableMap[drawable.background_ep1_hascolor]);
		v2.inflate(Styleable.id, "background_ep1_hascolor");
		v2.inflate(Styleable.visibility, ViewVisibility.GONE);
		v2.onInflateFinished();
		v1.addChild(v2, false);

		var v3 = new ImageView(r.context);
		v3.onInflateStarted();
		v3.layoutParams = v1.createLayoutParams();
		v3.inflate(Styleable.layout_x, Dimension.EXACT(0));
		v3.inflate(Styleable.layout_y, Dimension.EXACT(0));
		v3.inflate(Styleable.drawable, r.drawableMap[drawable.background_ep1_nocolor]);
		v3.inflate(Styleable.id, "background_ep1_nocolor");
		v3.inflate(Styleable.visibility, ViewVisibility.GONE);
		v3.onInflateFinished();
		v1.addChild(v3, false);

		var v4 = new ImageView(r.context);
		v4.onInflateStarted();
		v4.layoutParams = v1.createLayoutParams();
		v4.inflate(Styleable.layout_x, Dimension.EXACT(0));
		v4.inflate(Styleable.layout_y, Dimension.EXACT(0));
		v4.inflate(Styleable.drawable, r.drawableMap[drawable.background_ep2_hascolor]);
		v4.inflate(Styleable.id, "background_ep2_hascolor");
		v4.inflate(Styleable.visibility, ViewVisibility.GONE);
		v4.onInflateFinished();
		v1.addChild(v4, false);

		var v5 = new ImageView(r.context);
		v5.onInflateStarted();
		v5.layoutParams = v1.createLayoutParams();
		v5.inflate(Styleable.layout_x, Dimension.EXACT(0));
		v5.inflate(Styleable.layout_y, Dimension.EXACT(0));
		v5.inflate(Styleable.drawable, r.drawableMap[drawable.background_ep2_nocolor]);
		v5.inflate(Styleable.id, "background_ep2_nocolor");
		v5.inflate(Styleable.visibility, ViewVisibility.GONE);
		v5.onInflateFinished();
		v1.addChild(v5, false);

		var v6 = new ImageView(r.context);
		v6.onInflateStarted();
		v6.layoutParams = v1.createLayoutParams();
		v6.inflate(Styleable.layout_x, Dimension.EXACT(0));
		v6.inflate(Styleable.layout_y, Dimension.EXACT(0));
		v6.inflate(Styleable.drawable, r.drawableMap[drawable.background_ep3_hascolor]);
		v6.inflate(Styleable.id, "background_ep3_hascolor");
		v6.inflate(Styleable.visibility, ViewVisibility.GONE);
		v6.onInflateFinished();
		v1.addChild(v6, false);

		var v7 = new ImageView(r.context);
		v7.onInflateStarted();
		v7.layoutParams = v1.createLayoutParams();
		v7.inflate(Styleable.layout_x, Dimension.EXACT(0));
		v7.inflate(Styleable.layout_y, Dimension.EXACT(0));
		v7.inflate(Styleable.drawable, r.drawableMap[drawable.background_ep3_nocolor]);
		v7.inflate(Styleable.id, "background_ep3_nocolor");
		v7.inflate(Styleable.visibility, ViewVisibility.GONE);
		v7.onInflateFinished();
		v1.addChild(v7, false);

		var v8 = new ImageView(r.context);
		v8.onInflateStarted();
		v8.layoutParams = v1.createLayoutParams();
		v8.inflate(Styleable.layout_cy, Dimension.WEIGHT_PARENT(0.5, DimensionType.UNSPECIFIED, false));
		v8.inflate(Styleable.layout_cx, Dimension.WEIGHT_PARENT(0.5, DimensionType.UNSPECIFIED, false));
		v8.inflate(Styleable.drawable, r.drawableMap[drawable.snake_big]);
		v8.inflate(Styleable.id, "snake");
		v8.onInflateFinished();
		v1.addChild(v8, false);

		var v9 = new TextView(r.context);
		v9.onInflateStarted();
		v9.layoutParams = v1.createLayoutParams();
		r.styleMap[style.common_text].apply(v9);
		v9.inflate(Styleable.layout_cy, Dimension.WEIGHT_PARENT(0.25, DimensionType.UNSPECIFIED, false));
		v9.inflate(Styleable.layout_cx, Dimension.WEIGHT_PARENT(0.5, DimensionType.UNSPECIFIED, false));
		v9.inflate(Styleable.text, r.stringMap[string.end_result]);
		v9.inflate(Styleable.textAlign, TextAlignExt.CENTER);
		v9.inflate(Styleable.id, "result_text");
		v9.inflate(Styleable.textSize, r.dimenMap[dimen.end_result_textSize]);
		v9.inflate(Styleable.visibility, ViewVisibility.GONE);
		v9.onInflateFinished();
		v1.addChild(v9, false);

		var v10 = new Button(r.context);
		v10.onInflateStarted();
		v10.layoutParams = v1.createLayoutParams();
		r.styleMap[style.common_text].apply(v10);
		v10.inflate(Styleable.layout_cy, Dimension.EXACT(690));
		v10.inflate(Styleable.layout_cx, Dimension.WEIGHT_PARENT(0.5, DimensionType.UNSPECIFIED, false));
		v10.inflate(Styleable.selector, r.selectorMap[selector.common_button]);
		v10.inflate(Styleable.text, r.stringMap[string.end_restart]);
		v10.inflate(Styleable.id, "restart_btn");
		v10.inflate(Styleable.tags, ["pressSound"]);
		v10.inflate(Styleable.textSize, r.dimenMap[dimen.end_restart_textSize]);
		v10.inflate(Styleable.font, r.fontMap[font.primary]);
		v10.inflate(Styleable.visibility, ViewVisibility.GONE);
		v10.onInflateFinished();
		v1.addChild(v10, false);

		v1.onInflateFinished();
		return v1;
	}

	private static function _inflateLayout_scene_game(l:LayoutParams, r:ResourceManager):View {
		var v1 = new AbsoluteLayout(r.context);
		v1.onInflateStarted();
		v1.layoutParams = (l == null ? new LayoutParams() : l);
		v1.inflate(Styleable.layout_width, Dimension.MATCH_PARENT);
		v1.inflate(Styleable.layout_height, Dimension.MATCH_PARENT);

		var v2 = new ImageView(r.context);
		v2.onInflateStarted();
		v2.layoutParams = v1.createLayoutParams();
		v2.inflate(Styleable.layout_x, Dimension.EXACT(0));
		v2.inflate(Styleable.layout_y, Dimension.EXACT(0));
		v2.inflate(Styleable.id, "background_image");
		v2.onInflateFinished();
		v1.addChild(v2, false);

		var v3 = new TextView(r.context);
		v3.onInflateStarted();
		v3.layoutParams = v1.createLayoutParams();
		r.styleMap[style.common_text].apply(v3);
		v3.inflate(Styleable.layout_cy, Dimension.EXACT(90));
		v3.inflate(Styleable.layout_cx, Dimension.WEIGHT_PARENT(0.5, DimensionType.UNSPECIFIED, false));
		v3.inflate(Styleable.text, r.stringMap[string.game_title]);
		v3.inflate(Styleable.textSize, r.dimenMap[dimen.game_title_textSize]);
		v3.onInflateFinished();
		v1.addChild(v3, false);

		var v4 = new AbsoluteLayout(r.context);
		v4.onInflateStarted();
		v4.layoutParams = v1.createLayoutParams();
		v4.inflate(Styleable.layout_cy, Dimension.WEIGHT_PARENT(0.5, DimensionType.UNSPECIFIED, false));
		v4.inflate(Styleable.layout_cx, Dimension.WEIGHT_PARENT(0.25, DimensionType.UNSPECIFIED, false));
		v4.inflate(Styleable.id, "left_photo_group");

		var v5 = new Rect(r.context);
		v5.onInflateStarted();
		v5.layoutParams = v4.createLayoutParams();
		v5.inflate(Styleable.layout_x, Dimension.EXACT(0));
		v5.inflate(Styleable.layout_y, Dimension.EXACT(0));
		v5.inflate(Styleable.id, "left_photo_border");
		v5.inflate(Styleable.fillColor, r.colorMap[color.game_photoBorder_fillColor]);
		v5.onInflateFinished();
		v4.addChild(v5, false);

		var v6 = new ImageView(r.context);
		v6.onInflateStarted();
		v6.layoutParams = v4.createLayoutParams();
		v6.inflate(Styleable.layout_x, Dimension.EXACT(10));
		v6.inflate(Styleable.layout_y, Dimension.EXACT(10));
		v6.inflate(Styleable.id, "left_photo_image");
		v6.onInflateFinished();
		v4.addChild(v6, false);

		v4.onInflateFinished();
		v1.addChild(v4, false);

		var v7 = new AbsoluteLayout(r.context);
		v7.onInflateStarted();
		v7.layoutParams = v1.createLayoutParams();
		v7.inflate(Styleable.layout_cy, Dimension.WEIGHT_PARENT(0.5, DimensionType.UNSPECIFIED, false));
		v7.inflate(Styleable.layout_cx, Dimension.WEIGHT_PARENT(0.75, DimensionType.UNSPECIFIED, false));
		v7.inflate(Styleable.id, "right_photo_group");

		var v8 = new Rect(r.context);
		v8.onInflateStarted();
		v8.layoutParams = v7.createLayoutParams();
		v8.inflate(Styleable.layout_x, Dimension.EXACT(0));
		v8.inflate(Styleable.layout_y, Dimension.EXACT(0));
		v8.inflate(Styleable.id, "right_photo_border");
		v8.inflate(Styleable.fillColor, r.colorMap[color.game_photoBorder_fillColor]);
		v8.onInflateFinished();
		v7.addChild(v8, false);

		var v9 = new ImageView(r.context);
		v9.onInflateStarted();
		v9.layoutParams = v7.createLayoutParams();
		v9.inflate(Styleable.layout_x, Dimension.EXACT(10));
		v9.inflate(Styleable.layout_y, Dimension.EXACT(10));
		v9.inflate(Styleable.id, "right_photo_image");
		v9.onInflateFinished();
		v7.addChild(v9, false);

		v7.onInflateFinished();
		v1.addChild(v7, false);

		var v10 = new TextView(r.context);
		v10.onInflateStarted();
		v10.layoutParams = v1.createLayoutParams();
		v10.inflate(Styleable.layout_cy, Dimension.EXACT(630));
		v10.inflate(Styleable.layout_cx, Dimension.WEIGHT_PARENT(0.25, DimensionType.UNSPECIFIED, false));
		v10.inflate(Styleable.id, "left_photo_result_text");
		v10.inflate(Styleable.textSize, r.dimenMap[dimen.game_result_textSize]);
		v10.inflate(Styleable.font, r.fontMap[font.primary]);
		v10.inflate(Styleable.visibility, ViewVisibility.GONE);
		v10.onInflateFinished();
		v1.addChild(v10, false);

		var v11 = new TextView(r.context);
		v11.onInflateStarted();
		v11.layoutParams = v1.createLayoutParams();
		v11.inflate(Styleable.layout_cy, Dimension.EXACT(630));
		v11.inflate(Styleable.layout_cx, Dimension.WEIGHT_PARENT(0.75, DimensionType.UNSPECIFIED, false));
		v11.inflate(Styleable.id, "right_photo_result_text");
		v11.inflate(Styleable.textSize, r.dimenMap[dimen.game_result_textSize]);
		v11.inflate(Styleable.font, r.fontMap[font.primary]);
		v11.inflate(Styleable.visibility, ViewVisibility.GONE);
		v11.onInflateFinished();
		v1.addChild(v11, false);

		var v12 = new LinearLayout(r.context);
		v12.onInflateStarted();
		v12.layoutParams = v1.createLayoutParams();
		v12.inflate(Styleable.layout_cx, Dimension.WEIGHT_PARENT(0.5, DimensionType.UNSPECIFIED, false));
		v12.inflate(Styleable.layout_y, Dimension.EXACT(660));
		v12.inflate(Styleable.orientation, LinearLayoutOrientation.HORIZONTAL);

		var v13 = new ImageView(r.context);
		v13.onInflateStarted();
		v13.layoutParams = v12.createLayoutParams();
		v13.inflate(Styleable.drawable, r.drawableMap[drawable.tile_todo]);
		v13.onInflateFinished();
		v12.addChild(v13, false);

		var v14 = new ImageView(r.context);
		v14.onInflateStarted();
		v14.layoutParams = v12.createLayoutParams();
		v14.inflate(Styleable.drawable, r.drawableMap[drawable.tile_todo]);
		v14.onInflateFinished();
		v12.addChild(v14, false);

		var v15 = new ImageView(r.context);
		v15.onInflateStarted();
		v15.layoutParams = v12.createLayoutParams();
		v15.inflate(Styleable.drawable, r.drawableMap[drawable.tile_todo]);
		v15.onInflateFinished();
		v12.addChild(v15, false);

		var v16 = new ImageView(r.context);
		v16.onInflateStarted();
		v16.layoutParams = v12.createLayoutParams();
		v16.inflate(Styleable.drawable, r.drawableMap[drawable.tile_todo]);
		v16.onInflateFinished();
		v12.addChild(v16, false);

		var v17 = new ImageView(r.context);
		v17.onInflateStarted();
		v17.layoutParams = v12.createLayoutParams();
		v17.inflate(Styleable.drawable, r.drawableMap[drawable.tile_todo]);
		v17.onInflateFinished();
		v12.addChild(v17, false);

		v12.onInflateFinished();
		v1.addChild(v12, false);

		var v18 = new LinearLayout(r.context);
		v18.onInflateStarted();
		v18.layoutParams = v1.createLayoutParams();
		v18.inflate(Styleable.layout_cx, Dimension.WEIGHT_PARENT(0.5, DimensionType.UNSPECIFIED, false));
		v18.inflate(Styleable.layout_y, Dimension.EXACT(660));
		v18.inflate(Styleable.orientation, LinearLayoutOrientation.HORIZONTAL);
		v18.inflate(Styleable.id, "current_group");

		var v19 = new ImageView(r.context);
		v19.onInflateStarted();
		v19.layoutParams = v18.createLayoutParams();
		v19.inflate(Styleable.drawable, r.drawableMap[drawable.tile_current]);
		v19.onInflateFinished();
		v18.addChild(v19, false);

		var v20 = new ImageView(r.context);
		v20.onInflateStarted();
		v20.layoutParams = v18.createLayoutParams();
		v20.inflate(Styleable.drawable, r.drawableMap[drawable.tile_current]);
		v20.onInflateFinished();
		v18.addChild(v20, false);

		var v21 = new ImageView(r.context);
		v21.onInflateStarted();
		v21.layoutParams = v18.createLayoutParams();
		v21.inflate(Styleable.drawable, r.drawableMap[drawable.tile_current]);
		v21.onInflateFinished();
		v18.addChild(v21, false);

		var v22 = new ImageView(r.context);
		v22.onInflateStarted();
		v22.layoutParams = v18.createLayoutParams();
		v22.inflate(Styleable.drawable, r.drawableMap[drawable.tile_current]);
		v22.onInflateFinished();
		v18.addChild(v22, false);

		var v23 = new ImageView(r.context);
		v23.onInflateStarted();
		v23.layoutParams = v18.createLayoutParams();
		v23.inflate(Styleable.drawable, r.drawableMap[drawable.tile_current]);
		v23.onInflateFinished();
		v18.addChild(v23, false);

		v18.onInflateFinished();
		v1.addChild(v18, false);

		var v24 = new LinearLayout(r.context);
		v24.onInflateStarted();
		v24.layoutParams = v1.createLayoutParams();
		v24.inflate(Styleable.layout_cx, Dimension.WEIGHT_PARENT(0.5, DimensionType.UNSPECIFIED, false));
		v24.inflate(Styleable.layout_y, Dimension.EXACT(660));
		v24.inflate(Styleable.orientation, LinearLayoutOrientation.HORIZONTAL);
		v24.inflate(Styleable.id, "done_group");

		var v25 = new ImageView(r.context);
		v25.onInflateStarted();
		v25.layoutParams = v24.createLayoutParams();
		v25.inflate(Styleable.drawable, r.drawableMap[drawable.tile_done]);
		v25.onInflateFinished();
		v24.addChild(v25, false);

		var v26 = new ImageView(r.context);
		v26.onInflateStarted();
		v26.layoutParams = v24.createLayoutParams();
		v26.inflate(Styleable.drawable, r.drawableMap[drawable.tile_done]);
		v26.onInflateFinished();
		v24.addChild(v26, false);

		var v27 = new ImageView(r.context);
		v27.onInflateStarted();
		v27.layoutParams = v24.createLayoutParams();
		v27.inflate(Styleable.drawable, r.drawableMap[drawable.tile_done]);
		v27.onInflateFinished();
		v24.addChild(v27, false);

		var v28 = new ImageView(r.context);
		v28.onInflateStarted();
		v28.layoutParams = v24.createLayoutParams();
		v28.inflate(Styleable.drawable, r.drawableMap[drawable.tile_done]);
		v28.onInflateFinished();
		v24.addChild(v28, false);

		var v29 = new ImageView(r.context);
		v29.onInflateStarted();
		v29.layoutParams = v24.createLayoutParams();
		v29.inflate(Styleable.drawable, r.drawableMap[drawable.tile_done]);
		v29.onInflateFinished();
		v24.addChild(v29, false);

		v24.onInflateFinished();
		v1.addChild(v24, false);

		var v30 = new AbsoluteLayout(r.context);
		v30.onInflateStarted();
		v30.layoutParams = v1.createLayoutParams();
		v30.inflate(Styleable.layout_cx, Dimension.EXACT(383));
		v30.inflate(Styleable.layout_width, Dimension.EXACT(50));
		v30.inflate(Styleable.layout_height, Dimension.EXACT(67));
		v30.inflate(Styleable.layout_y, Dimension.EXACT(635));
		v30.inflate(Styleable.id, "cat_group");

		var v31 = new ImageView(r.context);
		v31.onInflateStarted();
		v31.layoutParams = v30.createLayoutParams();
		v31.inflate(Styleable.layout_cx, Dimension.WEIGHT_PARENT(0.5, DimensionType.UNSPECIFIED, false));
		v31.inflate(Styleable.layout_ey, Dimension.WEIGHT_PARENT(1, DimensionType.UNSPECIFIED, false));
		v31.inflate(Styleable.drawable, r.drawableMap[drawable.cat_avatar_shadow]);
		v31.onInflateFinished();
		v30.addChild(v31, false);

		var v32 = new ImageView(r.context);
		v32.onInflateStarted();
		v32.layoutParams = v30.createLayoutParams();
		v32.inflate(Styleable.layout_cx, Dimension.WEIGHT_PARENT(0.5, DimensionType.UNSPECIFIED, false));
		v32.inflate(Styleable.layout_y, Dimension.EXACT(0));
		v32.inflate(Styleable.drawable, r.drawableMap[drawable.cat_avatar]);
		v32.inflate(Styleable.id, "cat");
		v32.onInflateFinished();
		v30.addChild(v32, false);

		v30.onInflateFinished();
		v1.addChild(v30, false);

		v1.onInflateFinished();
		return v1;
	}

	private static function _inflateLayout_scene_pre(l:LayoutParams, r:ResourceManager):View {
		var v1 = new AbsoluteLayout(r.context);
		v1.onInflateStarted();
		v1.layoutParams = (l == null ? new LayoutParams() : l);
		v1.inflate(Styleable.layout_width, Dimension.MATCH_PARENT);
		v1.inflate(Styleable.layout_height, Dimension.MATCH_PARENT);

		var v2 = new ImageView(r.context);
		v2.onInflateStarted();
		v2.layoutParams = v1.createLayoutParams();
		v2.inflate(Styleable.layout_x, Dimension.EXACT(0));
		v2.inflate(Styleable.layout_y, Dimension.EXACT(0));
		v2.inflate(Styleable.id, "background_image");
		v2.onInflateFinished();
		v1.addChild(v2, false);

		var v3 = new TextView(r.context);
		v3.onInflateStarted();
		v3.layoutParams = v1.createLayoutParams();
		r.styleMap[style.common_text].apply(v3);
		v3.inflate(Styleable.layout_cy, Dimension.EXACT(120));
		v3.inflate(Styleable.layout_cx, Dimension.WEIGHT_PARENT(0.5, DimensionType.UNSPECIFIED, false));
		v3.inflate(Styleable.id, "title_text");
		v3.inflate(Styleable.textSize, r.dimenMap[dimen.pre_title_textSize]);
		v3.onInflateFinished();
		v1.addChild(v3, false);

		var v4 = new View(r.context);
		v4.onInflateStarted();
		v4.layoutParams = v1.createLayoutParams();
		v4.inflate(Styleable.layout_x, Dimension.EXACT(0));
		v4.inflate(Styleable.layout_y, Dimension.EXACT(0));
		v4.inflate(Styleable.id, "container");
		v4.onInflateFinished();
		v1.addChild(v4, false);

		var v5 = new AbsoluteLayout(r.context);
		v5.onInflateStarted();
		v5.layoutParams = v1.createLayoutParams();
		v5.inflate(Styleable.layout_x, Dimension.EXACT(0));
		v5.inflate(Styleable.layout_width, Dimension.EXACT(50));
		v5.inflate(Styleable.layout_height, Dimension.EXACT(67));
		v5.inflate(Styleable.layout_y, Dimension.EXACT(0));
		v5.inflate(Styleable.id, "cat_group");

		var v6 = new ImageView(r.context);
		v6.onInflateStarted();
		v6.layoutParams = v5.createLayoutParams();
		v6.inflate(Styleable.layout_cx, Dimension.WEIGHT_PARENT(0.5, DimensionType.UNSPECIFIED, false));
		v6.inflate(Styleable.layout_ey, Dimension.WEIGHT_PARENT(1, DimensionType.UNSPECIFIED, false));
		v6.inflate(Styleable.drawable, r.drawableMap[drawable.cat_avatar_shadow]);
		v6.onInflateFinished();
		v5.addChild(v6, false);

		var v7 = new ImageView(r.context);
		v7.onInflateStarted();
		v7.layoutParams = v5.createLayoutParams();
		v7.inflate(Styleable.layout_cx, Dimension.WEIGHT_PARENT(0.5, DimensionType.UNSPECIFIED, false));
		v7.inflate(Styleable.layout_y, Dimension.EXACT(0));
		v7.inflate(Styleable.drawable, r.drawableMap[drawable.cat_avatar]);
		v7.onInflateFinished();
		v5.addChild(v7, false);

		v5.onInflateFinished();
		v1.addChild(v5, false);

		var v8 = new Button(r.context);
		v8.onInflateStarted();
		v8.layoutParams = v1.createLayoutParams();
		r.styleMap[style.common_text].apply(v8);
		v8.inflate(Styleable.layout_cy, Dimension.EXACT(690));
		v8.inflate(Styleable.layout_cx, Dimension.WEIGHT_PARENT(0.5, DimensionType.UNSPECIFIED, false));
		v8.inflate(Styleable.selector, r.selectorMap[selector.common_button]);
		v8.inflate(Styleable.text, r.stringMap[string.pre_play]);
		v8.inflate(Styleable.id, "play_btn");
		v8.inflate(Styleable.tags, ["pressSound"]);
		v8.inflate(Styleable.textSize, r.dimenMap[dimen.pre_play_textSize]);
		v8.inflate(Styleable.font, r.fontMap[font.primary]);
		v8.onInflateFinished();
		v1.addChild(v8, false);

		v1.onInflateFinished();
		return v1;
	}

	private static function _inflateLayout_scene_start(l:LayoutParams, r:ResourceManager):View {
		var v1 = new AbsoluteLayout(r.context);
		v1.onInflateStarted();
		v1.layoutParams = (l == null ? new LayoutParams() : l);
		v1.inflate(Styleable.layout_width, Dimension.MATCH_PARENT);
		v1.inflate(Styleable.layout_height, Dimension.MATCH_PARENT);

		var v2 = new ImageView(r.context);
		v2.onInflateStarted();
		v2.layoutParams = v1.createLayoutParams();
		v2.inflate(Styleable.layout_x, Dimension.EXACT(0));
		v2.inflate(Styleable.layout_y, Dimension.EXACT(0));
		v2.inflate(Styleable.drawable, r.drawableMap[drawable.background_ep1_nocolor]);
		v2.inflate(Styleable.id, "background_ep1_nocolor");
		v2.inflate(Styleable.visibility, ViewVisibility.GONE);
		v2.onInflateFinished();
		v1.addChild(v2, false);

		var v3 = new ImageView(r.context);
		v3.onInflateStarted();
		v3.layoutParams = v1.createLayoutParams();
		v3.inflate(Styleable.layout_x, Dimension.EXACT(0));
		v3.inflate(Styleable.layout_y, Dimension.EXACT(0));
		v3.inflate(Styleable.drawable, r.drawableMap[drawable.background_ep1_hascolor]);
		v3.inflate(Styleable.id, "background_ep1_hascolor");
		v3.inflate(Styleable.visibility, ViewVisibility.GONE);
		v3.onInflateFinished();
		v1.addChild(v3, false);

		var v4 = new ImageView(r.context);
		v4.onInflateStarted();
		v4.layoutParams = v1.createLayoutParams();
		v4.inflate(Styleable.layout_x, Dimension.EXACT(0));
		v4.inflate(Styleable.layout_y, Dimension.EXACT(0));
		v4.inflate(Styleable.drawable, r.drawableMap[drawable.background_ep2_nocolor]);
		v4.inflate(Styleable.id, "background_ep2_nocolor");
		v4.inflate(Styleable.visibility, ViewVisibility.GONE);
		v4.onInflateFinished();
		v1.addChild(v4, false);

		var v5 = new ImageView(r.context);
		v5.onInflateStarted();
		v5.layoutParams = v1.createLayoutParams();
		v5.inflate(Styleable.layout_x, Dimension.EXACT(0));
		v5.inflate(Styleable.layout_y, Dimension.EXACT(0));
		v5.inflate(Styleable.drawable, r.drawableMap[drawable.background_ep2_hascolor]);
		v5.inflate(Styleable.id, "background_ep2_hascolor");
		v5.inflate(Styleable.visibility, ViewVisibility.GONE);
		v5.onInflateFinished();
		v1.addChild(v5, false);

		var v6 = new ImageView(r.context);
		v6.onInflateStarted();
		v6.layoutParams = v1.createLayoutParams();
		v6.inflate(Styleable.layout_x, Dimension.EXACT(0));
		v6.inflate(Styleable.layout_y, Dimension.EXACT(0));
		v6.inflate(Styleable.drawable, r.drawableMap[drawable.background_ep3_nocolor]);
		v6.inflate(Styleable.id, "background_ep3_nocolor");
		v6.inflate(Styleable.visibility, ViewVisibility.GONE);
		v6.onInflateFinished();
		v1.addChild(v6, false);

		var v7 = new ImageView(r.context);
		v7.onInflateStarted();
		v7.layoutParams = v1.createLayoutParams();
		v7.inflate(Styleable.layout_x, Dimension.EXACT(0));
		v7.inflate(Styleable.layout_y, Dimension.EXACT(0));
		v7.inflate(Styleable.drawable, r.drawableMap[drawable.background_ep3_hascolor]);
		v7.inflate(Styleable.id, "background_ep3_hascolor");
		v7.inflate(Styleable.visibility, ViewVisibility.GONE);
		v7.onInflateFinished();
		v1.addChild(v7, false);

		var v8 = new TextView(r.context);
		v8.onInflateStarted();
		v8.layoutParams = v1.createLayoutParams();
		r.styleMap[style.common_text].apply(v8);
		v8.inflate(Styleable.layout_cy, Dimension.EXACT(265));
		v8.inflate(Styleable.layout_cx, Dimension.WEIGHT_PARENT(0.5, DimensionType.UNSPECIFIED, false));
		v8.inflate(Styleable.text, r.stringMap[string.start_intro_1]);
		v8.inflate(Styleable.id, "intro_1_text");
		v8.inflate(Styleable.textSize, r.dimenMap[dimen.start_intro_textSize]);
		v8.inflate(Styleable.visibility, ViewVisibility.GONE);
		v8.onInflateFinished();
		v1.addChild(v8, false);

		var v9 = new TextView(r.context);
		v9.onInflateStarted();
		v9.layoutParams = v1.createLayoutParams();
		r.styleMap[style.common_text].apply(v9);
		v9.inflate(Styleable.layout_cy, Dimension.EXACT(265));
		v9.inflate(Styleable.layout_cx, Dimension.WEIGHT_PARENT(0.5, DimensionType.UNSPECIFIED, false));
		v9.inflate(Styleable.text, r.stringMap[string.start_intro_2]);
		v9.inflate(Styleable.id, "intro_2_text");
		v9.inflate(Styleable.textSize, r.dimenMap[dimen.start_intro_textSize]);
		v9.inflate(Styleable.visibility, ViewVisibility.GONE);
		v9.onInflateFinished();
		v1.addChild(v9, false);

		var v10 = new TextView(r.context);
		v10.onInflateStarted();
		v10.layoutParams = v1.createLayoutParams();
		r.styleMap[style.common_text].apply(v10);
		v10.inflate(Styleable.layout_cy, Dimension.EXACT(380));
		v10.inflate(Styleable.layout_cx, Dimension.WEIGHT_PARENT(0.5, DimensionType.UNSPECIFIED, false));
		v10.inflate(Styleable.text, r.stringMap[string.start_intro_3]);
		v10.inflate(Styleable.id, "intro_3_text");
		v10.inflate(Styleable.textSize, r.dimenMap[dimen.start_intro_textSize]);
		v10.inflate(Styleable.visibility, ViewVisibility.GONE);
		v10.onInflateFinished();
		v1.addChild(v10, false);

		var v11 = new ImageView(r.context);
		v11.onInflateStarted();
		v11.layoutParams = v1.createLayoutParams();
		v11.inflate(Styleable.layout_ex, Dimension.EXACT(992));
		v11.inflate(Styleable.layout_y, Dimension.EXACT(32));
		v11.inflate(Styleable.drawable, r.drawableMap[drawable.snake_small]);
		v11.inflate(Styleable.id, "snake_small");
		v11.inflate(Styleable.visibility, ViewVisibility.GONE);
		v11.onInflateFinished();
		v1.addChild(v11, false);

		var v12 = new ImageView(r.context);
		v12.onInflateStarted();
		v12.layoutParams = v1.createLayoutParams();
		v12.inflate(Styleable.layout_x, Dimension.EXACT(32));
		v12.inflate(Styleable.layout_y, Dimension.EXACT(32));
		v12.inflate(Styleable.drawable, r.drawableMap[drawable.cat_small]);
		v12.inflate(Styleable.id, "cat_small");
		v12.inflate(Styleable.visibility, ViewVisibility.GONE);
		v12.onInflateFinished();
		v1.addChild(v12, false);

		var v13 = new AbsoluteLayout(r.context);
		v13.onInflateStarted();
		v13.layoutParams = v1.createLayoutParams();
		v13.inflate(Styleable.layout_x, Dimension.EXACT(0));
		v13.inflate(Styleable.layout_width, Dimension.MATCH_PARENT);
		v13.inflate(Styleable.layout_height, Dimension.MATCH_PARENT);
		v13.inflate(Styleable.layout_y, Dimension.EXACT(0));
		v13.inflate(Styleable.id, "vs_group");
		v13.inflate(Styleable.visibility, ViewVisibility.GONE);

		var v14 = new ImageView(r.context);
		v14.onInflateStarted();
		v14.layoutParams = v13.createLayoutParams();
		v14.inflate(Styleable.layout_cy, Dimension.EXACT(280));
		v14.inflate(Styleable.layout_cx, Dimension.EXACT(280));
		v14.inflate(Styleable.drawable, r.drawableMap[drawable.cat_big]);
		v14.onInflateFinished();
		v13.addChild(v14, false);

		var v15 = new ImageView(r.context);
		v15.onInflateStarted();
		v15.layoutParams = v13.createLayoutParams();
		v15.inflate(Styleable.layout_cy, Dimension.EXACT(488));
		v15.inflate(Styleable.layout_cx, Dimension.EXACT(744));
		v15.inflate(Styleable.drawable, r.drawableMap[drawable.snake_big]);
		v15.onInflateFinished();
		v13.addChild(v15, false);

		var v16 = new TextView(r.context);
		v16.onInflateStarted();
		v16.layoutParams = v13.createLayoutParams();
		r.styleMap[style.common_text].apply(v16);
		v16.inflate(Styleable.layout_cy, Dimension.WEIGHT_PARENT(0.5, DimensionType.UNSPECIFIED, false));
		v16.inflate(Styleable.layout_cx, Dimension.WEIGHT_PARENT(0.5, DimensionType.UNSPECIFIED, false));
		v16.inflate(Styleable.text, r.stringMap[string.start_vs]);
		v16.inflate(Styleable.textSize, r.dimenMap[dimen.start_vs_textSize]);
		v16.onInflateFinished();
		v13.addChild(v16, false);

		v13.onInflateFinished();
		v1.addChild(v13, false);

		var v17 = new Button(r.context);
		v17.onInflateStarted();
		v17.layoutParams = v1.createLayoutParams();
		r.styleMap[style.common_text].apply(v17);
		v17.inflate(Styleable.layout_cy, Dimension.EXACT(690));
		v17.inflate(Styleable.layout_cx, Dimension.WEIGHT_PARENT(0.5, DimensionType.UNSPECIFIED, false));
		v17.inflate(Styleable.selector, r.selectorMap[selector.common_button]);
		v17.inflate(Styleable.text, r.stringMap[string.start_next]);
		v17.inflate(Styleable.id, "next_btn");
		v17.inflate(Styleable.tags, ["pressSound"]);
		v17.inflate(Styleable.textSize, r.dimenMap[dimen.start_next_textSize]);
		v17.inflate(Styleable.font, r.fontMap[font.primary]);
		v17.inflate(Styleable.visibility, ViewVisibility.GONE);
		v17.onInflateFinished();
		v1.addChild(v17, false);

		v1.onInflateFinished();
		return v1;
	}
}
