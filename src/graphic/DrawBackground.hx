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
		stack = new Bitmap(Assets.getBitmapData('img/stack.png'));
		stack.scaleY = 0.7;
		stack.x = stackX;
		stack.y = stackY;
		addChild(stack);
	}
	
}