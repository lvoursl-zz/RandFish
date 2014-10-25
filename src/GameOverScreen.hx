package ;
import openfl.display.Sprite;
import openfl.events.MouseEvent;
import openfl.text.TextField;
import openfl.text.TextFieldAutoSize;

/**
 * ...
 * @author ogyrec
 */
class GameOverScreen extends Sprite
{

	public function new(type:Int) 
	{
		super();
		graphics.beginFill(0x000000);
		graphics.drawRect(0, 0, 800, 480);
		graphics.endFill();
		
		var text = new TextField();
		if (type == 0) {
			text.text = "Вы проиграли :( "; 
		} else if (type == 1) {
			text.text = "Вы выйграли :) "; 
		}
		text.x = 360;
		text.y = 220;
		text.textColor = 0xffffff;
		text.autoSize = TextFieldAutoSize.CENTER;
		addChild(text);

	}
	
	
}