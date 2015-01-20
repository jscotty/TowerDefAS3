package menu 
{
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.MouseEvent;
	/**
	 * ...
	 * @author justin Bieshaar
	 */
	public class HowToPlayMenu extends Sprite
	{
		private var bg1:HowToPlayScr1;
		private var arrowL:ArrowLeft;
		private var arrowR:ArrowRight;
		private var skip:Start;
		private var bg2:HowToPlayScr2;
		public var startGame:String = "startGame";
		
		public function HowToPlayMenu() 
		{
			bg1 = new HowToPlayScr1();
			bg2 = new HowToPlayScr2();
			arrowL = new ArrowLeft();
			arrowR = new ArrowRight();
			skip = new Start();
			addChild(bg1);
			addChild(bg2);
			addChild(arrowL);
			addChild(arrowR);
			addChild(skip);
			
			bg1.visible = true;
			bg2.visible = false;
			
			arrowL.x = 50;
			arrowL.y = 550;
			arrowL.scaleX = 0.6;
			arrowL.scaleY = 0.6;
			
			arrowR.x = 120;
			arrowR.y = 550;
			arrowR.scaleX = 0.6;
			arrowR.scaleY = 0.6;
			
			skip.x = 700;
			skip.y = 550;
			skip.scaleX = 0.6;
			skip.scaleY = 0.6;
			
			addEventListener(MouseEvent.CLICK, onClick);
		}
		
		private function onClick(e:MouseEvent):void 
		{
			if (e.target == skip) {
				Main.soundSystem.playMusic(0, 1, false);
				
				dispatchEvent(new Event(startGame));
			} else if (e.target == arrowL) {
				Main.soundSystem.playMusic(0, 1, false);
				
				bg1.visible = true;
				bg2.visible = false;
			} else if (e.target == arrowR) {
				Main.soundSystem.playMusic(0, 1, false);
				
				bg1.visible = false;
				bg2.visible = true;
			}
		}
		
	}

}