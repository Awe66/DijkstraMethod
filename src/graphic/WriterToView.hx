package graphic;

import openfl.display.InteractiveObject;
import openfl.display.Sprite;
import openfl.text.TextField;
import src.graphic.Writer;
import types.Symbol;

/**
 * ...
 * @author Awe66
 */
class WriterToView implements Writer extends InteractiveObject
{

	public function new() 
	{
		super();
	}
	
	/* INTERFACE src.graphic.Writer */
	
	public function add(symbol:Symbol):Bool 
	{
		
		return true;
	}
	
}