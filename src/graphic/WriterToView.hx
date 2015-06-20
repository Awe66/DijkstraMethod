package graphic;

import openfl.Assets;
import openfl.display.Bitmap;
import openfl.display.InteractiveObject;
import openfl.display.Sprite;
import openfl.events.Event;
import openfl.events.KeyboardEvent;
import openfl.text.TextField;
import openfl.text.TextFormat;
import reader.Reader;
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
		
	private var outputCoorX:UInt = 190;
	private var outputCoorY:UInt = 300;
	
	private var outputSignatureX:UInt;
	private var outputSignatureY:UInt;
	
	private var outputDelta:UInt = 0;
	private var background:DrawBackground;
	private var symbolFormat:TextFormat;
	
	public function new(background:DrawBackground, symbolFormat:TextFormat) 
	{
		this.background = background;
		this.symbolFormat = symbolFormat;
	}
	
	/* INTERFACE src.graphic.Writer */
	var index:Int = 0;
	public function add(symbol:Symbol):Bool 
	{
		
		symbol.createTextView(symbolFormat);
		symbol.showTextView();
		addToSourceLine(symbol);
		return true;
	}
	
	public function addToSourceLine(symbol:Symbol)
	{
		symbol.changeCoor(inputStringX + index, inputStringY);
		index += Std.int(symbolFormat.size)*symbol.getValue().length;
	}
	
	public function endFirstPart():Bool
	{
		index = 0;
		return true;
	}
	
	public function addToStack(symbol:Symbol, num:Int):Bool
	{
		var symbolX:Int = Std.int(background.getStackX() + (background.getStackWight() - symbolFormat.size) / 2);
		var symbolY:Int = Std.int(background.getStackY() + background.getStackHeight() - num * 40 - symbolFormat.size);
		symbol.changeCoor(symbolX, symbolY);
		return true;
	}
	
	public function addToOutput(symbol:Symbol):Bool
	{
		symbol.changeCoor(outputCoorX + outputDelta, outputCoorY);
		outputDelta += Std.int(symbolFormat.size) * symbol.getValue().length;
		return true;
	}
	
	public function printSignature():Bool
	{
		var max:Int;
		return true;
	}
	
}