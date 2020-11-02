package;

class CrewMember
{
	public var alive(default, null):Bool;
	@range(0, 100)
	public var health(default, set):Int;
	@range(0, 100)
	public var energy(default, set):Int;
	@range(0, 2)
	public var oxygenNeeds(default, set):Float;
	@range(0, 1)
	public var foodLevel(default, set):Float;

	public function new(oxygenNeeds:Float = 1, alive:Bool = true)
	{
		this.oxygenNeeds = oxygenNeeds;
		this.alive = alive;
	}

	public function die()
	{
		alive = false;
	}

	public function set_health(h:Int)
	{
		if (h <= 0)
			die();
		return h;
	}

	public function set_energy(e:Int)
	{
		return e;
	}

	public function set_oxygenNeeds(on:Float)
	{
		return on;
	}

	public function set_foodLevel(fl:Float)
	{
		return fl;
	}
}
