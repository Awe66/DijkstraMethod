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
	
	public function endFirstPart():Bool
	{
		return true;
	}
	
	/* INTERFACE src.graphic.Writer */
	
	public function add(symbol:Symbol):Bool 
	{
		trace(symbol.getValue());
		return true;
	}
	public function addToOutput(symbol:Symbol) {
		trace(symbol.getValue());
		return true;
	}
	public function addToStack(symbol:Symbol, number:Int) {
		return true;
	}
	
	
}