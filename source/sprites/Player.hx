package sprites;

// Actually the player's station.
class Player extends Celestial
{
	public var oxygenLevel:Int;
	public var foodLevel:Int;
	public var iridiumLevel:Int;
	public var maxCargo:Int;
	public var modules:Array<Module>;
	public var crew:Array<CrewMember>;

	public inline function crewSize()
		return crew.length;

	public inline function cargo()
		return foodLevel + iridiumLevel;

	override public function new(X:Float = 0, Y:Float = 0)
	{
		super(X, Y);
		oxygenLevel = 100;
		foodLevel = 100;
		iridiumLevel = 12;
		maxCargo = 200;
	}
}
