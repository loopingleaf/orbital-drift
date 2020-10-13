package states;

import events.*;
import flixel.FlxG;
import flixel.FlxState;
import sprites.*;

class PlayState extends FlxState
{
	public var eventTest:Event;
	public var hud:HUD;

	override public function create()
	{
		super.create();
		Glob.player = new Player();
		hud = new HUD();
		Glob.player.screenCenter();
		eventTest = new OxygenDamage(25, 25);
		add(hud);
		add(eventTest);
		add(Glob.player);
	}

	override public function update(elapsed:Float)
	{
		super.update(elapsed);
	}

	override public function draw()
	{
		super.draw();
	}
}
