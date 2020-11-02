package sprites;

import Glob;
import flixel.FlxG;
import flixel.FlxSprite;
import flixel.addons.ui.FlxButtonPlus;
import flixel.group.FlxGroup;
import sprites.View;
import sprites.views.*;

class Dashboard extends FlxGroup
{
	public static inline final FRAMES_SIZE:Int = 22;
	public static inline final MID_FRAME_SIZE:Int = 6;
	public static inline final BASE_BTN_SPACING:Int = 4;
	public static inline final LEFT_VIEW_SIZE:Float = .6;

	public var home:HomeView;
	public var map:MapView;
	public var systems:SystemsView;

	public var insights:InsightsView;
	public var comms:CommsView;

	public var leftBaseBtns:Array<FlxButtonPlus>;
	public var leftOutline:FlxSprite;
	public var rightOutline:FlxSprite;

	public var leftViewName(default, null):ViewName;
	public var rightViewName(default, null):ViewName;

	private var leftView:View;
	private var rightView:View;

	public function new(leftView:ViewName = ViewName.Home, rightView:ViewName = ViewName.Insights)
	{
		super();
		createMembers();
		changeLeftView(leftView);
		changeRightView(rightView);
	}

	public function changeLeftView(v:ViewName)
	{
		if (leftView != null)
			remove(leftView);
		leftViewName = v;
		leftView = switch leftViewName
		{
			case ViewName.Home: home;
			case ViewName.Map: map;
			case ViewName.Systems: systems;
			default: home;
		}
		add(leftView);
		if (leftView.hasBaseBtns)
			displayLeftBaseBtns();
		else
			hideLeftBaseBtns();
	}

	public function changeRightView(v:ViewName)
	{
		if (rightView != null)
			remove(rightView);
		rightViewName = v;
		rightView = switch rightViewName
		{
			case ViewName.Insights: insights;
			case ViewName.Comms: comms;
			default: insights;
		}
		add(rightView);
	}

	public function displayLeftBaseBtns()
	{
		for (b in leftBaseBtns)
			add(b);
	}

	public function hideLeftBaseBtns()
	{
		for (b in leftBaseBtns)
			remove(b);
	}

	private function displayMapView()
	{
		changeLeftView(ViewName.Map);
	}

	private function displaySystemsView()
	{
		changeLeftView(ViewName.Systems);
	}

	private function createMembers()
	{
		var cw = FlxG.camera.width;

		var lViewXY = FRAMES_SIZE;
		var lViewW = Math.floor((cw * LEFT_VIEW_SIZE) - FRAMES_SIZE);
		var lViewH = FlxG.camera.height - (FRAMES_SIZE * 2);
		home = new HomeView(this, lViewXY, lViewXY, lViewW, lViewH);
		map = new MapView(this, lViewXY, lViewXY, lViewW, lViewH);
		systems = new SystemsView(this, lViewXY, lViewXY, lViewW, lViewH);

		var rViewX = lViewXY + lViewW + MID_FRAME_SIZE;
		var rViewY = lViewXY;
		var rViewW = cw - lViewW - (FRAMES_SIZE * 2) - MID_FRAME_SIZE;
		var rViewH = lViewH;
		insights = new InsightsView(this, rViewX, rViewY, rViewW, rViewH);
		comms = new CommsView(this, rViewX, rViewY, rViewW, rViewH);

		var dashboardOl = new FlxSprite();
		dashboardOl.makeGraphic(FlxG.camera.width, FlxG.camera.height, Color.SECONDARY_DARK);
		add(dashboardOl);

		leftOutline = new FlxSprite(lViewXY, lViewXY);
		leftOutline.makeGraphic(lViewW, lViewH, Color.SECONDARY_LIGHT);
		add(leftOutline);

		rightOutline = new FlxSprite(rViewX, rViewY);
		rightOutline.makeGraphic(rViewW, rViewH, Color.SECONDARY_LIGHT);
		add(rightOutline);

		leftBaseBtns = new Array<FlxButtonPlus>();
		var mapBb = new FlxButtonPlus(lViewW - BASE_BTN_SPACING, lViewXY + BASE_BTN_SPACING, displayMapView, "M", 20);
		leftBaseBtns.push(mapBb);
		leftBaseBtns.push(new FlxButtonPlus(leftBaseBtns[0].x,
			leftBaseBtns[0].y + leftBaseBtns[0].height + BASE_BTN_SPACING, displaySystemsView, "S", 20));
	}
}
