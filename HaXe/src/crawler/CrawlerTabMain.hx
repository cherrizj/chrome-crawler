package crawler;
import hxjson2.JSON;
import js.Lib;

/**
 * ...
 * @author mikecann.co.uk
 */

class CrawlerTabMain 
{

	public function new() 
	{
		CrawlerSettings.startingUrl = Lib.window.location.search.substr(5);		
		new URLCrawler(CrawlerSettings.startingUrl).beginCrawling();	
	}	
}