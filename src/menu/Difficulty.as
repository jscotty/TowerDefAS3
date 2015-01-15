package menu 
{
	import flash.display.Sprite;
	import flash.events.MouseEvent;
	/**
	 * ...
	 * @author justin Bieshaar
	 */
	public class Difficulty extends Sprite
	{
		private var bg:MenuBG;
		private var logo:ChooseDiff;
		private var easyBtn:EasyBtn;
		private var mediumBtn:MediumBtn;
		private var hardBtn:HardBtn;
		
		public function Difficulty() 
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
			
			addEventListener(MouseEvent.CLICK, startGame);
		}
		
		private function startGame(e:MouseEvent):void 
		{
			if (e.target == easyBtn) {
				
			} else if (e.target == mediumBtn) {
				
			} else if (e.target == hardBtn) {
				
			}
		}
		
	}

}