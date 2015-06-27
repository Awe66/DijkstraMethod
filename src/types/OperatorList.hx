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
	var signField: SignatureField;
	
	
	public function new() 
	{
		signField = new SignatureField();
		operators = new List<Symbol>();
		currentString = signField.readCurrentString();
		readOperator();
	}
	
	private function readOperator()
	{
	while (i != currentString.length) {
		var bufString = "";
		bufString += currentString.charAt(i);
		i++;
		if(bufString != " ") { 
		curSymbol =  new Symbol(bufString, signField.priority, signField.leftpressed);
		operators.push(curSymbol);
		} else {
		i++;
		}
		return;
      }
	}
	
	public function getOperatorList():List<Symbol> {
		return operators;		
	}
	
}