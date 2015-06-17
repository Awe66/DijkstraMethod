package parseLogic;
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

	public function new(writer:Writer) 
	{
		mainStack = new GenericStack<Symbol>();
		this.writer = writer;
	}
	
	public function nextStep(symbol:Symbol) 
	{
		addToStack(symbol);
	}
	
	private function addToStack(newOperator:Symbol)
	{		
		if (!newOperator.isOperator()) {
			writer.add(newOperator);
			return;
		}
		
		var headOperator:Symbol;
		headOperator = mainStack.first();
		
		if (newOperator.getValue() == ")") {
			while (!mainStack.isEmpty() && headOperator.getValue() != "(") {
				writer.add(mainStack.pop());
				headOperator = mainStack.first();
			}
		}
		
		while (!mainStack.isEmpty() && ((headOperator.isLeft() && (headOperator.getPriority() >= newOperator.getPriority())) 
				|| (!headOperator.isLeft() && (headOperator.getPriority() > newOperator.getPriority()))) )
		{
			writer.add(mainStack.pop());
			headOperator = mainStack.first();
		}
		mainStack.add(newOperator);
	}
	
	public function end()
	{
		while (!mainStack.isEmpty())
		{
			writer.add(mainStack.pop());
		}
	}
	
}