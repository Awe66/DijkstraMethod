package src;

/**
 * ...
 * @author Awe66
 */
class Operator
{
	public var operatorName:String;
	private var priority:Int;
	private var left:Bool;
	public function new(operator:String, priority:Int, left:Bool) 
	{
		this.operatorName = operator;
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