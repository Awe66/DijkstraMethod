package;

import graphic.Button;
import graphic.DrawBackground;
import graphic.SignatureWriter;
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
import openfl.display.Bitmap;
import openfl.Assets;

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
	 public var symbolFormat:TextFormat = new TextFormat("Colibri", 50, 0x000000, true);
	 private var signatureField:SignatureField;
	 private var signatureWriter:SignatureWriter;
	 private var operatorList:OperatorList;
	 private var anewButton:Button = new Button(new Bitmap(Assets.getBitmapData('img/buttons/anewbutton.png')), 1, 1);
	 
	 
	public function new() 
	{
		super();
		readSignature();
		addChild(anewButton);
		anewButton.addEventListener('click', onMouseClick);
		return;
	}
	
	private function onStart(e:Event)
	{
		background = new DrawBackground();
		writer = new WriterToView(background, symbolFormat);
		reader = new ReaderFromString(stringField.readString(), operatorList);
		algo = new MainAlgo(reader, writer);
		signatureWriter = new SignatureWriter(operatorList, symbolFormat);
		signatureWriter.x = 500;
		signatureWriter.y = 400;
		
		stringField.visible = false;
		background.x = 45;
		addChild(background);
		addChild(algo);
		Lib.current.stage.focus = algo;
		addChild(signatureWriter);
		algo.start();
	}

	private function inputStringField(e:Event)
	{
		removeChild(signatureField);
		signatureField.removeEventListener('signature', inputStringField);
		signatureField.removeEventListener('read me', readBlockOfOperators);
		stringField = new StringField(symbolFormat);
		stringField.x = 45;
		addChild(stringField);
		stringField.addEventListener("read me", onStart);
	}
	
	private function readSignature()
	{
		signatureField = new SignatureField(symbolFormat);
		operatorList = new OperatorList(signatureField);
		signatureField.x = 45;
		addChild(signatureField);
		signatureField.addEventListener('signature', inputStringField);
		signatureField.addEventListener('read me', readBlockOfOperators);
	}
	
	
	//read next block of operators from signatureField
	private function readBlockOfOperators(e:Event)
	{
		operatorList.readNext();
	}
	

	private function onMouseClick(e:Event){
	
		readSignature();	
	}
	
}
