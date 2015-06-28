package graphic;
import openfl.display.Bitmap;
import openfl.display.Sprite;
import openfl.events.Event;
import openfl.events.MouseEvent;

/**
 * ...
 * @author Awe66
 */
class Button extends Sprite
{

	private var pic:Bitmap;
	public function new(pic:Bitmap, corX:Int, corY:Int) 
	{
		super();
		this.pic = pic;
		pic.x = corX;
		pic.y = corY;
		pic.addEventListener(MouseEvent.MOUSE_DOWN, click);
		addChild(pic);
	}
	
	public function setVisible(visible:Bool)
	{
		pic.visible = visible;
	}
	
	public function click(e:MouseEvent) 
	{
		dispatchEvent(new Event("click"));
	}
	
}