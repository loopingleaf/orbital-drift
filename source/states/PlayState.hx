package states;

import events.*;
import flixel.FlxState;
import sprites.*;

class PlayState extends FlxState
{
	public var eventTest:Event;
	public var timer:Float;

	public var dashboard:Dashboard;

	private static var p:Player;

	override public function create()
	{
		super.create();
		Glob.player = new Player();
		p = Glob.player;
		p.screenCenter();
		timer = 0;
		eventTest = new OxygenDamage(25, 25);

		dashboard = new Dashboard();
		add(dashboard);
	}

	override public function update(elapsed:Float)
	{
		super.update(elapsed);
		timer += elapsed;
		if (timer >= Glob.TICK)
		{
			timer = 0;
			tick();
		}
	}

	override public function draw()
	{
		super.draw();
	}

	private function tick()
	{
		p.oxygenLevel -= p.oxygenVentilation;
	}
}
