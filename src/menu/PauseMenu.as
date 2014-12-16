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
		private var creditsText:CreditsText;
		private var options:Options;
		private var fullscreen:Fullscreen;
		private var back:Back;
		private var closeMenu:String = "closeMenu";
		
		public function PauseMenu() 
		{
			pauseBG = new BGPaused();
			addChild(pauseBG);
			
			pauseLogo = new GamePausedLogo();
			pauseLogo.x = 400;
			pauseLogo.y = 80;
			addChild(pauseLogo);
			
			options = new Options();
			options.x = 400;
			options.y = 200;
			addChild(options);
			options.visible = true;
			
			credits = new Credits();
			credits.x = 400;
			credits.y = 320;
			addChild(credits);
			credits.visible = true;
			
			creditsText = new CreditsText();
			addChild(creditsText);
			creditsText.visible = false;
			
			fullscreen = new Fullscreen();
			fullscreen.x = 400;
			fullscreen.y = 200;
			addChild(fullscreen);
			fullscreen.visible = false;
			
			back = new Back();
			back.x = 80;
			back.y = 550;
			addChild(back);
			back.visible = false;
			
			resume = new Resume();
			resume.x = 720;
			resume.y = 550;
			addChild(resume);
			resume.visible = true;
			
			addEventListener(MouseEvent.CLICK, onClick);
		}
		
		private function onClick(e:MouseEvent):void 
		{
			if (e.target == resume) dispatchEvent(new Event(closeMenu));
			else if (e.target == options) {
				options.visible = false;
				credits.visible = false;
				
				creditsText.visible = false;
				fullscreen.visible = true;
				
				back.visible = true;
			} else if (e.target == credits) {
				options.visible = false;
				credits.visible = false;
				
				creditsText.visible = true;
				fullscreen.visible = false;
				
				back.visible = true;
			} else if (e.target == back) {
				options.visible = true;
				credits.visible = true;
				
				creditsText.visible = false;
				fullscreen.visible = false;
				
				back.visible = false;
			}
		}
		
	}

}