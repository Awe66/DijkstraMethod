package types;
import openfl.display.Sprite;
import openfl.text.TextField;
import openfl.text.TextFieldAutoSize;
import openfl.text.TextFormat;

/**
 * ...
 * @author Awe66
 */
class Symbol extends Sprite
{
	var corX:Int=10;
	var corY:Int = 10;
	var operator:Bool;
	private var value:String;
	private var priority:Int;
	private var left:Bool;
	private var textField:TextField;
	
	
	public function new(value:String, priority:Int, left:Bool) 
	{
		super();
		this.value = value;
		this.priority = priority;
		this.left = left;
		operator = (priority >= 0);
	}
	
	public function createTextView(symbolFormat:TextFormat) 
	{
		textField = new TextField();
		textField.defaultTextFormat = symbolFormat;
		textField.autoSize = TextFieldAutoSize.RIGHT;
		textField.height = 100;
		textField.text = value;
		textField.x = corX;
		textField.y = corY;
		textField.selectable = false;
		this.addChild(textField);
		textField.visible = false;
	}
	
	public function getTextWidth():Int
	{
		return Std.int(textField.textWidth);
	}
	
	public function showTextView()
	{
		textField.visible = true;
	}
	
	public function dontShowTextView()
	{
		textField.visible = false;
	}
	
	public function changeCoor(newX:Int, newY:Int)
	{
		this.corX = newX;
		this.corY = newY;
		textField.x = newX;
		textField.y = newY;
	}
	
	public function isOperator():Bool
	{
		return operator;
	}
	
	public function getValue():String
	{
		return value;
	}
	
	public function getPriority():Int {
		return priority;
	}
	
	public function isLeft():Bool {
		return left;
	}

	
}