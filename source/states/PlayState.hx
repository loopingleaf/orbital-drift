package states;

import events.*;
import flixel.FlxState;
import sprites.*;

class PlayState extends FlxState
{
	public var station:Celestial;
	public var eventTest:Event;

	override public function create()
	{
		super.create();
		station = new Celestial(0, 0);
		station.screenCenter();
		eventTest = new OxygenDamage(25, 25);
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
