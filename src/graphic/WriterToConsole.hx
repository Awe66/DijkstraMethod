package graphic;

import src.graphic.Writer;
import types.Operator;

/**
 * ...
 * @author Awe66
 */
class WriterToConsole implements Writer
{

	public function new() 
	{
		
	}
	
	/* INTERFACE src.graphic.Writer */
	
	public function add(operator:Operator):Bool 
	{
		return true;
	}
	
}