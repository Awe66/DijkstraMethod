package types ;

/**
 * ...
 * @author Awe66
 */
class Operator extends Symbol
{
	private var priority:Int;
	private var left:Bool;
	public function new(value:String, priority:Int, left:Bool) 
	{
		super(value);
		this.priority = priority;
		this.left = left;
	}
	
	public function getPriority():Int {
		return priority;
	}
	
	public function isLeft():Bool {
		return left;
	}
	
}