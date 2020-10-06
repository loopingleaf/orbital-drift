package events;

import Glob;
import flixel.FlxSprite;
import flixel.group.FlxGroup;
import flixel.text.FlxText;
import flixel.ui.FlxButton;

class Event extends FlxGroup
{
	private static inline final CHOICE_SPACE:Float = 2;

	public var description:String;
	public var state:FlxGroup;
	public var x:Float;
	public var y:Float;
	public var width:Int;
	public var height:Int;
	public var choiceTexts:Array<String>;
	public var choiceFuns:Array<Void->Void>;
	public var windowOffset:Float = 4;
	public var background:FlxSprite;
	public var bgOutlines:FlxSprite;

	public function new(X:Float, Y:Float, Description:String = "", Width:Int = 300, Height:Int = 160)
	{
		super();
		x = X;
		y = Y;
		width = Width;
		height = Height;
		description = Description;
		choiceTexts = new Array<String>();
		choiceFuns = new Array<Void->Void>();
		bgOutlines = new FlxSprite(x, y);
		background = new FlxSprite(x + 1, y + 1);
	}

	public function addChoice(text:String, onClick:Void->Void)
	{
		choiceTexts.push(text);
		choiceFuns.push(onClick);
	}

	public function createMembers()
	{
		var text = new FlxText(x + windowOffset, y + windowOffset, width, description);
		var marginX:Float = x + windowOffset;
		var btn = new Array<FlxButton>();
		for (i in 0...choiceTexts.length)
		{
			btn[i] = new FlxButton(marginX, text.y + text.height + windowOffset, choiceTexts[i], choiceFuns[i]);
			marginX = btn[i].x + btn[i].width + CHOICE_SPACE;
		};
		var bgH:Int;
		if (btn.length > 0)
			bgH = Math.floor(btn[0].y + btn[0].height - y + windowOffset);
		else
			bgH = Math.floor(text.y + text.height - y + windowOffset);
		bgOutlines.makeGraphic(width + 2, bgH + 2, Color.SECONDARY_LIGHT);
		background.makeGraphic(width, bgH, Color.SECONDARY_DARK);
		add(bgOutlines);
		add(background);
		add(text);
		for (b in btn)
			add(b);
	}

	public function close()
	{
		kill();
	}
}
