package ;
import openfl.Assets;
import openfl.display.Bitmap;
import openfl.display.BitmapData;
import openfl.display.Sprite;
import openfl.events.Event;
import openfl.events.EventDispatcher;
import openfl.events.MouseEvent;
import openfl.text.TextField;
import openfl.text.TextFieldAutoSize;
import openfl.text.TextFormat;

/**
 * ...
 * @author ogyrec
 */
class Game extends Sprite
{
	var arrayOfFish:Array<Fish> = [];
	public static var score:Int = 0;
	public var stroke:Int = 40;
	public static var scoreText = new TextField();
	public static var strokeText = new TextField();
	public static var format:TextFormat = new TextFormat();
	public var text = new TextField();
	public function new() 
	{
		super();
		
		score = 0;
		stroke = 40;
		graphics.beginFill(0x1c6cb0);
		graphics.drawRect(0, 0, 800, 480);
		graphics.endFill();
		
		for (x in 0 ... 10) {
			for (y in 0 ... 10) {
				var bgData:BitmapData = Assets.getBitmapData("img/bgtile.png");
				var bgBitmap = new Bitmap(bgData);	
				bgBitmap.x = 80 * x;
				bgBitmap.y = 79 * y;
				addChild(bgBitmap);
			}
		}
		
		format.size = 20;
		
		scoreText.text = "Вы поймали " + score + " рыбок";
		scoreText.x = 100;
		scoreText.y = 0;
		scoreText.autoSize = TextFieldAutoSize.CENTER;
		scoreText.setTextFormat(format);
		scoreText.mouseEnabled = false;
		
		strokeText.text = "У вас осталось " + stroke + " ходов";
		strokeText.x = 100;
		strokeText.y = 18;
		strokeText.autoSize = TextFieldAutoSize.CENTER;
		strokeText.setTextFormat(format);
		strokeText.mouseEnabled = false;
		
		text.multiline = true;
		text.htmlText = "Привет, я океан. Во мне есть рыба. <br>К сожалению, ты ее не видишь, т.к. она плавает в моих глубинах.<br>Чтобы найти ее, тебе нужно <b>кликать в любое место во мне,</b> и, может, тебе повезет<br>и ты найдешь все 10 рыбок :)<br>Помни, что количество ходов ограничено<br>И да, под текстом рыба тоже может быть";
		text.x = 360;
		text.y = 180;
		//text.condenseWhite = true;
		text.autoSize = TextFieldAutoSize.CENTER;
		text.setTextFormat(format);
		text.mouseEnabled = false;
	
		this.addEventListener(MouseEvent.MOUSE_DOWN, gameClicked);
		
		for (i in 0 ... 10) {
			var a:Float = Std.random(200);
			var b:Float = Std.random(180);
			arrayOfFish.push(new Fish(Math.round(a), Math.round(b)));
			addChild(arrayOfFish[i]);		
		}
		
		addChild(scoreText);
		addChild(text);
		addChild(strokeText);
	}
	
	public function gameClicked(e:MouseEvent) {
		this.stroke--;
		strokeText.text = "У вас осталось " + stroke + " ходов";
		strokeText.setTextFormat(format);
		if (stroke == 0) {
			dispatchEvent(new Event('gameover'));
		}
		if (score == 10) {
			dispatchEvent(new Event('gamewin'));
		}
		if (stroke == 39) {
			removeChild(text);
		}
	}
	
}