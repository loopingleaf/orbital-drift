package events;

import flixel.group.FlxGroup;
import flixel.text.FlxText;
import flixel.ui.FlxButton;

class Event extends FlxGroup
{
	private static inline final CHOICE_SPACE:Float = 14;

	public var description:String;
	public var state:FlxGroup;
	public var x:Float;
	public var y:Float;
	public var choiceTexts:Array<String>;
	public var choiceFuns:Array<Void->Void>;

	public function new(x:Float, y:Float, description:String = "")
	{
		super();
		this.x = x;
		this.y = y;
		this.description = description;
		choiceTexts = new Array<String>();
		choiceFuns = new Array<Void->Void>();
	}

	public function addChoice(text:String, onClick:Void->Void)
	{
		choiceTexts.push(text);
		choiceFuns.push(onClick);
	}

	public function createMembers()
	{
		// var text = FlxText
		var prevW:Float = 0;
		for (i in 0...choiceTexts.length)
		{
			var btn = new FlxButton(x + (i * prevW), y, choiceTexts[i], choiceFuns[i]);
			if (i != 0)
				btn.x += CHOICE_SPACE;
			add(btn);
			prevW += btn.width;
		}
	}

	public function close()
	{
		kill();
	}
}
