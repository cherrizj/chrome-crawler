package ;

import chrome.Extension;
import chrome.MessageSender;
import chrome.Tab;
import chrome.Tabs;
import crawler.CrawlerTabMain;
import hxjson2.JSON;
import js.Lib;
import popup.PopupMain;
import utils.ConsoleTracing;

/**
 * ...
 * @author mikecann.co.uk
 */
 
class Main 
{
	public function new()
	{
		// Listen for when its all good to go
		new JQuery(onPageReady);
	}
	
	private function onPageReady() : Void
	{
		trace("Page is ready, yey!");
		if (Lib.document.title == "popup") { new PopupMain(); }
		else { new CrawlerTabMain(); }	
	}	
	
	static function main() 
	{
		// First make sure our traces go to the correct place
		ConsoleTracing.setRedirection();
		
		// Kick it all off
		new Main();	
	}
}