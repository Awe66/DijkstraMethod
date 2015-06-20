package reader;
import types.Symbol;

/**
 * @author Awe66
 */
interface Reader 
{
	public function readNext():Symbol;
	public function hasNext():Bool;
	
}