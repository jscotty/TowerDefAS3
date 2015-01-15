package  
{
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.text.TextField;
	import flash.text.TextFormat;
	
	/**
	 * ...
	 * @author justin Bieshaar
	 */
	public class UID extends Sprite 
	{
		private var waveText:TextField;
		private var lifeText:TextField;
		private var tf:TextFormat;
		public var time:int;
		public var lifes:int = 10;
		
		public function UID() 
		{
			waveText = new TextField();
			tf = new TextFormat("arial", 30, 0xffffff, false);
			addChild(waveText);
			waveText.x = 20;
			waveText.y = 10;
			waveText.text = "";
			waveText.setTextFormat(tf);
			waveText.width = 400;
			
			lifeText = new TextField();
			addChild(lifeText);
			lifeText.x = 20;
			lifeText.y = 50;
			lifeText.text = "";
			lifeText.setTextFormat(tf);
			lifeText.width = 400;
			
			addEventListener(Event.ENTER_FRAME, update);
		}
		
		private function update(e:Event):void 
		{
			if (time == 16) {
				waveText.text = "next wave starts Now!";
			}else {
				waveText.text = "next wave starts in : " + time + " seconds";
			}
			waveText.setTextFormat(tf);
			if (lifes <= 0) lifeText.text = "Lifes: " + "Death";
			else if(lifes <= 10) lifeText.text = "Lifes: " + lifes;
			lifeText.setTextFormat(tf);
			
		}
		
	}

}