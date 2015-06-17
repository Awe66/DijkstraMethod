package graphic;

import src.graphic.Writer;
import types.Symbol;

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
	
	public function add(symbol:Symbol):Bool 
	{
		trace(symbol.getValue());
		return true;
	}
	
}