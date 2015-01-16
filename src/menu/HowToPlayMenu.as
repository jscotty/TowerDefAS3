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
		private var bg:BGPaused;
		private var arrowL:ArrowLeft;
		private var arrowR:ArrowRight;
		private var skip:Start;
		public var startGame:String = "startGame";
		
		public function HowToPlayMenu() 
		{
			bg = new BGPaused();
			arrowL = new ArrowLeft();
			arrowR = new ArrowRight();
			skip = new Start();
			addChild(bg);
			addChild(arrowL);
			addChild(arrowR);
			addChild(skip);
			
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
				dispatchEvent(new Event(startGame));
			}
		}
		
	}

}