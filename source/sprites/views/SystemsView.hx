package sprites.views;

import flixel.addons.ui.FlxSlider;
import sprites.View.ViewName;

/**
 * The systems panel, permitting setting things like 02 ventilation, communications, administrators and accesses...
 */
class SystemsView extends View
{
	var oxygenSlider:FlxSlider;

	public function new(dashboard:Dashboard, x, y, width, height)
	{
		super(dashboard, ViewName.Systems, x, y, width, height);
	}

	override function createMembers()
	{
		super.createMembers();
		oxygenSlider = new FlxSlider(Glob.player, "oxygenVentilation", x, y, 0, 10);
		add(oxygenSlider);
	}
}
