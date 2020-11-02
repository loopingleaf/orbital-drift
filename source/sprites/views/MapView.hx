package sprites.views;

import flixel.text.FlxText;
import sprites.View.ViewName;

/**
 * The map, showing the station and surroundings
 */
class MapView extends View
{
	public var label:FlxText;

	public function new(dashboard:Dashboard, x, y, width, height)
	{
		super(dashboard, ViewName.Map, x, y, width, height);
	}

	override private function createMembers()
	{
		super.createMembers();
	}
}
