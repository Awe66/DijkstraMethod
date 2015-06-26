package src;
import graphic.WriterToConsole;
import openfl.display.Sprite;
import openfl.events.KeyboardEvent;
import parseLogic.ParseAlgo;
import reparseLogic.ReparseAlgo;
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
    private var currentVariable:Symbol; 
	var reader: Reader;
	var writer: Writer;
	var parseAlgo: ParseAlgo;
	var reparseAlgo: ReparseAlgo;
	
	private var listOfSymbols:List<Symbol>;
	public function new(reader:Reader, writer:Writer) 
	{
		super();
		this.reader = reader;
		this.writer = writer;
		parseAlgo = new ParseAlgo(writer);
		listOfSymbols = new List<Symbol>();
		writer.printSignature();
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
			parseAlgo.end();
			return;
		}
		
		currentVariable = listOfSymbols.pop();
		
		if (!currentVariable.isOperator()) 
		{
			writer.addToOutput(currentVariable);
		} else 
		{
			parseAlgo.nextStep(currentVariable);
		}
		
	}
}