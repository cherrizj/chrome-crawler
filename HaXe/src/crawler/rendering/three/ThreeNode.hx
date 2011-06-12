package crawler.rendering.three;
import Raphael;
import three.Scene;
import three.Sprite;
import three.Texture;
import three.Vector2;

/**
 * ...
 * @author mikecann.co.uk
 */

class ThreeNode 
{
	// Consts
	inline static public var colours : Array<String> = ["754C24","C7B299","F26C4F","3BB878","736357","605CA8","A67C52"];
	
	// Publics
	public var x(getX, setX) : Float;
	public var y(getY, setY) : Float;
	public var sprite : Sprite;
	
	// Privates
	private var _x : Float;
	private var _y : Float;
	private var _velX : Float;
	private var _velY : Float;
	private var _scene : Scene;
	private var _three : ThreeRenderer;
	
	public function new(three:ThreeRenderer) 
	{
		_three = three;
	}
	
	public function update():Void 
	{		
		// Update the position
		x += _velX;
		y += _velY;
		
		// Reboud from the wall
		if (x > _three.width) { _velX = -_velX; x = _three.width; }
		if (y > _three.height) { _velY = -_velY; y = _three.height; }
		if (x < 0) { _velX = -_velX; x = 0; }
		if (y < 0) { _velY = -_velY; y = 0; }
	}
	
	public function init(scene:Scene, tex:Texture):Void 
	{
		// Create sprite
		sprite = new Sprite( { map: tex, useScreenCoordinates: true, affectedByDistance: false } );
				
		// Give it a random position
		x = 0 + Math.random() * _three.width; 
		y = 0 + Math.random() * _three.height;
		
		// Give it a random starting velocity
		_velX = -5 + Math.random() * 10;
		_velY = -5 + Math.random() * 10;
	}
	
	// Accessors
	inline private function getX() : Float { return _x; }
	inline private function getY() : Float { return _y; }
	inline private function setX(v:Float) : Float { sprite.position.x = v; return _x=v; }
	inline private function setY(v:Float) : Float { sprite.position.y = v; return _y=v; }
	
}