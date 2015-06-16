package parseLogic;
import haxe.CallStack;
import haxe.ds.GenericStack;
import types.Symbol;
import types.Operator;
import src.graphic.Writer;
/**
 * ...
 * @author Awe66
 */
class Algo
{
	private var mainStack:GenericStack<Operator>;
	private var writer:Writer;

	public function new(writer:Writer) 
	{
		mainStack = new GenericStack<Operator>();
		this.writer = writer;
	}
	
	public function nextStep(operator:Operator) 
	{
		addToStack(operator);
	}
	
	private function addToStack(newOperator:Operator)
	{
		var headOperator:Operator;
		headOperator = mainStack.head.elt;
		while ((headOperator.isLeft() && (headOperator.getPriority() >= newOperator.getPriority())) 
				|| (!headOperator.isLeft() && (headOperator.getPriority() > newOperator.getPriority())))
		{
			writer.add(mainStack.pop());
			headOperator = mainStack.head.elt;
		}
		mainStack.add(newOperator);
	}
	
}