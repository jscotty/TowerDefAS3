package menu 
{
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.MouseEvent;
	/**
	 * ...
	 * @author justin Bieshaar
	 */
	public class DifficultyMenu extends Sprite
	{
		private var bg:MenuBG;
		private var logo:ChooseDiff;
		private var easyBtn:EasyBtn;
		private var mediumBtn:MediumBtn;
		private var hardBtn:HardBtn;
		private var start:String = "start";
		private var levelcreator:LevelCreateBtn;
		
		public var difficulty:String = "";
		
		public function DifficultyMenu() 
		{
			bg = new MenuBG();
			addChild(bg);
			
			logo = new ChooseDiff();
			logo.x = 400;
			logo.y = 70;
			addChild(logo);
			
			easyBtn = new EasyBtn();
			easyBtn.x = 400;
			easyBtn.y = 200;
			addChild(easyBtn);
			
			mediumBtn = new MediumBtn();
			mediumBtn.x = 400;
			mediumBtn.y = 300;
			addChild(mediumBtn);
			
			hardBtn = new HardBtn();
			hardBtn.x = 400;
			hardBtn.y = 400;
			addChild(hardBtn);
			
			levelcreator = new LevelCreateBtn();
			levelcreator.x = 400;
			levelcreator.y = 520;
			addChild(levelcreator);
			
			addEventListener(MouseEvent.CLICK, startGame);
		}
		
		private function startGame(e:MouseEvent):void 
		{
			if (e.target == easyBtn) {
				Main.soundSystem.playMusic(0, 1, false);
				
				difficulty = "easy";
				dispatchEvent(new Event(start));
			} else if (e.target == mediumBtn) {
				Main.soundSystem.playMusic(0, 1, false);
				
				difficulty = "medium";
				dispatchEvent(new Event(start));
			} else if (e.target == hardBtn) {
				Main.soundSystem.playMusic(0, 1, false);
				
				difficulty = "hard";
				dispatchEvent(new Event(start));
			}
		}
		
	}

}