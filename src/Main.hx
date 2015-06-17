package;

import graphic.WriterToConsole;
import openfl.display.Sprite;
import openfl.Lib;
import parseLogic.Algo;
import reader.ReaderFromConsole;
import src.MainAlgo;

/**
 * ...
 * @author Awe66
 */

 class Main extends Sprite 
{

	public function new() 
	{
		super();
		trace('hi');
		var algo:MainAlgo = new MainAlgo();
		trace('hi 1');
		algo.start();
		trace('hail');
		return;
		// Assets:
		// openfl.Assets.getBitmapData("img/assetname.jpg");
	}
	
}
