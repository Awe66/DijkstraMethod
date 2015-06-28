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
	private var signField:SignatureField;
	
	public function new(signField:SignatureField) 
	{
		operators = new List<Symbol>();
		this.signField = signField;
	}
	
	public function readNext()
	{
		currentString = signField.readCurrentString();
		readOperator();
	}
	
	private function readOperator()
	{
		
		var bufString:String = "";
		i = 0;
		while (i <= currentString.length) {
			if(currentString.charAt(i)!=' '){
				bufString += currentString.charAt(i);
			} else {
				curSymbol =  new Symbol(bufString, signField.priority, signField.leftpressed);
				bufString = "";
				operators.push(curSymbol);
			}
			i++;
		}
		if (bufString.length != 0) {
			curSymbol =  new Symbol(bufString, signField.priority, signField.leftpressed);
			bufString = "";
			operators.push(curSymbol);
		}
	}
	
	public function getOperatorList():List<Symbol> {
		return  operators;		
	}
	
}