package crawler;

import JQuery;
import js.Lib;
import utils.StopWatch;
import utils.URLParser;

/**
 * ...
 * @author mikecann.co.uk
 */

class URLCrawler 
{
	public var url : String;
	public var crawlTimer : StopWatch;
	
	public function new(url:String) 
	{
		this.url = url;
	}
	
	public function beginCrawling():Void
	{	
		trace("Starting Crawl to: " + url);
		crawlTimer = new StopWatch();
		JQueryS.get(url, null, onCrawlReturn);
	}
	
	private function onCrawlReturn(data:Dynamic):Void 
	{			
		crawlTimer.stop("Crawl Complete");	
		
		var html : String = data;
		
		var parser : HTMLParser = new HTMLParser(URLParser.parse(url),html);
		parser.parse();
		
		
		
		
		//trace("Crawl returned with html -> "+html);
	}
	
}