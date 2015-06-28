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
	
	private var space:Int = 15;
	
	private var outputCoorX:UInt = 190;
	private var outputCoorY:UInt = 200;
	
	private var outputSignatureX:UInt;
	private var outputSignatureY:UInt;
	
	private var outputDelta:UInt = 0;
	private var background:DrawBackground;
	private var symbolFormat:TextFormat;
	
	public var outputList:List<Symbol>;
	
	public function new(background:DrawBackground, symbolFormat:TextFormat) 
	{
		this.background = background;
		this.symbolFormat = symbolFormat;
		outputList = new List<Symbol>();
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
		index += Std.int(symbol.getTextWidth())+space;
	}
	
	public function endFirstPart():Bool
	{
		index = 0;
		return true;
	}
	
	public function addToStack(symbol:Symbol, num:Int):Bool
	{
		if (background.getStackWight() < symbol.getTextWidth()+15) {
			background.changeStackWidth(symbol.getTextWidth()+15);
		}
		var symbolX:Int = Std.int(background.getStackX() + (background.getStackWight() - symbol.getTextWidth()) / 2 + 45);
		var symbolY:Int = Std.int(background.getStackY() + background.getStackHeight() - num * 40 - 40);
		symbol.changeCoor(symbolX, symbolY);
		return true;
	}
	
	public function addToOutput(symbol:Symbol):Bool
	{
		if(symbol.getValue()!= ""){
			symbol.changeCoor(outputCoorX + outputDelta, outputCoorY);
			outputDelta += symbol.getTextWidth() + space;
			outputList.add(symbol);
		}
		return true;
	}
	
	public function printSignature():Bool
	{
		var max:Int;
		return true;
	}
	
}