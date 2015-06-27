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
	private static var textWidth:Int = 800;
	private static  var textHeight:Int = 50; 
	private var buttonLeft:Bitmap;
	private var buttonRight:Bitmap;
	private var buttonEnd:Bitmap;
	private static var ButL_X:Int = 100;
	private static var ButL_Y:Int = 100;
	private static var ButR_X:Int = 150;
	private static var ButR_Y:Int = 100;
	private static var ButE_X:Int = 250;
	private static var ButE_Y:Int = 100;
	public static var leftpressed:Bool = false;
	public var rightpressed:Bool = false;
	private var endpressed:Bool = false;
	public static var priority:Int = 0;
	
	public function new(symbolFormat:TextFormat) 
	{
		super();
		InputTextField = new TextField();
		InputTextField.type = TextFieldType.INPUT;
		InputTextField.maxChars = 20;
		InputTextField.border = true;
		InputTextField.selectable = true;
		InputTextField.borderColor = 0x000000;
		InputTextField.width = textWidth;
		InputTextField.height = textHeight;
		InputTextField.defaultTextFormat = symbolFormat;
		addEventListener(KeyboardEvent.KEY_DOWN, onKeyDown);
		drawBack();
		drawButtons();
		addChild(InputTextField);
		buttonLeft.addEventListener(MouseEvent.MOUSE_DOWN, onMouseDownLeft);
		buttonRight.addEventListener(MouseEvent.MOUSE_DOWN, onMouseDownRight);
		buttonEnd.addEventListener(MouseEvent.MOUSE_DOWN, onMouseDownEnd);
	}
	
	private function onMouseDownLeft(e:Event){
		leftpressed = true;
		rightpressed = false;
		buttonLeft = new Bitmap(Assets.getBitmapData('radiobutton_fill.png'));
		buttonRight = new Bitmap(Assets.getBitmapData('radiobutton_empty.png'));
		addChild(buttonLeft);
		addChild(buttonRight);
	}
	
	private function onMouseDownRight(e:Event) {
		rightpressed = true;
		leftpressed = false;
		buttonLeft = new Bitmap(Assets.getBitmapData('img/radiobutton_empty.png'));
		buttonRight = new Bitmap(Assets.getBitmapData('img/radiobutton_fill.png'));
		addChild(buttonLeft);
		addChild(buttonRight);	
	}
	
	private function onMouseDownEnd(e:Event){
		endpressed = true;
		removeChild(buttonLeft);
		removeChild(buttonRight);
		removeChild(buttonEnd);
		removeChild(InputTextField);
	}
	
	private function drawBack()
	{
		graphics.beginFill(0xFFFFFFF);
		graphics.drawRect(0,0,3000, 3000);
	}
			
	private function onKeyDown(e:KeyboardEvent) 
	{
		if (e.keyCode == 13) {
			while (endpressed == false) {
			
				if (InputTextField.text.length == 0) {
					InputTextField.text = 'Please print something';
					return;
				} else {
				priority++;
				}
			}
		}
	}	

	
	public function drawButtons(){
		buttonLeft = new Bitmap(Assets.getBitmapData('img/radiobutton_empty.png'));
		buttonRight = new Bitmap(Assets.getBitmapData('img/radiobutton_empty.png'));
		buttonEnd = new Bitmap(Assets.getBitmapData('img/endsignaturebutton.png'));
		buttonLeft.x = ButL_X;
		buttonLeft.y = ButL_Y;
		buttonRight.x = ButR_X;
		buttonRight.y = ButR_Y;
		buttonEnd.x = ButE_X;
		buttonEnd.y = ButE_Y;
		addChild(buttonLeft);
		addChild(buttonRight);
		addChild(buttonEnd);
		}

		public static function readCurrentString():String
	{
		return InputTextField.text;
	}	
}