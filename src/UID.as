package  
{
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.text.TextField;
	import flash.text.TextFormat;
	import game.Game;
	
	/**
	 * ...
	 * @author justin Bieshaar
	 */
	public class UID extends Sprite 
	{
		private var waveText:TextField;
		private var wavesleftText:TextField;
		private var lifeText:TextField;
		private var tf:TextFormat;
		private var pointText:TextField;
		public var time:int;
		public var lifes:int = 0;
		public var totalWaves:int;
		public var wave:int;
		public static var points:int = 200;
		
		private var bg:HudBG;
		public var mission:String;
		private var done:String = "done";
		public var lifeBar:HealthBar;
		
		public var lifeFrame = 0;
		
		public function UID() 
		{
			waveText = new TextField();
			tf = new TextFormat("arial", 15, 0xffffff, false);
			addChild(waveText);
			waveText.x = 580;
			waveText.y = 10;
			waveText.text = "";
			waveText.setTextFormat(tf);
			waveText.width = 410;
			waveText.selectable = false;
			
			lifeText = new TextField();
			addChild(lifeText);
			lifeText.x = 720;
			lifeText.y = 30;
			lifeText.text = "";
			lifeText.setTextFormat(tf);
			lifeText.width = 300;
			lifeText.selectable = false;
			
			wavesleftText = new TextField();
			addChild(wavesleftText);
			wavesleftText.x = 720;
			wavesleftText.y = 50;
			wavesleftText.text = "";
			wavesleftText.setTextFormat(tf);
			wavesleftText.width = 300;
			wavesleftText.selectable = false;
			
			pointText = new TextField();
			addChild(pointText);
			pointText.x = 720;
			pointText.y = 70;
			pointText.text = "";
			pointText.setTextFormat(tf);
			pointText.width = 300;
			pointText.selectable = false;
			
			lifeBar = new HealthBar();
			addChild(lifeBar);
			lifeBar.x = 400;
			lifeBar.y = 30;
			lifeBar.stop();
			
			addEventListener(Event.ENTER_FRAME, update);
		}
		
		private function update(e:Event):void 
		{
			if(!Game.paused){
				if (time == 16) {
					waveText.text = "next wave starts Now!";
					waveText.x = 650;
				}else {
					waveText.text = "next wave starts in : " + time + " seconds";
					waveText.x = 580;
				}
				waveText.setTextFormat(tf);
				if (lifes <= 0) lifeText.text = "Lifes: " + "Death";
				else if(lifes <= 10) lifeText.text = "Lifes: " + lifes;
				lifeText.setTextFormat(tf);
				lifeText.selectable = false;
				
				pointText.text = "points: " + points;
				pointText.setTextFormat(tf);
				pointText.selectable = false;
				
				wavesleftText.text = "wave: " + wave + "/" + totalWaves;
				wavesleftText.setTextFormat(tf);
				wavesleftText.selectable = false;
				
				if (lifes >= 10) {
					mission = "lose";
					dispatchEvent(new Event(done));
				}else if (wave >= totalWaves) {
					mission = "win";
					dispatchEvent(new Event(done));
				}
			}else {
				
			}
			
		}
		
	}

}