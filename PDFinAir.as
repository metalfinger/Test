package  {
	import flash.display.MovieClip;
	import flash.html.HTMLLoader;
	import flash.html.HTMLPDFCapability;
	import flash.net.URLRequest;
	import flash.events.Event;
	import flash.net.URLLoader;
	import flash.events.HTMLUncaughtScriptExceptionEvent;
	
	public class PDFinAir extends MovieClip {

		private var pdf:HTMLLoader;
		
		
		var _html:HTMLLoader;
		
		public function PDFinAir() {
			
			
			trace(HTMLLoader.isSupported);
			
			var htmlDataLoader = new URLLoader();
			htmlDataLoader.addEventListener(Event.COMPLETE, HandleData, false, 0, true);
			htmlDataLoader.load(new URLRequest("TEST.html"));
		}
		
		private function HandleData(e:Event):void
		{
			
			_html = new HTMLLoader();
			var urlReq:URLRequest = new URLRequest("TEST.html");
			
			_html.load(urlReq);
			
			var mapHtml:String = e.target.data;
			
			_html.loadString(mapHtml);
			
			
			_html.addEventListener(Event.COMPLETE, loaded, false, 0, true);
			_html.addEventListener(HTMLUncaughtScriptExceptionEvent.UNCAUGHT_SCRIPT_EXCEPTION, ScriptE, false, 0, true);
			
			function loaded(e:Event):void
			{
				trace("loaded");
			}
			
		}
		
		function ScriptE(e:Event):void
			{
				trace("Script E");
			}
		
		/*{
			var request:URLRequest = new URLRequest("http://www.vignelli.com/canon.pdf");
			pdf = new HTMLLoader();
			pdf.height = 800;
			pdf.width = 600;
			pdf.load(request);
			
			
			pdf.addEventListener(Event.COMPLETE, pdfLoaded);
			
			
		}
		
		private function trac(e:Event):void
		{
			trace(pdf.scrollV, pdf.scrollH);		
		}
		
		private function pdfLoaded(e:Event):void
		{
			addChild(pdf);
			
			pdf.rotationZ = 90;
			
			pdf.scrollV = 500;
			trace(pdf.scrollV, pdf.rotation);
			//this.addEventListener(Event.ENTER_FRAME, trac);
		}*/
	}
}
