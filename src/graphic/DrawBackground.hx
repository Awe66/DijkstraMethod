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

	private var stackBottom:Bitmap;
	private var stackWallLeft:Bitmap;
	private var stackWallRight:Bitmap;
	private var stackX:Int = 40;
	private var stackY:Int = 50;
	private var defaultStackWidth:Float;
	public function new() 
	{
		super();
		drawStack();
		drawBack();
		
		
	}
		
		
	private function drawStack() 
	{
		stackBottom = new Bitmap(Assets.getBitmapData('img/stack/stackbottom.png'));
		stackWallLeft = new Bitmap(Assets.getBitmapData('img/stack/stackwall.png'));
		stackWallRight = new Bitmap(Assets.getBitmapData('img/stack/stackwall.png'));
		stackWallLeft.scaleY = 0.7;
		stackWallRight.scaleY = 0.7;
		defaultStackWidth = stackBottom.width;
		stackBottom.x = stackX;
		stackBottom.y = stackY+stackWallRight.height;
		stackWallLeft.x = stackX;
		stackWallLeft.y = stackY;
		stackWallRight.x = stackX+stackBottom.width - stackWallRight.width;
		stackWallRight.y = stackY;
		addChild(stackBottom);
		addChild(stackWallLeft);
		addChild(stackWallRight);
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
		return Std.int(stackWallRight.height);
	}
	
	public function getStackWight():Int
	{
		return Std.int(stackBottom.width);
	}
	
	public function changeStackWidth(newWidth:Int)
	{
		stackBottom.scaleX = newWidth / defaultStackWidth;
		stackWallRight.x = stackX+stackBottom.width- stackWallRight.width;
		trace(newWidth+" "+ stackBottom.width);
	}
	
	private function drawBack()
	{
		graphics.beginFill(0xFFFFFFF);
		graphics.drawRect(0,0,3000, 3000);
	}
}