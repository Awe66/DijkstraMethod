package graphic;
import openfl.Assets;
import openfl.display.Bitmap;
import openfl.display.Sprite;

/**
 * ...
 * @author rowape
 */
class DrawBackground extends Sprite
{

	private var stack:Bitmap;
	private var stackX:Int = 40;
	private var stackY:Int = 50;
			
	public function new() 
	{
		super();
		drawStack();
		drawBack();
		
		
	}
		
		
	private function drawStack() 
	{
		stack = new Bitmap(Assets.getBitmapData('img/stack.png'));
		stack.scaleY = 0.7;
		stack.x = stackX;
		stack.y = stackY;
		addChild(stack);
	}
	
	public function getStackX():Int
	{
		return stackX;
	}
	
	public function getStackY():Int
	{
		return stackY;
	}
	
	public function getStackHeight():Int
	{
		return Std.int(stack.height);
	}
	
	public function getStackWight():Int
	{
		return Std.int(stack.width);
	}
	
	private function drawBack()
	{
		graphics.beginFill(0xFFFFFFF);
		graphics.drawRect(0,0,3000, 3000);
	}
}