package 
{
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.ui.Mouse;
	import game.Game;
	import game.levelCreator.LevelCreator;
	import game.MouseC;
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
		private var _creator:LevelCreator;
		
		private var cursor:MouseC;
		
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
			
			Mouse.hide();
			cursor = new MouseC();
			addChild(cursor);
			cursor.mouseEnabled = false;
			
			_mainMenu.addEventListener(_startGame, startGame);
			
			addEventListener(Event.ENTER_FRAME, mouseCurs);
		}
		
		private function mouseCurs(e:Event):void 
		{
			cursor.x = mouseX;
			cursor.y = mouseY;
		}
		
		private function startGame(e:Event):void 
		{
			removeChild(_mainMenu);
			_mainMenu = null;
			
			_game = new Game(stage);
			addChildAt(_game, 0);
			
			/*_creator = new LevelCreator(stage);
			addChildAt(_creator, 0);*/
		}
		
	}
	
}