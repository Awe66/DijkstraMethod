package src;
import graphic.WriterToConsole;
import reader.ReaderFromConsole;
import types.Symbol;

/**
 * ...
 * @author rowape
 */
class MainAlgo
{
    private var currentVariable:Symbol; //
	Reader reader = new ReaderFromConsole();
	Writer writer = new WriterToConsole();
	
	public function new() 
	{
		currentVariable = reader.readNext();
		if currentVariable
	}
	
}