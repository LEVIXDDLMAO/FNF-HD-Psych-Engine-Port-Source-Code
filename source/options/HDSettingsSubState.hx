package options;

#if desktop
import Discord.DiscordClient;
#end
import flash.text.TextField;
import flixel.FlxCamera;
import flixel.FlxG;
import flixel.FlxSprite;
import flixel.addons.display.FlxGridOverlay;
import flixel.group.FlxGroup.FlxTypedGroup;
import flixel.math.FlxMath;
import flixel.text.FlxText;
import flixel.util.FlxColor;
import lime.utils.Assets;
import flixel.FlxSubState;
import flash.text.TextField;
import flixel.FlxG;
import flixel.FlxSprite;
import flixel.util.FlxSave;
import haxe.Json;
import flixel.tweens.FlxEase;
import flixel.tweens.FlxTween;
import flixel.util.FlxTimer;
import flixel.input.keyboard.FlxKey;
import flixel.graphics.FlxGraphic;
import Controls;
import openfl.Lib;

using StringTools;

class HDSettingsSubState extends BaseOptionsMenu
{
	public function new()
	{
		title = 'FNF HD Settings';
		rpcTitle = 'FNF HD Settings Menu'; //for Discord Rich Presence

		var option:Option = new Option('HD health heads:',
			'Which version of the HD icons do you prefer?',
			'HDIcons',
			'string',
			'New Version',
			['New Version', 'Old Version', 'Older Version', 'Disabled']);
		addOption(option);

		var option:Option = new Option('Disable dodge warning sound',
			'If checked, it disables the dodge warning sound effect.',
			'disableDodgeSound',
			'bool',
			false);
		addOption(option);

		var option:Option = new Option('Dialogues:',
			'Toggles dialogues, Everywhere option enables them in Freeplay and Story Mode.',
			'disablesDialogues',
			'string',
			'Story Mode',
			['Story Mode', 'Everywhere', 'Disabled']);
		addOption(option);

		var option:Option = new Option('Dodge Pole Spawns Randomly',
			"If checked, the dodge pole will spawn randomly.",
			'poleSpawn',
			'bool',
			false);
		addOption(option);

		var option:Option = new Option('Kill Henchmen:',
			"If only in milf, the imps will die only one time in milf and never come back. If in every song the imps will die in every song and come back.",
			'impEvent',
			'string',
			'Only In Milf',
			['Only In Milf', 'In Every Song']);
		addOption(option);

		var option:Option = new Option('Old HD sprites',
			'If checked, it turns on the old versions of the sprites.',
			'OldHDbg',
			'bool',
			false);
		addOption(option);

		super();
	}
}