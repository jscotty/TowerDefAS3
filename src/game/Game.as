package game 
{
	import flash.filters.BlurFilter;
	import game.Cam;
	import flash.display.Sprite;
	import flash.display.Stage;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import game.enemy.Enemy;
	import game.enemy.EnemyFactory;
	import menu.PauseMenu;
	import utils.Vector2D;
	import flash.events.Event;
	import flash.geom.Rectangle;
	import flash.ui.Mouse;
	import flash.filters.BitmapFilterQuality;
	
	/**
	 * ...
	 * @author justin Bieshaar
	 */
	public class Game extends Sprite 
	{
		private var enemyFactory:EnemyFactory;
		private var _enemy:Enemy;
		
		private var tileGrid:TileGrid;
		private var cam:Cam;
		private var bg:BG;
		
		public static var pauseButton:PauseButton;
		private var pauseMenu:PauseMenu;
		public static var pause:Boolean = false;
		private var closeMenu:String = "closeMenu";
		
		private var heart:Heart;
		private var scope:Microscope;
		
		private var indexX:Number;
		private var indexY:Number;
		
		private var shop:Shop;
		private var blur:BlurFilter;
		
		
		public function Game(s:Stage) 
		{
			bg = new BG();
			bg.x = 0;
			bg.y = 0;
			addChild(bg);
			
			tileGrid = new TileGrid();
			addChild(tileGrid);
			tileGrid.createGrid(64, 64);
			
			enemyFactory = new EnemyFactory();
			_enemy = enemyFactory.createEnemy(EnemyFactory.NORMAL_ENEMY);
			addChildAt(_enemy,2);
			_enemy.x = 64 * 2 - 34;
			_enemy.y = 64 * 6 - 34;
			_enemy.enemyBehaviour();
			
			s.addEventListener(Event.ENTER_FRAME, camera);
			
			addEventListener(Event.ENTER_FRAME, update);
			addEventListener(MouseEvent.CLICK, onClick);
			
			heart = new Heart();
			heart.x = 2203;
			addChildAt(heart, 2);
			
			
			scope = new Microscope();
			addChild(scope);
			
			pauseButton = new PauseButton();
			addChild(pauseButton);
			pauseButton.visible = true;
			
			pauseButton.addEventListener(MouseEvent.CLICK, openMenu);
			
			shop = new Shop(s);
			addChild(shop);
			
			cam = new Cam(0x000000, 1,s);
			addChildAt(cam, 3);
			
		}
		
		private function openMenu(e:MouseEvent):void 
		{
			pauseMenu = new PauseMenu();
			pauseMenu.x = cam.x;
			pauseMenu.y = cam.y;
			addChild(pauseMenu);
			pauseMenu.addEventListener(closeMenu, exitMenu);
			pause = true
			
			pauseButton.visible = false;
		}
		
		private function exitMenu(e:Event):void 
		{
			removeChild(pauseMenu);
			pauseMenu = null;
			pause = false;
			pauseButton.visible = true;
		}
		
		private function update(e:Event):void
		{
			
			scope.x = cam.x;
			scope.y = cam.y;
			
			pauseButton.x = cam.x + 750;
			pauseButton.y = cam.y + 30;
			
			shop.x = cam.x;
			shop.y = cam.y;
			
			indexX = Math.floor(mouseX / 64);
			indexY = Math.floor(mouseY / 64);
			
		}
		
		private function onClick(e:MouseEvent):void 
		{
			var grid:Array = TileGrid.tileGrid;
			var gridTex:Array = TileGrid.tileTexture;
			
			 if (grid[indexY][indexX]) {
				 
			}else if (grid[indexY][indexX] == 19) {
				grid[indexY][indexX] = 20;
				tileGrid.changeTile(0, indexY, indexX);
			} else if (grid[indexY][indexX] == 20) {
				grid[indexY][indexX] = 19;
				tileGrid.changeTile(90, indexY, indexX);
			} else if (grid[indexY][indexX] == 22) {
				grid[indexY][indexX] = 22;
				tileGrid.changeTile(90, indexY, indexX);
			} else if (grid[indexY][indexX] == 23) {
				grid[indexY][indexX] = 24;
				tileGrid.changeTile(90, indexY, indexX);
			} else if (grid[indexY][indexX] == 24) {
				grid[indexY][indexX] = 19;
				tileGrid.changeTile(90, indexY, indexX);
			}else {
				
			}
		}
		
		private function camera(e:Event):void 
		{
			root.scrollRect = new Rectangle(cam.x, cam.y, 800, 600);
		}
	}

}