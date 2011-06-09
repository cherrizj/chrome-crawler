package popup;
import chrome.Tab;
import chrome.Tabs;
import hxjson2.JSON;

/**
 * ...
 * @author mikecann.co.uk
 */

class PopupMain 
{

	public function new() 
	{
		new JQuery("#crawlBtn").click(onCrawlClicked);
	}
	
	private function onCrawlClicked() : Void
	{
		var url : String = new JQuery("#crawUrlText").val();
		Tabs.create( { url:"crawlerTab.html?url="+url, selected:true }, onNewTabCreated);
	}
	
	private function onNewTabCreated(tab:Tab) : Void
	{
		trace("New tab created" + JSON.encode(tab));
	}
}