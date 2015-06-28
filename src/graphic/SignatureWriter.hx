package graphic;
import openfl.Assets;
import openfl.display.Bitmap;
import openfl.display.Sprite;
import openfl.text.TextField;
import openfl.text.TextFieldAutoSize;
import openfl.text.TextFormat;
import types.OperatorList;
import types.Symbol;

/**
 * ...
 * @author Awe66
 */
class SignatureWriter extends Sprite
{
	
	private var operatorList:OperatorList;
	private var maxPriority:Int;
	private var corX:Int = 0;
	private var textFormat:TextFormat;
	
	public function new(operatorList:OperatorList, textFormat:TextFormat) 
	{
		super();
		this.textFormat = textFormat;
		this.operatorList = operatorList;
		maxPriority = operatorList.getMaxPriority();
		drawSignature();
	}
	
	private function drawSignature()
	{
		var i:Int = 0;
		var outputString:String = "";
		var bufList:List<Symbol>; 
		while(i<=maxPriority)
		{
			outputString = "";
			bufList = operatorList.getOperatorWithPriority(i);
			var bufOperator:Symbol;
			var left:Bool = false;
			for (bufOperator in bufList)
			{
				outputString += bufOperator.getValue() + " ";
				
				left = bufOperator.isLeft();
			}
			trace(outputString);
			var textField:TextField = new TextField();
			textField.autoSize = TextFieldAutoSize.LEFT;
			textField.x = corX;
			textField.defaultTextFormat = textFormat;
			textField.text = outputString;
			textField.selectable = false;
			addChild(textField);
			drawArrow(Std.int(textField.width), left, corX);
			corX += Std.int(textField.width) + 20;
			i++;
		}
	}
	
	private function drawArrow(length:Int, isLeft:Bool, corX:Int)
	{
		var line:Bitmap = new Bitmap(Assets.getBitmapData('img/signature/line.png'));
		line.scaleX = length/line.width;
		line.x = corX;
		line.y = 50;
		var peak:Bitmap;
		if (isLeft) {
			peak = new Bitmap(Assets.getBitmapData('img/signature/leftpeak.png'));
			peak.x = corX-2;
		} else {
			peak = new Bitmap(Assets.getBitmapData('img/signature/rightpeak.png'));
			peak.x = corX + length - peak.width+2;
		}
		peak.y = line.y + Std.int(line.height/2) - Std.int(peak.height / 2);
		addChild(line);
		addChild(peak);
	}
	
	
	
}