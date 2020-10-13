package sprites;

import flixel.FlxG;
import flixel.FlxState;
import flixel.FlxSubState;
import flixel.group.FlxGroup;
import flixel.text.FlxText;
import flixel.ui.FlxBar;
import flixel.ui.FlxButton;
import flixel.util.FlxColor;
import sprites.Player;

class HUD extends FlxGroup
{
	private var oxygenBar:FlxBar;
	private var sysPanelBtn:FlxButton;
	private var foodText:FlxText;
	private var cargoText:FlxText;

	// private var state:FlxState;
	private var p:Player;

	public function new()
	{
		super();
		// this.state = state;
		p = Glob.player;
		createMembers();
	}

	public function openSystemPanel()
	{
		var sysPanel = new SystemPanel();
		sysPanel.open();
	}

	private function createMembers()
	{
		oxygenBar = new FlxBar(2, 2, FlxBarFillDirection.BOTTOM_TO_TOP, 6, 110, p, "oxygenLevel", 0, 100, true);
		sysPanelBtn = new FlxButton(2, 0, "System panel", openSystemPanel);
		sysPanelBtn.y = FlxG.camera.height - sysPanelBtn.height;
		foodText = new FlxText(6, 2, 0, "");
		cargoText = new FlxText(6, foodText.height + 2, 0, "");

		updateMembers();
		add(oxygenBar);
		add(sysPanelBtn);
		add(foodText);
		add(cargoText);
	}

	private function updateMembers()
	{
		foodText.text = p.foodLevel + " food units";
		cargoText.text = p.cargo() + "/" + p.maxCargo + " cargo holds";
	}

	override public function draw()
	{
		updateMembers();
		super.draw();
	}
}
