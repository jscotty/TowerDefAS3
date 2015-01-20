package menu 
{
	import flash.display.Sprite;
	import game.Game;
	
	/**
	 * ...
	 * @author justin Bieshaar
	 */
	public class EndScreen extends Sprite 
	{
		private var screen;
		public function startEndScreen(mission:String):void 
		{
			if (mission == "lose") {
				screen = new LoseScreen();
			} else if (mission == "win") {
				screen = new WinScreen();
			}
			
			screen.width = 800;
			screen.height = 600;
			addChild(screen);

			
			Game.paused = true;
		}
		
	}

}