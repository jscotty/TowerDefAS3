package menu 
{
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.MouseEvent;
	/**
	 * ...
	 * @author justin Bieshaar
	 */
	public class PauseMenu extends Sprite
	{
		private var pauseBG:BGPaused;
		private var pauseLogo:GamePausedLogo;
		private var resume:Resume;
		private var credits:Credits;
		private var options:Options;
		private var closeMenu:String = "closeMenu";
		
		public function PauseMenu() 
		{
			pauseBG = new BGPaused();
			addChild(pauseBG);
			
			pauseLogo = new GamePausedLogo();
			pauseLogo.x = 400;
			pauseLogo.y = 80;
			addChild(pauseLogo);
			
			resume = new Resume();
			resume.x = 720;
			resume.y = 550;
			addChild(resume);
			
			addEventListener(MouseEvent.CLICK, onClick);
		}
		
		private function onClick(e:MouseEvent):void 
		{
			if (e.target == resume) dispatchEvent(new Event(closeMenu));
		}
		
	}

}