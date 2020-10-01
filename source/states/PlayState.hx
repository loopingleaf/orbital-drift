package states;

import flixel.FlxState;
import sprites.*;

class PlayState extends FlxState
{
	public var station:Celestial;

	override public function create()
	{
		super.create();

		station = new Celestial(0, 0);
		station.screenCenter();
		add(station);
	}

	override public function update(elapsed:Float)
	{
		super.update(elapsed);
	}
}
