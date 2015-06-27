package reparseLogic;

import haxe.CallStack;
import haxe.ds.GenericStack;
import openfl.display.Sprite;
import openfl.text.TextFormat;
import types.Symbol;
import src.graphic.Writer;

/**
 * ...
 * @author Awe66
 */
class ReparseAlgo extends Sprite
{
	private var mainStack:GenericStack<Symbol>;
	private var writer:Writer;
	private var stackLength:Int=0;
	
	public function new(writer:Writer) 
	{
		super();
		mainStack = new GenericStack<Symbol>();
		this.writer = writer;
	}
	
	public function nextStep(nextSymbol:Symbol)
	{
		addToStack(nextSymbol);
	}
	
	private function addToStack(symbol:Symbol)
	{
		if (!symbol.isOperator())
		{
			mainStack.add(symbol);
			writer.addToStack(symbol, stackLength);
			stackLength++;
		} else {
			if (stackLength<2) {
				//exception
			}else {
				var firstElement:Symbol = mainStack.pop();
				var secondElement:Symbol = mainStack.pop();
				var newSymbol:Symbol = makeOperation(firstElement, secondElement, symbol);
				
				
				firstElement.dontShowTextView();
				secondElement.dontShowTextView();
				symbol.dontShowTextView();
				
				stackLength -= 2;
				trace(1);
				
				writer.add(newSymbol);
				mainStack.add(newSymbol);
				addChild(newSymbol);
				trace(2);
				writer.addToStack(newSymbol, stackLength);
				trace(3);
				stackLength++;
			}
		}
	}
	
	private function makeOperation(firstElement:Symbol, secondElement:Symbol, symbol:Symbol):Symbol
	{
		return new Symbol(secondElement.getValue() + symbol.getValue() + firstElement.getValue(), -1, true);
	}
	
	public function end() 	
	{
		if (stackLength != 1) {
			//exception
		} else {
			//all is good
		}
	}
}