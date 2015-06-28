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
	private var inputTextField:TextField;
	private var textWidth:Int = 400;
	private var textHeight:Int = 70;
	private var symbolFormat:TextFormat = new TextFormat("Colibri", 40, 0xFF0000, true);
	
	public function new(errCorX:Int, errCorY:Int, errString:String) 
	{
		super();
		super();
		inputTextField = new TextField();
		inputTextField.maxChars = 100;
		inputTextField.border = false;
		inputTextField.selectable = false;
		inputTextField.borderColor = 0x000000;
		inputTextField.width = textWidth;
		inputTextField.height = textHeight;
		inputTextField.defaultTextFormat = symbolFormat;
		inputTextField.x = errCorX;
		inputTextField.y = errCorY;
		inputTextField.text = errString;
		addChild(inputTextField);
		
		addEventListener(Event.ENTER_FRAME, onFrame);
		
	}
	
	private var frame:Int = 0;
	
	private function onFrame (e:Event){
	
		frame++;
		if (frame>200){ 
			frame = 0;
			inputTextField.text = "";
			inputTextField.visible = false;
		}
	}
	
}