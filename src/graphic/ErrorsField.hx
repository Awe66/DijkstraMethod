package graphic;
import openfl.display.Sprite;
import openfl.events.Event;
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
	private var textWidth:Int = 400;
	private var textHeight:Int = 70;
	private var symbolFormat:TextFormat = new TextFormat("Colibri", 40, 0x8A312F, true);
	
	public function new(errCorX:Int, errCorY:Int, errString:String) 
	{
		super();
		super();
		InputTextField = new TextField();
		InputTextField.type = TextFieldType.INPUT;
		InputTextField.maxChars = 100;
		InputTextField.border = false;
		//InputTextField.selectable = true;
		InputTextField.borderColor = 0x000000;
		InputTextField.width = textWidth;
		InputTextField.height = textHeight;
		InputTextField.defaultTextFormat = symbolFormat;
		InputTextField.x = errCorX;
		InputTextField.y = errCorY;
		InputTextField.text = errString;
		addChild(InputTextField);
		addEventListener(Event.ENTER_FRAME, onFrame);
		
	}
	
	private var frame:Int = 0;
	
	private function onFrame (e:Event){
	
	frame++;
	if (frame>200){ 
	frame = 0;
	InputTextField.text = "";
	removeChild(InputTextField);
		}
	}
	
}