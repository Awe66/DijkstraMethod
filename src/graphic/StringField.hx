package graphic;
import openfl.display.Sprite;
import openfl.events.KeyboardEvent;
import openfl.events.Event;
import openfl.text.TextField;
import openfl.text.TextFieldType;
import openfl.text.TextFormat;

/**
 * ...
 * @author Awe66
 */
class StringField extends Sprite
{
	private var InputTextField:TextField;
	private var textWidth:Int = 800;
	private var textHeight:Int = 50;
	private var error:ErrorsField;
	
	
	public function new(symbolFormat:TextFormat) 
	{
		super();
		error = new ErrorsField(300, 300, "enter expression");
		InputTextField = new TextField();
		InputTextField.type = TextFieldType.INPUT;
		InputTextField.maxChars = 20;
		InputTextField.border = true;
		InputTextField.selectable = true;
		InputTextField.borderColor = 0x000000;
		InputTextField.x = 5;
		InputTextField.y = 1;
		InputTextField.width = textWidth;
		InputTextField.height = textHeight;
		InputTextField.defaultTextFormat = symbolFormat;
		addEventListener(KeyboardEvent.KEY_DOWN, onKeyDown);
		drawBack();
		addChild(InputTextField);
	}
	
	private function drawBack()
	{
		graphics.beginFill(0xFFFFFFF);
		graphics.drawRect(0,0,3000, 3000);
	}
	
	private function onKeyDown(e:KeyboardEvent) 
	{
		if (e.keyCode == 13) {
			if (InputTextField.text.length == 0) {
				//InputTextField.text = 'Please print something';
				addChild(error);
				return;
			}
			trace('event');
			dispatchEvent(new Event("read me"));
		}
	}
	
	public function readString():String
	{
		return InputTextField.text;
	}
	
}