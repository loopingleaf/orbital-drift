package sprites.views;

import flixel.text.FlxText;
import flixel.ui.FlxBar;
import sprites.View;

class InsightsView extends View
{
	public static inline final MARGIN:Int = 6;

	public var oxygenBar(default, null):FlxBar;
	public var foodText(default, null):FlxText;
	public var cargoText(default, null):FlxText;

	public function new(dashboard:Dashboard, x, y, width, height)
	{
		super(dashboard, ViewName.Insights, x, y, width, height, false);
	}

	override public function draw()
	{
		foodText.text = p.foodLevel + " food units";
		cargoText.text = p.cargo() + "/" + p.maxCargo + " cargo holds";
		super.draw();
	}

	override private function createMembers()
	{
		oxygenBar = new FlxBar(x + MARGIN, y + MARGIN, FlxBarFillDirection.LEFT_TO_RIGHT, 110, 6, p, "oxygenLevel", 0,
			100, true);
		foodText = new FlxText(x + MARGIN, oxygenBar.y + oxygenBar.height + MARGIN, 0, "");
		cargoText = new FlxText(x + MARGIN, foodText.y + foodText.height + MARGIN, 0, "");

		// updateMembers();
		add(oxygenBar);
		add(foodText);
		add(cargoText);
		super.createMembers();
	}
}
