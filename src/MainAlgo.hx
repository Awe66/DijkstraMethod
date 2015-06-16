package src;
import graphic.WriterToConsole;
import reader.ReaderFromConsole;

/**
 * ...
 * @author rowape
 */
class MainAlgo
{

	Reader reader = new ReaderFromConsole();
	Writer writer = new WriterToConsole();
	
	public function new() 
	{
		reader.readNext()
	}
	
}