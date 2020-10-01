package sprites;

import flixel.FlxSprite;
import flixel.util.FlxColor;

class Celestial extends FlxSprite
{
	public var trajectory(default, null):Trajectory;

	public function new(x:Float = 0, y:Float = 0)
	{
		super(x, y);
		makeGraphic(16, 16, FlxColor.BLUE);
	}
}
