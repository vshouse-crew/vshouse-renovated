// import flash.text.TextField;
// import flixel.FlxG;
// import flixel.FlxSprite;
// import flixel.addons.display.FlxGridOverlay;
// import flixel.addons.transition.FlxTransitionableState;
// import flixel.group.FlxGroup.FlxTypedGroup;
// import flixel.math.FlxMath;
// import flixel.text.FlxText;
// import flixel.util.FlxColor;
// import flixel.tweens.FlxTween;
// import lime.utils.Assets;
// import flixel.system.FlxSound;
// import openfl.utils.Assets as OpenFlAssets;
// import openfl.filters.ShaderFilter;
// import flixel.addons.display.FlxTiledSprite;
// import flixel.util.FlxSave;
// import flixel.FlxCamera;
// import flixel.system.FlxAssets;

// public static var fundamentLock:String = 'locked';
//     public static var renovationLock:String = 'locked';
//     public static var multiversusLock:String = 'locked';
//     // public static var barrierLock:String = 'locked';
//     // oof
//     //useless rn


//     public static function fuckinSet() {
//         if (FlxG.save.data.renovationLock == null) FlxG.save.data.renovationLock = 'locked';
//         if (FlxG.save.data.fundamentLock == null) FlxG.save.data.fundamentLock = 'locked';
//         if (FlxG.save.data.multiversusLock == null) FlxG.save.data.multiversusLock = 'locked';
//         // if (FlxG.save.data.barrierLock == null) FlxG.save.data.barrierLock = 'locked';
//         // i cyk do wyjebania
//         FlxG.save.flush();
//     }

//     public static function saveShit() {
//         FlxG.save.data.renovationLock = renovationLock;
//         FlxG.save.data.fundamentLock = fundamentLock;
//         // FlxG.save.data.barrierLock = barrierLock;
//         FlxG.save.data.multiversusLock = multiversusLock;
//         FlxG.save.flush();
//     }

//     public static function loadShit() { //golly gee willikers
//         renovationLock = FlxG.save.data.renovationLock;
//         fundamentLock = FlxG.save.data.fundamentLock;
//         // barrierLock = FlxG.save.data.barrierLock;
//         multiversusLock = FlxG.save.data.multiversusLock;
//         FlxG.save.flush();
//     }
//     function update(elapsed)
//         {
//             trace(renovationLock);
//         }
