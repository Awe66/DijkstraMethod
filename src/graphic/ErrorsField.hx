package graphic;
import openfl.display.Sprite;
import openfl.text.TextField;
import openfl.text.TextFieldType;
import openfl.text.TextFormat;

/**
 * ...
 * @author rowape
 */

class ErrorsField extends Sprite
{
	private var InputTextField:TextField;
	private var textWidth:Int = 300;
	private var textHeight:Int = 70;
	private var symbolFormat:TextFormat = new TextFormat("Colibri", 50, 0x8A8A8A, true);
	
	public function new(errCorX:Int, errCorY:Int, errString:String) 
	{
		super();
		super();
		InputTextField = new TextField();
		InputTextField.type = TextFieldType.INPUT;
		InputTextField.maxChars = 30;
		InputTextField.border = true;
		InputTextField.selectable = true;
		InputTextField.borderColor = 0x000000;
		InputTextField.width = textWidth;
		InputTextField.height = textHeight;
		InputTextField.defaultTextFormat = symbolFormat;
		InputTextField.x = errCorX;
		InputTextField.y = errCorY;
		InputTextField.text = errString;
		addChild(InputTextField);
	}
	
}