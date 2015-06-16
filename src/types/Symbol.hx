package types;

/**
 * ...
 * @author Awe66
 */
class Symbol
{
	var corX:Int;
	var corY:Int;
	var value:String;

	public function new(value:String) 
	{
		this.value = value;
	}
	
	public function getValue():String
	{
		return value;
	}
	
}