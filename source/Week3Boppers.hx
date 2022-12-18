package;

import flixel.FlxSprite;
import flixel.graphics.frames.FlxAtlasFrames;

class Week3Boppers extends FlxSprite
{
	public var animOffsets:Map<String, Array<Dynamic>>;
	public var stopDancingTime:Float = 0;
	public var stopDancing:Bool = false;
	public function new(x:Float = 0, y:Float = 0)
	{

		super(x, y);

		#if (haxe >= "4.0.0")
		animOffsets = new Map();
		#else
		animOffsets = new Map<String, Array<Dynamic>>();
		#end

		if(!ClientPrefs.OldHDbg) {
			if(PlayState.SONG.song.toLowerCase() != "blammed") {
				frames = Paths.getSparrowAtlas("philly/Boppers");
				animation.addByPrefix('bop', 'Boppers Dancing Beat0', 24, false);
				animation.addByPrefix('blowing', 'Boppers Dancing Beat blowing', 24, true);
				animation.addByPrefix('Landing', 'Boppers Dancing Beat Landing', 24, false);
			} else {
				frames = Paths.getSparrowAtlas("philly/BoppersBlammed");
				animation.addByPrefix('bop', 'Boppers Dancing Beat 20', 24, false);
				animation.addByPrefix('blowing', 'Boppers Dancing Beat blowing 2', 24, true);
				animation.addByPrefix('Landing', 'Boppers Dancing Beat Landing 2', 24, false);
			}
		} else {
			if(PlayState.SONG.song.toLowerCase() != "blammed") {
				frames = Paths.getSparrowAtlas("phillyOld/Boppers");
				animation.addByPrefix('bop', 'Boppers Dancing Beat0', 24, false);
				animation.addByPrefix('blowing', 'Boppers Dancing Beat blowing', 24, true);
				animation.addByPrefix('Landing', 'Boppers Dancing Beat Landing', 24, false);
			} else {
				frames = Paths.getSparrowAtlas("phillyOld/BoppersBlammed");
				animation.addByPrefix('bop', 'Boppers Dancing Beat 20', 24, false);
				animation.addByPrefix('blowing', 'Boppers Dancing Beat blowing 2', 24, true);
				animation.addByPrefix('Landing', 'Boppers Dancing Beat Landing 2', 24, false);
			}
		}

		if(!ClientPrefs.OldHDbg) {
			addOffset('bop', -259, -198);
			addOffset('blowing', -267, -252);
			addOffset('Landing', -267, -241);
		} else {
			addOffset('bop', -215, -200);
			addOffset('blowing', -215, -236);
			addOffset('Landing', -215, -186);
		}

		scrollFactor.set(1, 1);
		antialiasing = ClientPrefs.globalAntialiasing;
		playAnim('bop', true);
	}

	public function addOffset(name:String, x:Float = 0, y:Float = 0)
	{
		animOffsets[name] = [x, y];
	}

	public function dance(?forceplay:Bool = false) {
		playAnim('bop', true);
	}

	public function playAnim(AnimName:String, Force:Bool = false, Reversed:Bool = false, Frame:Int = 0):Void
	{
		animation.play(AnimName, Force, Reversed, Frame);

		var daOffset = animOffsets.get(AnimName);
		if (animOffsets.exists(AnimName))
		{
			offset.set(daOffset[0], daOffset[1]);
		}
		else
			offset.set(0, 0);
	}

	override function update(elapsed:Float)
	{
		if (stopDancingTime > 0)
		{
			stopDancingTime -= elapsed;
			if(stopDancingTime <= 0)
			{
				stopDancingTime = 0;
			}
		}
		super.update(elapsed);
	}
}