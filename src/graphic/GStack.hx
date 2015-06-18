package graphic;
import openfl.Assets;
import openfl.display.Bitmap;
import openfl.display.Sprite;

/**
 * ...
 * @author rowape
 */
class GStack extends Sprite
{

	public function new() 
	{
	super();
	addChild(new Bitmap(Assets.getBitmapData('img/stack.png')));
	}
	
}