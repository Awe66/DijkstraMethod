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
	var reader: Reader = new ReaderFromConsole();
	var writer: Writer = new WriterToConsole();
	var algo: Algo = new Algo(writer);
	public function new() 
	{
		currentVariable = reader.readNext();
		if (currentVariable.getValue().charAt(0) < '9' && currentVariable.getValue().charAt(0) > '0') 
		{
			writer.add(currentVariable);
		} else 
		
		{
			algo.nextStep(currentVariable);
		}
	
}