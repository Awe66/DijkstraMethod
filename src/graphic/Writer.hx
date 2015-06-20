package src.graphic;

import openfl.display.Sprite;
import reader.Reader;
import types.Symbol;

/**
 * @author Awe66
 */
interface Writer 
{
	public function add(symbol:Symbol):Bool;
	public function addToStack(symbol:Symbol, number:Int):Bool;
	public function addToOutput(symbol:Symbol):Bool;
	public function endFirstPart():Bool;
	public function printSignature():Bool;	
}