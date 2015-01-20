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
		private var creditsText:CeditsScreen;
		private var logo:Logo;
		private var bg:MenuBG;
		private var htp1:HowToPlayScr1;
		private var htp2:HowToPlayScr2;
		private var arrowL:ArrowLeft;
		private var arrowR:ArrowRight;
		private var soundOff:SoundOn;
		private var soundOn:SoundOff;
		
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
			
			creditsText = new CeditsScreen();
			creditsText.x = 0;
			creditsText.y = 0;
			addChild(creditsText);
			creditsText.visible = false;
			
			backButton = new Back();
			backButton.x = 80;
			backButton.y = 550;
			backButton.scaleX = 0.5;
			backButton.scaleY = 0.5;
			addChild(backButton);
			backButton.visible = false;
			
			htp1 = new HowToPlayScr1();
			addChild(htp1);
			htp1.visible = false;
			
			htp2 = new HowToPlayScr2();
			addChild(htp2);
			htp2.visible = false;
			
			arrowL = new ArrowLeft();
			arrowL.x = 130;
			arrowL.y = 550;
			addChild(arrowL);
			arrowL.visible = false;
			
			arrowR = new ArrowRight();
			arrowR.x = 180;
			arrowR.y = 550;
			addChild(arrowR);
			arrowR.visible = false;
			
			fullScreen = new Fullscreen();
			fullScreen.x = 400;
			fullScreen.y = 500;
			addChild(fullScreen);
			fullScreen.visible = true;
			
			soundOff = new SoundOn();
			soundOff.x = 50;
			soundOff.y = 30;
			soundOff.scaleX = 0.5;
			soundOff.scaleY = 0.5;
			addChild(soundOff);
			soundOff.visible = true;
			
			soundOn = new SoundOff();
			soundOn.x = 50;
			soundOn.y = 30;
			soundOn.scaleX = 0.5;
			soundOn.scaleY = 0.5;
			addChild(soundOn);
			soundOn.visible = false;
			
			addEventListener(MouseEvent.CLICK, startGame);
			
		}
		
		private function startGame(e:MouseEvent):void 
		{
			if (e.target == startButton) {
				Main.soundSystem.playMusic(0, 1, false);
				
				dispatchEvent(new Event(_startGame));
			} else if (e.target == howToButton) {
				Main.soundSystem.playMusic(0, 1, false);
				
				startButton.visible = false;
				howToButton.visible = false;
				creditsButton.visible = false;
				fullScreen.visible = false;
				creditsText.visible = false;
				
				backButton.visible = true;
			} else if (e.target == creditsButton) {
				Main.soundSystem.playMusic(0, 1, false);
				
				startButton.visible = false;
				howToButton.visible = false;
				creditsButton.visible = false;
				fullScreen.visible = false;
				creditsText.visible = true;
				
				backButton.visible = true;
			} else if (e.target == howToButton) {
				Main.soundSystem.playMusic(0, 1, false);
				
				startButton.visible = false;
				howToButton.visible = false;
				creditsButton.visible = false;
				fullScreen.visible = false;
				creditsText.visible = true;
				
				backButton.visible = true;
			} else if (e.target == backButton) {
				Main.soundSystem.playMusic(0, 1, false);
				
				startButton.visible = true;
				howToButton.visible = true;
				creditsButton.visible = true;
				fullScreen.visible = true;
				creditsText.visible = false;
				
				backButton.visible = false;
			} else if (e.target == soundOff) {
				Main.soundSystem.playMusic(0, 1, false);
				
				soundOn.visible = true;
				soundOff.visible = false;
				
				Main.soundOff = true;
			} else if (e.target == soundOn) {
				Main.soundSystem.playMusic(0, 1, false);
				
				soundOn.visible = false;
				soundOff.visible = true;
				
				Main.soundOff = false;
			}
		}
		
	}

}