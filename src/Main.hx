package;

import graphic.DrawBackground;
import graphic.WriterToConsole;
import graphic.WriterToView;
import openfl.display.Sprite;
import openfl.events.KeyboardEvent;
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
	 private var background:DrawBackground;
	public function new() 
	{
		super();
		background = new DrawBackground();
		var reader:Reader = new ReaderFromString();
		var writer:Writer = new WriterToView();
		var algo:MainAlgo = new MainAlgo(reader, writer);
		addChild(algo);
		addChild(background);
		algo.start();
		return;
		
	}
	
}
