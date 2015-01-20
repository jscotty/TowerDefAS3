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
		public var lifes:int = 80;
		public var totalWaves:int;
		public var wave:int;
		public static var points:int = 1200;
		
		private var bg:HudBG;
		public var mission:String;
		private var doneDeath:String = "doneD";
		private var doneWin:String = "doneW";
		private var tf2:TextFormat;
		public var lifeBar:HealthBar;
		
		public var lifeFrame:int = 0;
		
		public function UID() 
		{
			waveText = new TextField();
			tf = new TextFormat("sketchy", 24, 0xffffff, false);
			tf2 = new TextFormat("sketchy", 30, 0xffffff, false);
			addChild(waveText);
			waveText.x = 200;
			waveText.y = 50;
			waveText.text = "";
			waveText.setTextFormat(tf2);
			waveText.width = 410;
			waveText.selectable = false;
			
			wavesleftText = new TextField();
			addChild(wavesleftText);
			wavesleftText.x = 670;
			wavesleftText.y = 80;
			wavesleftText.text = "";
			wavesleftText.setTextFormat(tf);
			wavesleftText.width = 300;
			wavesleftText.selectable = false;
			
			pointText = new TextField();
			addChild(pointText);
			pointText.x = 670;
			pointText.y = 120;
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
				if (time == 31) {
					waveText.text = "next wave starts Now!";
					waveText.x = 240;
				}else {
					waveText.text = "next wave starts in : " + time + " seconds";
					waveText.x = 210;
				}
				waveText.setTextFormat(tf2);
				
				pointText.text = "points: " + points;
				pointText.setTextFormat(tf);
				pointText.selectable = false;
				
				wavesleftText.text = "wave: " + wave + "/" + totalWaves;
				wavesleftText.setTextFormat(tf);
				wavesleftText.selectable = false;
				
				lifeBar.gotoAndStop(lifeFrame);
				
				if (lifeFrame >= 99) {
					dispatchEvent(new Event(doneDeath));
				}else if (wave >= totalWaves) {
					dispatchEvent(new Event(doneWin));
				}
			}else {
				
			}
			
		}
		
	}

}