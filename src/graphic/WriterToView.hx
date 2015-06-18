package graphic;

import openfl.Assets;
import openfl.display.Bitmap;
import openfl.display.InteractiveObject;
import openfl.display.Sprite;
import openfl.events.Event;
import openfl.events.KeyboardEvent;
import openfl.text.TextField;
import src.graphic.Writer;
import types.Symbol;

/**
 * ...
 * @author Awe66
 */
class WriterToView implements Writer 
{
	private var inputStringX:UInt = 190;
	private var inputStringY:UInt = 100;
	
	private var stackCoorX:UInt = 70;
	private var stackCoorY:UInt = 420;
	
	private var outputCoorX:UInt = 190;
	private var outputCoorY:UInt = 190;
	
	private var outputNumber:UInt = 0;
	private var stack:DrawBackground;
	
	public function new() 
	{
		
	}
	
	/* INTERFACE src.graphic.Writer */
	var index:Int = 0;
	public function add(symbol:Symbol):Bool 
	{
		symbol.FONT_SIZE = 40;
		symbol.createTextView();
		symbol.showTextView();
		symbol.changeCoor(inputStringX + index, inputStringY);
		index += symbol.FONT_SIZE;
		return true;
	}
	
	public function addToStack(symbol:Symbol, num:Int):Bool
	{
		symbol.changeCoor(stackCoorX, stackCoorY-num*40);
		return true;
	}
	
	public function addToOutput(symbol:Symbol):Bool
	{
		symbol.changeCoor(outputCoorX + outputNumber * 40, outputCoorY);
		outputNumber++;
		return true;
	}
	
	
	
}