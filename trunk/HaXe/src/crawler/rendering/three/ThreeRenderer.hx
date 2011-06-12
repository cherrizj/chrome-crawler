package crawler.rendering.three;
import crawler.crawling.URLCrawler;
import haxe.Timer;
import js.Lib;
import three.Camera;
import three.CanvasRenderer;
import three.Matrix4;
import three.Projector;
import three.RequestAnimationFrame;
import three.Scene;
import three.Sprite;
import three.Texture;
import three.WebGLRenderer;

/**
 * ...
 * @author mikecann.co.uk
 */

class ThreeRenderer 
{
	// Publics
	public var crawler : URLCrawler;
	public var camera : Camera;
	public var scene : Scene;
	public var renderer : WebGLRenderer;	
	public var width : Int;
	public var height : Int;
	
	// Privates		
	private var _updateTimer : Timer;
	private var _nodes : Array<ThreeNode>;
	
	public function new(c:URLCrawler) 
	{
		crawler = c;
	}
	
	public function beginRendering(window:Dynamic) : Void
	{
		if (window == null) { return; }		
		
		new JQuery(Lib.window).resize(onResize);
		
		width = Lib.window.innerWidth;
		height = Lib.window.innerHeight;
		
		// Initialize camera
		camera = new Camera( 60, width / height, 1, 10000 );
		camera.position.z = 1500;

		// Create scene
		scene = new Scene();
		//_scene.up

		// Create renderer
		renderer = new WebGLRenderer(); // { antialias: true }
		renderer.setSize( width, height );
		renderer.sortObjects = false;
		//_renderer.setClearColorHex(0xff0000,1);

		// Load scene	
		window.appendChild(renderer.domElement);		
		
		// Init
		makeNodes();
		
		// Begin updates
		_updateTimer = new Timer(32);
		_updateTimer.run = render;
	}
	
	private function onResize():Void 
	{
		width = Lib.window.innerWidth;
		height = Lib.window.innerHeight;
		renderer.setSize( width, height );
	}
	
	private function makeNodes():Void 
	{
		// Make tex
		var tex : Texture = untyped __js__ ("THREE.ImageUtils.loadTexture") ("images/icon32.png");

		// Make the nodes all with the same texture
		_nodes = new Array<ThreeNode>();
		for (i in 0...2000)
		{
			var n : ThreeNode = new ThreeNode(this);
			n.init(scene, tex);
			scene.addObject( n.sprite );
			_nodes.push(n);
		}
	}
	
	private function render() : Void
	{
		// Update the nodes
		for (i in 0..._nodes.length){ _nodes[i].update(); }
		renderer.render( scene, camera );
	}
	
}