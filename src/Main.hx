package;

import graphic.WriterToConsole;
import openfl.display.Sprite;
import openfl.Lib;
import parseLogic.Algo;
import reader.ReaderFromString;
import src.graphic.Writer;
import src.MainAlgo;
import reader.Reader;

/**
 * ...
 * @author Awe66
 */

 class Main extends Sprite 
{

	public function new() 
	{
		super();
		var reader:Reader = new ReaderFromString();
		var writer:Writer = new WriterToConsole();
		var algo:MainAlgo = new MainAlgo(reader, writer);
		algo.start();
		return;
		// Assets:
		// openfl.Assets.getBitmapData("img/assetname.jpg");
	}
	
}
