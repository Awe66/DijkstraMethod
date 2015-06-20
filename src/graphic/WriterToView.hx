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
	private var background:DrawBackground;
	
	public function new(background:DrawBackground) 
	{
		this.background = background;
	}
	
	/* INTERFACE src.graphic.Writer */
	var index:Int = 0;
	public function add(symbol:Symbol):Bool 
	{
		symbol.FONT_SIZE = 40;
		symbol.FONT_COLOR = 0x000000;
		symbol.createTextView();
		symbol.showTextView();
		symbol.changeCoor(inputStringX + index, inputStringY);
		index += symbol.FONT_SIZE;
		return true;
	}
	
	public function addToStack(symbol:Symbol, num:Int):Bool
	{
		var symbolX:Int = Std.int(background.getStackX() + (background.getStackWight() - symbol.FONT_SIZE) / 2);
		var symbolY:Int = Std.int(background.getStackY() + background.getStackHeight() - num * 40 - symbol.FONT_SIZE);
		symbol.changeCoor(symbolX, symbolY);
		return true;
	}
	
	public function addToOutput(symbol:Symbol):Bool
	{
		symbol.changeCoor(outputCoorX + outputNumber * 40, outputCoorY);
		outputNumber++;
		return true;
	}
	
	
	
}