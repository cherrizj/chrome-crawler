package crawler.rendering.raphael;
import crawler.crawling.URLCrawler;
import haxe.Timer;
import js.Lib;
import Raphael;

/**
 * ...
 * @author mikecann.co.uk
 */

class RaphaelRenderer 
{	
	// Privates
	private var _crawler : URLCrawler;
	private var _paper : Raphael;
	private var _updateTimer : Timer;
	private var _nodes : Array<Node>;

	public function new(crawler:URLCrawler) 
	{
		_crawler = crawler;
		_paper = new Raphael(0, 0, "100%", "100%");
	}

	public function beginRendering() : Void
	{
		_updateTimer = new Timer(30);
		_updateTimer.run = onUpdate;		
		
		_nodes = new Array<Node>();
		for (i in 0...300)
		{
			var n : Node = new Node(_paper);
			_nodes.push(n);
		}
		
	}
	
	private function onUpdate():Void 
	{		
		for (i in 0..._nodes.length)
		{		
			_nodes[i].update();
		}
		
	}
}