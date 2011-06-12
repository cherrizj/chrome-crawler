package crawler.rendering.raphael;
import Raphael;

/**
 * ...
 * @author mikecann.co.uk
 */

class Node 
{
	// Consts
	inline static public var colours : Array<String> = ["754C24","C7B299","F26C4F","3BB878","736357","605CA8","A67C52"];
	
	// Publics
	public var x(getX, setX) : Float;
	public var y(getY, setY) : Float;
	
	// Privates
	private var _x : Float;
	private var _y : Float;
	private var _velX : Float;
	private var _velY : Float;
	private var _paper : Raphael;
	private var _graphic : RaphaelElement;	
	
	public function new(paper:Raphael) 
	{
		_paper = paper;
		init();
	}
	
	public function update():Void 
	{		
		// Update the position
		x += _velX;
		y += _velY;
		
		// Reboud from the wall
		var d : Dynamic = _paper.canvas;
		if (x > d.clientWidth) { _velX = -_velX; x = d.clientWidth; }
		if (y > d.clientHeight) { _velY = -_velY; y = d.clientHeight; }
		if (x < 0) { _velX = -_velX; x = 0; }
		if (y < 0) { _velY = -_velY; y = 0; }
	}
	
	private function init():Void 
	{
		// Make the graphic
		_graphic = _paper.circle(0, 0, 4+Math.random()*10);
		_graphic.attr("fill", "#"+colours[Std.int(Math.random() * colours.length)]); // 
		_graphic.attr("stroke", "#fff");
		
		// Give it a random position
		var d : Dynamic = _paper.canvas;
		x = Math.random() * d.clientWidth;
		y = Math.random() * d.clientHeight;
		
		// Give it a random starting velocity
		_velX = -5 + Math.random() * 10;
		_velY = -5 + Math.random() * 10;
	}
	
	// Accessors
	inline private function getX() : Float { return _x; }
	inline private function getY() : Float { return _y; }
	inline private function setX(v:Float) : Float { _graphic.attrSet("cx", v); return _x=v; }
	inline private function setY(v:Float) : Float { _graphic.attrSet("cy", v); return _y=v; }
	
}