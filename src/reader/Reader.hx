package reader;
import src.Operator;
import types.Symbol;

/**
 * @author Awe66
 */
interface Reader 
{
	public function readNext():types.Symbol;
}