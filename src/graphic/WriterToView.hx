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
class WriterToView implements Writer
{

	public function new() 
	{
		
	}
	
	/* INTERFACE src.graphic.Writer */
	var index:Int = 0;
	public function add(symbol:Symbol):Bool 
	{
		index += 30;
		symbol.FONT_SIZE = 100;
		symbol.createTextView();
		trace(symbol.FONT_SIZE);
		symbol.showTextView();
		
		symbol.changeCoor(index, 20);
		return true;
	}
	
}