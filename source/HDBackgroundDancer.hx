package;

import animateatlas.AtlasFrameMaker;
import flixel.math.FlxRandom;
import flixel.FlxSprite;
import flixel.graphics.frames.FlxAtlasFrames;
import flixel.FlxG;

class HDBackgroundDancer extends FlxSprite
{
	public function new(x:Float, y:Float, who:String)
	{
		super(x, y);

		frames = Paths.getSparrowAtlas("limo/" + who);
		animation.addByIndices('danceLeft', who + 'DANCE', [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14], "", 24, false);
		animation.addByIndices('danceRight', who + 'DANCE', [15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29], "", 24, false);

		animation.play('danceLeft');
		antialiasing = ClientPrefs.globalAntialiasing;
	}

	var danceDir:Bool = false;
	public function dance():Void
	{
		danceDir = !danceDir;

		if (danceDir)
			animation.play('danceRight', true);
		else
			animation.play('danceLeft', true);
	}
}