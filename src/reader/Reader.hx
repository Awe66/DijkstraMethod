package reader;
import types.Operator;
import types.Symbol;

/**
 * @author Awe66
 */
interface Reader 
{
	public function readNext():Symbol;
}