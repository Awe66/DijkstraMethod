package src;
import graphic.WriterToConsole;
import openfl.display.Sprite;
import openfl.events.Event;
import openfl.events.KeyboardEvent;
import parseLogic.ParseAlgo;
import reader.ReaderFromString;
import reparseLogic.ReparseAlgo;
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
	private var isEnd:Bool = false;
	var reader: Reader;
	var writer: Writer;
	var algo: ParseAlgo;
	var reparseAlgo: ReparseAlgo;
	var salu:Bool = false;
	private var listOfSymbols:List<Symbol>;
	public function new(reader:Reader, writer:Writer) 
	{
		super();
		this.reader = reader;
		this.writer = writer;
		algo = new ParseAlgo(writer);
		reparseAlgo = new ReparseAlgo(writer);
		addChild(reparseAlgo);
		reparseAlgo.addEventListener('end', end);
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
	
	private function end(e:Event)
	{
		if (!isEnd)
		{
			while(!listOfSymbols.isEmpty())
				listOfSymbols.pop();
			removeEventListener(KeyboardEvent.KEY_DOWN, onKeyDown);
			isEnd = true;
		}
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
		if(!isEnd){
			if (listOfSymbols.isEmpty() && !salu) 
			{
				algo.end();
				listOfSymbols = writer.outputList;
				salu = true;
				var bufSymbol:Symbol;
				return;
			}
			
			if (!salu)
			{
				currentVariable = listOfSymbols.pop();
				
				if (!currentVariable.isOperator()) 
				{
					writer.addToOutput(currentVariable);
				} else 
				{
					algo.nextStep(currentVariable);
				}
			} else {
				currentVariable = listOfSymbols.pop();
				reparseAlgo.nextStep(currentVariable);	
			}
			
			if (salu && listOfSymbols.isEmpty()) 
			{
				reparseAlgo.end();
				return;
			}
		}
	}
}