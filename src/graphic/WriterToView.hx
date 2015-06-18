package graphic;
<<<<<<< HEAD
=======

import openfl.Assets;
import openfl.display.Bitmap;
>>>>>>> origin/master
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
class WriterToView implements Writer extends Sprite
{

	private var stackCoorX:UInt = 10;
	private var stackCoorY:UInt = 150;
	private var outputCoorY:UInt = 140;
	private var outputCoorX:UInt = 150;
	private var outputNumber:UInt = 0;
	
	
	public function new() 
	{
<<<<<<< HEAD
		addEventListener(Event.ENTER_FRAME, onFrame);
	}
	
	private function onFrame(e:Event)
	{
=======
	super();
	var gstack:GStack = new GStack();
	addChild(gstack);
	gstack.x = stackCoorX;
	gstack.y = stackCoorY;
>>>>>>> origin/master
		
	}
	
	private function 
	
	/* INTERFACE src.graphic.Writer */
	var index:Int = 0;
	public function add(symbol:Symbol):Bool 
	{
		index += 40;
		symbol.FONT_SIZE = 40;
		symbol.createTextView();
		symbol.showTextView();
		symbol.changeCoor(index, 20);
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