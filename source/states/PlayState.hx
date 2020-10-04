package states;

import events.*;
import flixel.FlxG;
import flixel.FlxState;
import flixel.system.scaleModes.PixelPerfectScaleMode;
import haxe.Log;
import sprites.*;

class PlayState extends FlxState
{
	public var station:Celestial;
	public var eventTest:Event;

	override public function create()
	{
		super.create();
		FlxG.scaleMode = new PixelPerfectScaleMode();
		// FlxG.resizeGame(Math.floor(FlxG.width * 2), Math.floor(FlxG.height * 2));
		station = new Celestial(0, 0);
		station.screenCenter();
		eventTest = new OxygenDamage(0, 0);
		add(eventTest);
		add(station);
	}

	public function testBtn() {}

	override public function update(elapsed:Float)
	{
		super.update(elapsed);
	}

	override public function draw()
	{
		super.draw();
	}
}
