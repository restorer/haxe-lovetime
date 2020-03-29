package org.zamedev.lovetime.util;

import de.polygonal.Printf;
import motion.Actuate;
import motion.easing.Linear;
import org.zamedev.lib.DynamicExt;
import org.zamedev.ui.view.View;
import org.zamedev.ui.view.ViewGroup;
import org.zamedev.ui.view.ViewVisibility;

class Common {
    public static function formatTimeMinutes(milliseconds:Int):String {
        var minutes = Std.int(milliseconds / (60 * 1000));
        var seconds = Std.int(milliseconds / 1000) % 60;

        return Printf.format("%02d:%02d", [minutes, seconds]);
    }

    public static function formatTimeSeconds(milliseconds:Int):String {
        var seconds = Std.int(milliseconds / 1000);
        var santiseconds = Std.int(milliseconds / 10) % 100;

        return Printf.format("%02d:%02d", [seconds, santiseconds]);
    }

    public static function flatten(object:DynamicExt, path:String = "", into:Map<String, String> = null):Map<String, String> {
        if (into == null) {
            into = new Map<String, String>();
        }

        for (key in object.keys()) {
            var value = object[key];

            if (Type.typeof(value) == Type.ValueType.TObject) {
                flatten(value, path + key + ".", into);
            } else if (value != null) {
                into[path + key] = Std.string(value);
            }
        }

        return into;
    }

    public static function shake(view:View):Void {
        Actuate.tween(view, 0.05, { offsetX: -5 }).ease(Linear.easeNone);
        Actuate.tween(view, 0.05, { offsetX: 5 }, false).ease(Linear.easeNone).delay(0.05);
        Actuate.tween(view, 0.05, { offsetX: -5 }, false).ease(Linear.easeNone).delay(0.1);
        Actuate.tween(view, 0.05, { offsetX: 5 }, false).ease(Linear.easeNone).delay(0.15);
        Actuate.tween(view, 0.05, { offsetX: 0 }, false).ease(Linear.easeNone).delay(0.2);
    }

    public static function showHideSingleView(view:View, tagPart:String):Void {
        var showTag = "show_" + tagPart;
        var hideTag = "hide_" + tagPart;

        if (view.tags.exists("hide")) {
            view.visibility = (view.tags.exists(showTag) ? ViewVisibility.VISIBLE : ViewVisibility.GONE);
        } else if (view.tags.exists("show")) {
            view.visibility = (view.tags.exists(hideTag) ? ViewVisibility.GONE : ViewVisibility.VISIBLE);
        } else if (view.tags.exists("invisible")) {
            view.visibility = (view.tags.exists(showTag) ? ViewVisibility.VISIBLE : ViewVisibility.INVISIBLE);
        }
    }

    public static function showHideViews(viewGroup:ViewGroup, tagPart:String):Void {
        var showTag = "show_" + tagPart;
        var hideTag = "hide_" + tagPart;

        for (view in viewGroup.findViewsByTag("hide")) {
            view.visibility = (view.tags.exists(showTag) ? ViewVisibility.VISIBLE : ViewVisibility.GONE);
        }

        for (view in viewGroup.findViewsByTag("show")) {
            view.visibility = (view.tags.exists(hideTag) ? ViewVisibility.GONE : ViewVisibility.VISIBLE);
        }

        for (view in viewGroup.findViewsByTag("invisible")) {
            view.visibility = (view.tags.exists(showTag) ? ViewVisibility.VISIBLE : ViewVisibility.INVISIBLE);
        }
    }

    public static function runDelayed(delay:Float, callback:Void->Void):Void {
        if (delay > 0) {
            Actuate.timer(delay).onComplete(callback);
        } else if (callback != null) {
            callback();
        }
    }
}
