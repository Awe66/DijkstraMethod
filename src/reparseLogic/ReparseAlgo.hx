package reparseLogic;

import graphic.ErrorsField;
import haxe.CallStack;
import haxe.ds.GenericStack;
import openfl.display.Sprite;
import openfl.events.Event;
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
	private var stackLength:Int=1;
	private var error:ErrorsField;
	private var isEnd:Bool = false;
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
			if (stackLength - 1<2) {
				error = new ErrorsField(300, 300, "invalid action");
				dispatchEvent(new Event('end'));
				isEnd = true;
				addChild(error);
				return;
			}else {
				var firstElement:Symbol = mainStack.pop();
				var secondElement:Symbol = mainStack.pop();
				var newSymbol:Symbol = makeOperation(firstElement, secondElement, symbol);
				
				
				firstElement.dontShowTextView();
				secondElement.dontShowTextView();
				symbol.dontShowTextView();
				
				stackLength -= 2;
				
				
				writer.add(newSymbol);
				mainStack.add(newSymbol);
				addChild(newSymbol);
				
				writer.addToStack(newSymbol, stackLength);
				
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
		if (isEnd) {
			return;
		}
		isEnd = true;
		if (stackLength != 2) {
			error = new ErrorsField(300, 300, "stack isn't empty");
			dispatchEvent(new Event('end'));
			addChild(error);
			return;
		} else {
			error = new ErrorsField(300, 300, "I FEEL GOOD");
			dispatchEvent(new Event('end'));
			addChild(error);
		}
	}
}