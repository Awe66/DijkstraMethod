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
		operators.add(new Symbol("(", 100, true));
		operators.add(new Symbol(")", 100, true));
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
	
	public function getOperatorList():List<Symbol> 
	{
		return  operators;		
	}
	
	public function getOperatorWithPriority(priority:Int):List<Symbol>
	{
		var buf:Symbol;
		var outputList:List<Symbol> = new List<Symbol>();
		for (buf in operators)
		{
			if (buf.getPriority() == priority) {
				outputList.add(buf);
			}
		}
		return outputList;
	}
	
	public function getMaxPriority():Int
	{
		var buf:Symbol;
		var maxPriority:Int = -1;
		for (buf in operators)
		{
			if (buf.getPriority() > maxPriority && buf.getValue()!=")" && buf.getValue()!="(") {
				maxPriority = buf.getPriority();
			}
		}
		return maxPriority;
	}
	
}