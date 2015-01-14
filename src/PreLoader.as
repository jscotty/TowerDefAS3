package  
{
	import flash.display.Sprite;
	import flash.display.Stage;
	import flash.events.Event;
	import flash.text.TextField;
	import flash.text.TextFormat;
	
	/**
	 * ...
	 * @author justin Bieshaar
	 */
	public class PreLoader extends Sprite 
	{
		private var _total:Number;
		private var _loaded:Number;
		private var _precentage:Number;
		private var _fadeCounter:Number = 0;
		
		private var _text:TextField;
		
		private var done:String = "LoadDone";
		
		public function PreLoader(s:Stage) 
		{
			addEventListener(Event.ENTER_FRAME, loader);
			
		}
		public function loader(e:Event):void
		{
			trace("LOADING... <3");
			var tf:TextFormat = new TextFormat("Papyrus", 82, 0x000000,true); // variable voor de text style.
			_text = new TextField();
			_text.text = "Loading...";
			_text.y = 200; // text positie y
			_text.x = stage.stageWidth / 2.5; // text positie x
			addChild(_text);
			_text.selectable = false;
			_text.width = _text.textWidth + 300; // maximale grootte text
			_text.setTextFormat(tf);
			_text.visible = true;
			
			
			_total = this.loaderInfo.bytesTotal;
			_loaded = this.loaderInfo.bytesLoaded;
			_precentage = _loaded / _total;
			
			_precentage = Math.floor(_precentage * 100);
			
			if (_precentage <= 100) 
			{
						dispatchEvent(new Event(done));
						removeEventListener(Event.ENTER_FRAME, loader);
			}
		}
		
	}

}