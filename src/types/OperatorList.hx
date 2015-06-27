package types;
import graphic.SignatureField;

/**
 * ...
 * @author rowape
 */
class OperatorList 
{

	private var currentString:String;
	private var operators:List<Symbol>;
	private var curSymbol:Symbol;
	private var i:Int = 0;
	
	
	public function new() 
	{
		operators = new List<Symbol>();
		currentString = SignatureField.readCurrentString();
		readOperator();
	}
	
	private function readOperator()
	{
	while (i != currentString.length) {
		var bufString = "";
		bufString += currentString.charAt(i);
		i++;
		if(bufString != " ") { 
		curSymbol =  new Symbol(bufString, SignatureField.priority, SignatureField.leftpressed);
		operators.push(curSymbol);
		} else {
		i++;
		}
		return;
      }
	}
	
	public static function getOperatorList():List<Symbol> {
		return  operators;		
	}
	
}