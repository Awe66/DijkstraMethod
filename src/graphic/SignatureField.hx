package graphic;
import openfl.Assets;
import openfl.display.Sprite;
import openfl.events.KeyboardEvent;
import openfl.events.Event;
import openfl.events.MouseEvent;
import openfl.text.TextField;
import openfl.text.TextFieldType;
import openfl.text.TextFormat;
import openfl.display.Bitmap;

/**
 * ...
 * @author rowape
 */
class SignatureField extends Sprite
{

	private var InputTextField:TextField;
	private var textWidth:Int = 800;
	private var textHeight:Int = 55; 
	private var buttonLeft:Button;
	private var buttonLeftActive:Button;
	private var buttonRight:Button;
	private var buttonRightActive:Button;
	private var buttonEnd:Button;
	private var ButL_X:Int = 100;
	private var ButL_Y:Int = 100;
	private var ButR_X:Int = 150;
	private var ButR_Y:Int = 100;
	private var ButE_X:Int = 250;
	private var ButE_Y:Int = 100;
	private var error:ErrorsField;
	public var leftpressed:Bool = false;
	public var rightpressed:Bool = false;
	private var endpressed:Bool = false;
	
	public var priority:Int = 0;
	
	public function new(symbolFormat:TextFormat) 
	{
		super();
		InputTextField = new TextField();
		InputTextField.type = TextFieldType.INPUT;
		InputTextField.maxChars = 22;
		InputTextField.border = true;
		InputTextField.selectable = true;
		InputTextField.x = 5;
		InputTextField.y = 1;
		InputTextField.borderColor = 0x000000;
		InputTextField.width = textWidth;
		InputTextField.height = textHeight;
		InputTextField.defaultTextFormat = symbolFormat;
		addEventListener(KeyboardEvent.KEY_DOWN, onKeyDown);
		drawBack();
		drawButtons();
		addChild(InputTextField);
		buttonLeft.addEventListener('click', onMouseDownLeft);
		buttonRight.addEventListener('click', onMouseDownRight);
		buttonEnd.addEventListener('click', onMouseDownEnd);
		
	}
	
	private function onMouseDownLeft(e:MouseEvent) 
	{
		trace('left');	
		leftpressed = true;
		rightpressed = false;
		buttonLeftActive.setVisible(true);
		buttonLeft.setVisible(false);
		buttonRight.setVisible(true);
		buttonRightActive.setVisible(false);
	}
	
	private function onMouseDownRight(e:MouseEvent) 
	{
		trace('right');
		rightpressed = true;
		leftpressed = false;
		
		buttonLeftActive.setVisible(false);
		buttonLeft.setVisible(true);
		buttonRight.setVisible(false);
		buttonRightActive.setVisible(true);
	}
	
	private function onMouseDownEnd(e:MouseEvent) 
	{
		trace('signature end');
		endpressed = true;
		removeChild(buttonLeft);
		removeChild(buttonRight);
		removeChild(buttonEnd);
		removeChild(InputTextField);
		dispatchEvent(new Event('signature'));
	}
	
	private function drawBack()
	{
		graphics.beginFill(0xFFFFFFF);
		graphics.drawRect(0,0,3000, 3000);
	}
			
	private function onKeyDown(e:KeyboardEvent) 
	{
		if (e.keyCode == 13) {
			if(!endpressed) {
				if (InputTextField.text.length == 0) {
					//InputTextField.text = 'Please print something';
					error = new ErrorsField(300, 300, "enter signature");
					addChild(error);
					return;
				}
				if ((!rightpressed && !leftpressed)) {
					error = new ErrorsField(300, 300, "select associativity");
					addChild(error);
					return;
				}
				dispatchEvent(new Event('read me'));
				priority++;		
			}
		}
	}

	
	public function drawButtons()
	{
		buttonLeft = new Button(new Bitmap(Assets.getBitmapData('img/buttons/radiobutton_empty_left.png')), ButL_X, ButL_Y) ;
		buttonRight = new Button(new Bitmap(Assets.getBitmapData('img/buttons/radiobutton_empty_right.png')), ButR_X, ButR_Y);
		
		buttonLeftActive = new Button(new Bitmap(Assets.getBitmapData('img/buttons/radiobutton_fill_left.png')), ButL_X, ButL_Y) ;
		buttonRightActive = new Button(new Bitmap(Assets.getBitmapData('img/buttons/radiobutton_fill_right.png')), ButR_X, ButR_Y);
		
		buttonEnd = new Button(new Bitmap(Assets.getBitmapData('img/buttons/endsignaturebutton.png')), ButE_X, ButE_Y);
		addChild(buttonLeftActive);
		addChild(buttonRightActive);
		buttonLeftActive.setVisible(false);
		buttonRightActive.setVisible(false);
		addChild(buttonLeft);
		addChild(buttonRight);
		addChild(buttonEnd);
	}

	public function readCurrentString():String
	{
		var bufString:String = InputTextField.text;
		InputTextField.text = "";
		return bufString;		
	}	
}