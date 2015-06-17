package reader;
import haxe.io.Input;
import haxe.xml.Check.Attrib;
import types.Symbol;

/**
 * ...
 * @author Awe66
 */
class ReaderFromConsole implements Reader
{

	var currentString:String;
	var index:Int;
	var symbols:List<Symbol>;
	public function new() 
	{
		currentString = "2^5^a+4*3>12!2*b#4";
		index = -1;
		symbols = new List<Symbol>();
		symbols.push(new Symbol("+", 3, false));
		symbols.push(new Symbol("-", 3, false));
		symbols.push(new Symbol("*", 4, false));
		symbols.push(new Symbol("/", 4, false));
		symbols.push(new Symbol("(", 0, true));
		symbols.push(new Symbol(")", 0, true));
		symbols.push(new Symbol("^", 5, true));
		symbols.push(new Symbol(">", 2, false));
		symbols.push(new Symbol("<", 2, false));
		symbols.push(new Symbol("#", 2, false));
		symbols.push(new Symbol("!", 1, false));
		
		
	}
	
	public function readNext():Symbol
	{
		var bufString:String = "";
		if (isOperations(currentString.charAt(index))) {
			bufString += currentString.charAt(index);
			index++;
			return new Symbol(bufString, getPriorityOfCurrentSymbol(bufString), isLeft(bufString));
		}
		while (index < currentString.length && !isOperations(currentString.charAt(index))) {
			bufString += currentString.charAt(index);
			index++;
		}
		if (isOperations(bufString)) {
			return new Symbol(bufString, getPriorityOfCurrentSymbol(bufString), isLeft(bufString));
		}
		return new Symbol(bufString, -1, true);
	}
	
	public function hasNext()
	{
		if (index < currentString.length) {
				return true;
		} else
		{
			return false;
		}
	}
	
	private function isOperations(test:String):Bool
	{
		var buf:Symbol;
		for (buf in symbols) {
			if (test == buf.getValue()) {
				return true;
			}
		}
		return false;
	}
	
	private function getPriorityOfCurrentSymbol(currentSymbol:String):Int
	{
		var buf:Symbol;
		for (buf in symbols)
		{
			if (buf.getValue() == currentSymbol) {
				return buf.getPriority();
			}
		}
		return -1;
	}
	
	private function isLeft(currentSymbol:String):Bool
	{
		var buf:Symbol;
		for (buf in symbols)
		{
			if (buf.getValue() == currentSymbol) {
				return buf.isLeft();
			}
		}
		return false;
	}
	
}