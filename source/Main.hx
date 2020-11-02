package;

import flixel.FlxGame;
import openfl.display.Sprite;
import states.*;

class Main extends Sprite
{
	public function new()
	{
		super();
		addChild(new FlxGame(Math.floor(1920 / 3), Math.floor(1080 / 3), PlayState, 2, 60, 60, true));
	}
}
