package src;
import graphic.WriterToConsole;
import openfl.display.Sprite;
import openfl.events.KeyboardEvent;
import parseLogic.Algo;
import reader.ReaderFromString;
import src.graphic.Writer;
import graphic.WriterToView;
import types.Symbol;
import reader.Reader;

/**
 * ...
 * @author rowape
 */
class MainAlgo extends Sprite
{
    private var currentVariable:Symbol; //
	var reader: Reader;
	var writer: Writer;
	var algo: Algo;
	private var listOfSymbols:List<Symbol>;
	public function new(reader:Reader, writer:Writer) 
	{
		super();
		this.reader = reader;
		this.writer = writer;
		algo = new Algo(writer);
		listOfSymbols = new List<Symbol>();
	}
	public function start()
	{
		while (reader.hasNext())
		{
			currentVariable = reader.readNext();
			writer.add(currentVariable);
			listOfSymbols.add(currentVariable);
			addChild(currentVariable);
		}
		addEventListener(KeyboardEvent.KEY_DOWN, onKeyDown);
		
	}
	
	
	private function onKeyDown(e:KeyboardEvent) 
	{
		if (e.keyCode == 13) 
		{
			nextStep();
		}
	}
	
	public function nextStep()
	{
		trace('Enter pressed');
		if (listOfSymbols.isEmpty()) {
			algo.end();
			return;
		}
		
		currentVariable = listOfSymbols.pop();
		
		if (!currentVariable.isOperator()) 
		{
			writer.addToOutput(currentVariable);
		} else 
		{
			algo.nextStep(currentVariable);
		}
		
	}
}