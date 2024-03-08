function selectOption() {
	var daSelected:String = event.name;

	switch (daSelected)
	{
		case "Resume":
			if(FlxG.drawFramerate < 90)
				{
					FlxG.drawFramerate = FlxG.updateFramerate = 60;
				}
			 else if(FlxG.drawFramerate < 150)
				{
					FlxG.drawFramerate = FlxG.updateFramerate = 120;
				}
			else if(FlxG.drawFramerate < 210)
				{
				   FlxG.drawFramerate = FlxG.updateFramerate = 180;
				}
			else if(FlxG.drawFramerate > 240)
				{
				   FlxG.drawFramerate = FlxG.updateFramerate = 240;
				}
	}
}