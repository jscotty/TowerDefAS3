package 
{
	import flash.display.Sprite;
	import flash.events.Event;
	import game.Game;
	import menu.MainMenu;
	
	/**
	 * ...
	 * @author justin Bieshaar
	 */
	public class Main extends Sprite 
	{
		private var _startGame:String = "startGame";
		
		private var _mainMenu:MainMenu;
		private var _game:Game;
		
		public function Main():void 
		{
			if (stage) init();
			else addEventListener(Event.ADDED_TO_STAGE, init);
		}
		
		private function init(e:Event = null):void 
		{
			removeEventListener(Event.ADDED_TO_STAGE, init);
			
			_mainMenu = new MainMenu();
			addChild(_mainMenu);
			
			_mainMenu.addEventListener(_startGame, startGame);
		}
		
		private function startGame(e:Event):void 
		{
			removeChild(_mainMenu);
			_mainMenu = null;
			
			_game = new Game(stage);
			addChild(_game);
		}
		
	}
	
}