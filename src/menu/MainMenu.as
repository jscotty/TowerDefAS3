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
		private var button:ButtonPH;
		private var bg:MenuBG;
		
		public function MainMenu() 
		{
			bg = new MenuBG();
			addChild(bg);
			
			button = new ButtonPH();
			button.x = 100;
			button.y = 40;
			addChild(button);
			
			button.addEventListener(MouseEvent.CLICK, startGame);
			
		}
		
		private function startGame(e:MouseEvent):void 
		{
			dispatchEvent(new Event(_startGame));
		}
		
	}

}