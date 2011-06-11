package crawler.crawling;
import utils.URLParser;

/**
 * ...
 * @author mikecann.co.uk
 */

class CrawledHTMLParser 
{
	public var html : String;
	public var pageURL : URLParser;
	
	public function new(pageURL:URLParser,html:String)
	{
		this.html = html;
		this.pageURL = pageURL;
	}

	/*
	
	// Loop through each
	$(links).each(function()
	{
		var linkURL = this+"";	
		var absoluteURL = linkURL;	
		var parsed = parseUri(linkURL);
		var protocol = parsed["protocol"];					

		if(linkURL == "[object DOMWindow]")
		{
			counts.domWindows++;
			return true; 
		}
		else if(startsWith(linkURL,"/"))
		{
			 absoluteURL = page.host+linkURL; 
			 counts.roots++;
		}
		else if(protocol=="")
		{
			 absoluteURL = page.host+"/"+linkURL; 
			 counts.roots++;
		}
		else if(protocol=="javascript")
		{
			 //console.log("Not Crawling URL, cannot follow javascript --- "+hrefURL); 
			 counts.scripts++;
			 return true; 
		}		
		else if(protocol!="http" && protocol!="https")
		{
			 //console.log("Not crawling URL, unknown protocol --- "+JSON.stringify({protocol:protocol, url:hrefURL})); 
			 counts.badProtocols++;
			 return true; 
		}
			
		if(!allPages[absoluteURL])
		{			
			// Increment the count
			counts.newValids++;
			
			// Build the page object
			var o = {};
			o.depth = page.depth+1;
			o.url = absoluteURL;
			o.state = page.depth==settings.maxDepth?"max_depth":"queued";
			o.host = parseUri(o.url)["protocol"] + "://" + parseUri(o.url)["host"];
											
			// Get the file extension
			var extn = getFileExt(absoluteURL);
			
			//console.log(JSON.stringify(o));
			
			// Is this an interesting extension?
			if(isInArr(settings.interestingFileTypes,extn)) { o.isFile=true; counts.interestings++; }		
			
			// Save the page in our master array
			allPages[absoluteURL] = o;		
		}
		else
		{
			counts.oldValids++;
		}
		
	});
	
	// Debugging is good
	console.log("Page Crawled --> "+JSON.stringify({page:page, counts:counts}));
	
	// This page is crawled
	allPages[page.url].state = "crawled";		
	
	// Check to see if anything else needs to be crawled
	crawlMore();	
	
	// Render the changes
	//refreshPage();
	*/
	public function parse() : Void
	{
		var links : Array<String> = getLinksOnPage();		
		for (link in links)
		{
			var absoluteURL : String = link;	
			var parsed = new URLParser(absoluteURL);
			
			if(parsed.url.charAt(0)=="/") {	 absoluteURL = pageURL.url+link; }
			else if(parsed.protocol=="") { absoluteURL = pageURL.protocol+pageURL.host+"/"+link; }
			else if(parsed.protocol=="javascript")
			{
				//console.log("Not Crawling URL, cannot follow javascript --- "+hrefURL); 
				continue; 
			}		
			else if(parsed.protocol!="http" && parsed.protocol!="https")
			{
				 //console.log("Not crawling URL, unknown protocol --- "+JSON.stringify({protocol:protocol, url:hrefURL})); 
				 continue; 
			}
			
			trace("link: "+absoluteURL);
		}
		
		//trace("Links "+links);		
	}
	
	// $(page).find('[src]').each(function(){ links.push($(this).attr('src')); });	
	private function getLinksOnPage() : Array<String>
	{		
		var links : Array<String> = [];
		var o : JQuery = new JQuery(html).find('[href]').each(function(index:Dynamic, value:Dynamic) { links.push(new JQuery(value).attr('href')); } );	
		var o : JQuery = new JQuery(html).find('[src]').each(function(index:Dynamic, value:Dynamic) { links.push(new JQuery(value).attr('src')); } );	
		return links;		
	}
	
}