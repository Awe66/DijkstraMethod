package src;
import graphic.WriterToConsole;
import parseLogic.Algo;
import reader.ReaderFromConsole;
import src.graphic.Writer;
import types.Symbol;
import reader.Reader;

/**
 * ...
 * @author rowape
 */
class MainAlgo
{
    private var currentVariable:Symbol; //
	var reader: Reader;
	var writer: Writer;
	var algo: Algo;
	public function new() 
	{
		reader = new ReaderFromConsole();
		writer = new WriterToConsole();
		algo = new Algo(writer);
	}
	public function start() {
		while (reader.hasNext())
		{
			currentVariable = reader.readNext();
			if (!currentVariable.isOperator()) 
			{
				writer.add(currentVariable);
			} else 
			{
				algo.nextStep(currentVariable);
			}
		}
		
		algo.end();
	}
}