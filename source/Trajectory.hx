package;

import sprites.Celestial;

enum OrbitDirection
{
	Clockwise;
	CounterClockwise;
}

class Trajectory
{
	public static var all:Array<Trajectory> = [];

	public var attachedTo(default, null):Celestial;
	public var speed:Float;
	public var angle:Float;
	public var destinationX(default, null):Float;
	public var destinationY(default, null):Float;
	public var orbitting:Bool = false;
	public var orbitNear:Celestial;
	public var orbitDirection:OrbitDirection;

	public function new(attachedTo:Celestial, speed:Float = 0, angle:Float = 0, destX:Float = 0, destY:Float = 0)
	{
		all.push(this);
		this.attachedTo = attachedTo;
		this.speed = speed;
		this.angle = angle;
		destinationX = destX;
		destinationY = destY;
	}

	public function orbit(target:Celestial, direction:OrbitDirection)
	{
		orbitting = true;
		orbitNear = target;
		orbitDirection = direction;
	}

	public function setDestination(x:Float, y:Float)
	{
		orbitting = false;
		destinationX = x;
		destinationY = y;
	}
}
