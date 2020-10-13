package sprites;

import Glob.Color;
import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.FlxSubState;
import flixel.addons.ui.FlxButtonPlus;
import flixel.util.FlxColor;

class SystemPanel extends FlxSubState
{
	private static inline final OFFSET = 60;

	private var x:Float;
	private var y:Float;
	private var width:Float;
	private var height:Float;

	private var background:FlxSprite;
	private var outline:FlxSprite;
	private var closeBtn:FlxButtonPlus;
	private var state:FlxState;

	public function new()
	{
		super(FlxColor.fromRGB(0, 12, 38, 120));
		if (camera.width >= camera.height)
		{
			y = camera.y + OFFSET;
			height = camera.height - (OFFSET * 2);
			width = height;
			x = Math.floor((camera.width / 2) - (width / 2));
		}
		else
		{
			x = camera.x + OFFSET;
			width = camera.width - (OFFSET * 2);
			height = width;
			y = Math.floor((camera.height / 2) - (height / 2));
		}
		createMembers();
	}

	public function open()
	{
		FlxG.state.openSubState(this);
	}

	private function createMembers()
	{
		background = new FlxSprite(x + 1, y + 1);
		background.makeGraphic(Math.floor(width - 2), Math.floor(height - 2), Color.SECONDARY_DARK);
		outline = new FlxSprite(x, y);
		outline.makeGraphic(Math.floor(width), Math.floor(height), Color.SECONDARY_LIGHT);
		closeBtn = new FlxButtonPlus(0, y + 4, close, "X", 20);
		closeBtn.x = x - 4 + width - closeBtn.width;
		add(outline);
		add(background);
		add(closeBtn);
	}
}
