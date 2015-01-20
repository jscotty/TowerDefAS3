package 
{
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.ui.Mouse;
	import game.Game;
	import game.levelCreator.LevelCreator;
	import game.MouseC;
	import game.SoundSystem;
	import menu.DifficultyMenu;
	import menu.MainMenu;
	
	/**
	 * ...
	 * @author justin Bieshaar
	 */
	public class Main extends Sprite 
	{
		private var _startGame:String = "startGame";
		private var start:String = "start";
		
		private var _mainMenu:MainMenu;
		private var _game:Game;
		private var _creator:LevelCreator;
		
		private var _difficulty:DifficultyMenu;
		
		private var cursor:MouseC;
		private var easy:String = "easy";
		private var medium:String = "medium";
		private var hard:String = "hard";
		
		private var waves:int;
		public static var indexX:Number;
		public static var indexY:Number;
		
		public static var soundSystem:SoundSystem;
		public static var soundOff:Boolean;
		
		private var clickSfx:String = "Click_Sound.mp3";
		private var backgroundSfx:String = "looptrack.mp3";
		
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
			
			soundSystem = new SoundSystem();
			soundSystem.addMusic(clickSfx);
			soundSystem.addMusic(backgroundSfx);
		}
		
		private function mouseCurs(e:Event):void 
		{
			cursor.x = mouseX;
			cursor.y = mouseY;
			
			indexX = cursor.x;
			indexY = cursor.y;
		}
		
		private function startGame(e:Event):void 
		{
			removeChild(_mainMenu);
			_mainMenu = null;
			
			_difficulty = new DifficultyMenu();
			addChildAt(_difficulty, 0);
			_difficulty.addEventListener(start, openGame);
		}
		
		private function openGame(e:Event):void 
		{
			if (_difficulty.difficulty == easy) {
				waves = 20;
			}if (_difficulty.difficulty == medium) {
				waves = 35;
			}if (_difficulty.difficulty == hard) {
				waves = 50;
			}
			
			removeChild(_difficulty);
			_difficulty = null;
			
			_game = new Game(stage, waves);
			addChildAt(_game, 0);
			
			/*_creator = new LevelCreator(stage);
			addChildAt(_creator, 0);*/
		}
		
	}
	
}