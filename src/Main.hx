package;

import graphic.DrawBackground;
import graphic.FirstScreen;
import graphic.WriterToConsole;
import graphic.WriterToView;
import openfl.display.Sprite;
import openfl.events.KeyboardEvent;
import openfl.events.Event;
import openfl.Lib;
import openfl.text.TextFormat;
import parseLogic.ParseAlgo;
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
	 public var background:DrawBackground;
	 private var firstScreen:FirstScreen;
	 private var reader:Reader;
	 private var algo:MainAlgo;
	 private var writer:Writer;
	 private var symbolFormat:TextFormat = new TextFormat("Times New Roman", 50, 0x000000, true);
	public function new() 
	{
		super();
		inputScreen();
		return;
	}
	private function onStart(e:Event)
	{
		background = new DrawBackground();
		writer = new WriterToView(background, symbolFormat);
		reader = new ReaderFromString(firstScreen.readString());
		algo = new MainAlgo(reader, writer);
		firstScreen.visible = false;
		addChild(background);
		addChild(algo);
		Lib.current.stage.focus = algo;
		algo.start();
	}

	private function inputScreen()
	{
		firstScreen = new FirstScreen(symbolFormat);
		addChild(firstScreen);
		firstScreen.addEventListener("read me", onStart);
	}
}
