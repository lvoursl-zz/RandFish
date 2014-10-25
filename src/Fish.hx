package ;
import openfl.Assets;
import openfl.display.Bitmap;
import openfl.display.BitmapData;
import openfl.display.Sprite;
import openfl.events.MouseEvent;


/**
 * ...
 * @author ogyrec
 */
class Fish extends Sprite 
{
	var clicked:Bool = false;
	
	public function new(x:Int, y:Int) 
	{
		super();
		graphics.beginFill(0x1c6cb0, 0);
		this.x = x;
		this.y = y;
		this.alpha = 0;
		graphics.drawRect(this.x, this.y, 100, 100);
		addEventListener(MouseEvent.MOUSE_DOWN, fishClicked);
	}
	
	public function fishClicked(e:MouseEvent) {
		this.alpha = 1;
		/*this.graphics.beginFill(0x1c6cb0);
		this.graphics.drawRect(this.x, this.y, 100, 100);
		this.graphics.endFill();*/
		var fishData:BitmapData = Assets.getBitmapData("img/fish1.png");
		var fishBitmap = new Bitmap(fishData);		
		fishBitmap.scaleX = 0.25;
		fishBitmap.scaleY = 0.25;
		fishBitmap.x = this.x;
		fishBitmap.y = this.y;
		addChild(fishBitmap);
		
		
		if (this.clicked != true) {
			this.clicked = true;
			Game.score++;
			Game.scoreText.text = "Вы поймали " + Game.score + " рыбок";
			Game.scoreText.setTextFormat(Game.format);
		}
		
	}
	
}