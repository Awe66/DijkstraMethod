package;

import graphic.DrawBackground;
import graphic.StringField;
import graphic.SignatureField;
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
import types.OperatorList;

/**
 * ...
 * @author Awe66
 */

 class Main extends Sprite 
{
	 public var background:DrawBackground;
	 private var stringField:StringField;
	 private var reader:Reader;
	 private var algo:MainAlgo;
	 private var writer:Writer;
	 public var symbolFormat:TextFormat = new TextFormat("Times New Roman", 50, 0x000000, true);
	 private var signatureField:SignatureField;
	 private var operatorList:OperatorList;
	 
	 
	public function new() 
	{
		super();
		readSignature();
		return;
	}
	
	private function onStart(e:Event)
	{
		background = new DrawBackground();
		writer = new WriterToView(background, symbolFormat);
		reader = new ReaderFromString(stringField.readString(), operatorList);
		algo = new MainAlgo(reader, writer);
		stringField.visible = false;
		addChild(background);
		addChild(algo);
		Lib.current.stage.focus = algo;
		algo.start();
	}

	private function inputStringField(e:Event)
	{
		removeChild(signatureField);
		signatureField.removeEventListener('signature', inputStringField);
		signatureField.removeEventListener('read me', readBlockOfOperators);
		stringField = new StringField(symbolFormat);
		addChild(stringField);
		stringField.addEventListener("read me", onStart);
	}
	
	private function readSignature()
	{
		signatureField = new SignatureField(symbolFormat);
		operatorList = new OperatorList(signatureField);
		addChild(signatureField);
		Lib.current.stage.focus = signatureField;
		signatureField.addEventListener('signature', inputStringField);
		signatureField.addEventListener('read me', readBlockOfOperators);
	}
	
	
	//read next block of operators from signatureField
	private function readBlockOfOperators(e:Event)
	{
		operatorList.readNext();
	}
	
}
