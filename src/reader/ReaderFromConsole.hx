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
	var symbols:List<String>;
	public function new() 
	{
		currentString = "23+42-13+10";
		index = 0;
		symbols = new List<String>();
		symbols.add("}");
		symbols.add("{");
		symbols.add("+");
		symbols.add("-");
		symbols.add("(");
		symbols.add(")");
		
	}
	
	public function readNext():Symbol
	{
		while (index < currentString.length || !isOperations(currentString.charAt(index))) {
			
		}
		return null;
	}
	
	private function isOperations(test:String)
	{
		var buf:String;
		for (buf in symbols) {
			if (test == buf) {
				return true;
			}
		}
		return false;
	}
	
}