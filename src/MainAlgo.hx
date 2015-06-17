package src;
import graphic.WriterToConsole;
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
class MainAlgo
{
    private var currentVariable:Symbol; //
	var reader: Reader;
	var writer: Writer;
	var algo: Algo;
	public function new(reader:Reader, writer:Writer) 
	{
		this.reader = reader;
		this.writer = writer;
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