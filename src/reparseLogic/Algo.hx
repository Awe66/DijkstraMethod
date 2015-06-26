package reparseLogic;

import haxe.CallStack;
import haxe.ds.GenericStack;
import types.Symbol;
import src.graphic.Writer;

/**
 * ...
 * @author Awe66
 */
class Algo
{
	private var mainStack:GenericStack<Symbol>;
	private var writer:Writer;
	private var stackLength:Int;
	public function new(writer:Writer) 
	{
		mainStack = new GenericStack<Symbol>();
		this.writer = writer;
	}
	
	public function nextStep()
	{
		addToStack(nextSymbol:Symbol);
	}
	
	private function addToStack(symbol:Symbol)
	{
		if (!symbol.isOperator())
		{
			mainStack.add(symbol);
			writer.addToStack(symbol, stackLength);
			stackLength++;
		}else {
			if (stackLength<2) {
				//exception
			}else {
				var firstElement:Symbol = mainStack.pop();	
				var secondElement:Symbol = mainStack.pop();
				var newSymbol:Symbol = makeOperation(firstElement, secondElement, symbol);
				firstElement.dontShowTextView();
				secondElement.dontShowTextView();
				stackLength-=2;
				mainStack.addToStack(newSymbol, stackLength);
			}
		}
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