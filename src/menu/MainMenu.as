package menu 
{
	import assets.ButtonPH;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.MouseEvent;
	/**
	 * ...
	 * @author justin Bieshaar
	 */
	public class MainMenu extends Sprite
	{
		private var _startGame:String = "startGame";
		private var startButton:Start;
		private var howToButton:HowToPlay;
		private var creditsButton:Credits;
		private var fullScreen:Fullscreen;
		private var backButton:Back;
		private var creditsText:CreditsText;
		private var logo:Logo;
		private var bg:MenuBG;
		
		public function MainMenu() 
		{
			bg = new MenuBG();
			addChild(bg);
			
			logo = new Logo();
			logo.x = 400;
			logo.y = 70;
			addChild(logo);
			logo.visible = true;
			logo.useHandCursor = false;
			
			startButton = new Start();
			startButton.x = 400;
			startButton.y = 200;
			addChild(startButton);
			startButton.visible = true;
			
			howToButton = new HowToPlay();
			howToButton.x = 400;
			howToButton.y = 300;
			addChild(howToButton);
			howToButton.visible = true;
			
			creditsButton = new Credits();
			creditsButton.x = 400;
			creditsButton.y = 400;
			addChild(creditsButton);
			creditsButton.visible = true;
			
			creditsText = new CreditsText();
			creditsText.x = 0;
			creditsText.y = 0;
			addChild(creditsText);
			creditsText.visible = false;
			
			backButton = new Back();
			backButton.x = 80;
			backButton.y = 550;
			addChild(backButton);
			backButton.visible = false;
			
			fullScreen = new Fullscreen();
			fullScreen.x = 400;
			fullScreen.y = 500;
			addChild(fullScreen);
			fullScreen.visible = true;
			
			addEventListener(MouseEvent.CLICK, startGame);
			
		}
		
		private function startGame(e:MouseEvent):void 
		{
			if (e.target == startButton) {
				dispatchEvent(new Event(_startGame));
			} else if (e.target == howToButton) {
				startButton.visible = false;
				howToButton.visible = false;
				creditsButton.visible = false;
				fullScreen.visible = false;
				creditsText.visible = false;
				
				backButton.visible = true;
			} else if (e.target == creditsButton) {
				startButton.visible = false;
				howToButton.visible = false;
				creditsButton.visible = false;
				fullScreen.visible = false;
				creditsText.visible = true;
				
				backButton.visible = true;
			} else if (e.target == howToButton) {
				startButton.visible = false;
				howToButton.visible = false;
				creditsButton.visible = false;
				fullScreen.visible = false;
				creditsText.visible = true;
				
				backButton.visible = true;
			} else if (e.target == backButton) {
				startButton.visible = true;
				howToButton.visible = true;
				creditsButton.visible = true;
				fullScreen.visible = true;
				creditsText.visible = false;
				
				backButton.visible = false;
			}
		}
		
	}

}