package crawler;
import crawler.crawling.URLCrawler;
import crawler.rendering.raphael.RaphaelRenderer;
import crawler.rendering.three.ThreeRenderer;
import hxjson2.JSON;
import js.Lib;

/**
 * ...
 * @author mikecann.co.uk
 */

class CrawlerTabMain 
{
	// Privates
	private var _crawler : URLCrawler;
	private var _renderer : ThreeRenderer;

	public function new() 
	{
		CrawlerSettings.startingUrl = Lib.window.location.search.substr(5);		
		_crawler = new URLCrawler(CrawlerSettings.startingUrl);		

		_renderer = new ThreeRenderer(_crawler);
		
		//_crawler.beginCrawling();
		_renderer.beginRendering(new JQuery("#renderTarget")[0]);
	}	
}