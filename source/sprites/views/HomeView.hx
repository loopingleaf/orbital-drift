package sprites.views;

import flixel.addons.ui.FlxButtonPlus;
import sprites.View.ViewName;

/**
 * The home panel, whith buttons to other views of the dashboard
 */
class HomeView extends View
{
	public var mapBtn:FlxButtonPlus;
	public var systemsBtn:FlxButtonPlus;

	private static inline var btnSpacing = 4;

	public function new(dashboard:Dashboard, x, y, width, height)
	{
		super(dashboard, ViewName.Home, x, y, width, height, false);
	}

	override private function createMembers()
	{
		var viewBtns = new Array<FlxButtonPlus>();
		mapBtn = new FlxButtonPlus(0, 0, displayMap, "MAP");
		viewBtns.push(mapBtn);
		systemsBtn = new FlxButtonPlus(0, 0, displaySystems, "SYSTEMS");
		viewBtns.push(systemsBtn);
		/*var docksBtn = new FlxButtonPlus(0, 0, null, "DOCKS");
			viewBtns.push(docksBtn); */
		// addY permits to center the button list on y in the view
		var addY:Float = -btnSpacing;
		for (b in viewBtns)
			addY -= b.height - btnSpacing;
		addY = addY / 2;
		for (btn in viewBtns)
		{
			viewCenter(btn);
			btn.y += addY;
			addY += btn.height + btnSpacing;
			add(btn);
		}
		super.createMembers();
	}

	private function displayMap()
	{
		dashboard.changeLeftView(ViewName.Map);
	}

	private function displaySystems()
	{
		dashboard.changeLeftView(ViewName.Systems);
	}
}
