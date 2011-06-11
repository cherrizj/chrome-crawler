package crawler;
import crawler.crawling.URLCrawler;
import crawler.rendering.RaphelRenderer;
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
	private var _renderer : RaphelRenderer;

	public function new() 
	{
		CrawlerSettings.startingUrl = Lib.window.location.search.substr(5);		
		_crawler = new URLCrawler(CrawlerSettings.startingUrl);		

		_renderer = new RaphelRenderer(_crawler);
		
		//_crawler.beginCrawling();
		_renderer.beginRendering();
	}	
}