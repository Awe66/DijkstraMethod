package types;

/**
 * ...
 * @author Awe66
 */
class Symbol
{
	var corX:Int;
	var corY:Int;
	var operator:Bool;
	private var value:String;
	private var priority:Int;
	private var left:Bool;
	
	public function new(value:String, priority:Int, left:Bool) 
	{
		this.value = value;
		this.priority = priority;
		this.left = left;
		operator = (priority>=0);
		
	}
	
	public function isOperator():Bool
	{
		return operator;
	}
	
	public function getValue():String
	{
		return value;
	}
	
	public function getPriority():Int {
		return priority;
	}
	
	public function isLeft():Bool {
		return left;
	}

	
}