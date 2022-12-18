package;

import flixel.FlxSprite;

class Amy extends FlxSprite
{
	public function new(x:Float, y:Float, ?scrollX:Float = 1, ?scrollY:Float = 1)
	{
		super(x, y);

		frames = Paths.getSparrowAtlas("sonicshit/bopperFrames");
		animation.addByIndices('danceLeft', 'amy bop', [0, 1, 2, 3, 4, 5, 6], "", 24, false);
		animation.addByIndices('danceRight', 'amy bop', [7, 8, 9, 10, 11, 12, 13], "", 24, false);
		animation.play('danceLeft');

		scrollFactor.set(scrollX, scrollY);
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
