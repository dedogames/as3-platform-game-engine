package jp.raohmaru.game.core 
{
import flash.text.TextFormat;
import flash.text.TextField;
import flash.display.Sprite;
import flash.geom.Rectangle;
import flash.geom.Point;

/**
 * @author raohmaru
 */
public class GameDebug 
{
	private var _game :PlatformGame,
				_view :Sprite,
				_tf :TextField;

	
	public function GameDebug(game :PlatformGame)
	{
		_game = game;
		
		_view = new Sprite();
		_game.view.addChildAt(_view, _game.view.numChildren-1);
		
		_tf = new TextField();
		_tf.width = 150;
		_tf.height = 100;
		_tf.x = 5;
		_tf.y = _game.camera.viewportRect.height - _tf.height - 5;
		_tf.background = true;
		_tf.backgroundColor = 0xFFFFFF;
		_tf.border = true;
		_tf.defaultTextFormat = new TextFormat("Verdana", 10, 0);
		_tf.multiline = true;
		
		_view.addChild(_tf);
		
		TimeMaster.getInstance().add(onTimerStep);
	}

	public function stop() : void
	{
		_game.view.removeChild(_view);
		_game = null;
		_tf = null;
		_view = null;
		TimeMaster.getInstance().remove(onTimerStep);
	}	
	

	
	private function onTimerStep() :void
	{
		var s :String = "";
		
			s += "(" + _game.player.x + "," + _game.player.y + ")";
			s += "\ren suelo = " + _game.player.state.inFloor;
			s += "\ren esquina = " + _game.player.state.inCorner;
		
		_tf.text = s;
	}
}
}