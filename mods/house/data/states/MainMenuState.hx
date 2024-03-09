function onSelectItem(e) {
    if (e.name == "gallery") {
        FlxG.switchState(new ModState("GalleryChooseState"));
        e.cancel();
        trace("kupa");
    }
}