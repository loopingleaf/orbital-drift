package events;

import flixel.ui.FlxButton;

class OxygenDamage extends Event
{
	override public function new(x:Float, y:Float)
	{
		super(x, y, "Oxygen tank abnormal pressure detected. It requires maintenance.");
		addChoice("Send a tech", sendATech);
		addChoice("Send a tech 2", sendATech);
		createMembers();
		/*var button = new FlxButton(x + 10, y + 20, "Send a tech", sendATech);
			add(button); */
	}

	public function sendATech()
	{
		close();
	}
}
