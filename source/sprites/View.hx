package sprites;

import Glob;
import flixel.FlxObject;
import flixel.FlxSprite;
import flixel.group.FlxGroup;

enum ViewName
{
	None;
	Home;
	Map;
	Systems;
	Insights;
	Comms;
}

/**
 * A view is a panel shown on the dashboard. To create a new view, extend this class,
 * add its name to the ViewName enum and add it to the dashboard class
 */
class View extends FlxGroup
{
	public var name:ViewName;
	public var x(default, null):Float;
	public var y(default, null):Float;
	public var width(default, null):Int;
	public var height(default, null):Int;
	public var hasBaseBtns:Bool;

	public var outline:FlxSprite;

	// Alias for Glob.player
	public var p:Player = Glob.player;

	private var dashboard:Dashboard;

	public function new(dashboard:Dashboard, name:ViewName, x:Float, y:Float, width:Int, height:Int,
			hasBaseBtns:Bool = true)
	{
		super();
		this.name = name;
		this.dashboard = dashboard;
		this.x = x;
		this.y = y;
		this.width = width;
		this.height = height;
		this.hasBaseBtns = hasBaseBtns;
		createMembers();
	}

	private function createMembers() {}

	private function viewCenter(member:FlxObject)
	{
		member.x = x + (width / 2) - (member.width / 2);
		member.y = y + (height / 2) - (member.height / 2);
	}
}
