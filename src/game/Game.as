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
	import game.tower.Tower;
	import game.tower.TowerFactory;
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
		public static var enemyArray:Array = [];
		
		private var towerFactory:TowerFactory;
		public var tower:Tower;
		private var towerArray:Array = [];
		
		private var tileGrid:TileGrid;
		private var cam:Cam;
		private var bg:BG;
		
		public static var pauseButton:PauseButton;
		private var pauseMenu:PauseMenu;
		public static var paused:Boolean = false;
		private var closeMenu:String = "closeMenu";
		private var buildTurret:String = "buildTurret";
		private var death:String = "enemyDeath";
		private var backgroundSfx:String = "looptrack.mp3";
		private var shootSfx:String = "shoot.mp3";
		
		private var heart:Heart;
		private var scope:Microscope;
		
		public static var indexX:Number = 0;
		public static var indexY:Number = 0;
		
		private var shop:Shop;
		private var blur:BlurFilter;
		
		public static var difX:Number = 0;
		public static var difY:Number = 0;
		
		private var soundSystem:SoundSystem;
		
		public function Game(s:Stage) 
		{
			soundSystem = new SoundSystem();
			soundSystem.addMusic(backgroundSfx);
			soundSystem.addMusic(shootSfx);
			//soundSystem.playMusic(0, 1, true);
			//soundSystem.playMusic(1, 1, true);
			
			bg = new BG();
			bg.x = 0;
			bg.y = 0;
			addChild(bg);
			
			tileGrid = new TileGrid();
			addChild(tileGrid);
			tileGrid.createGrid(64, 64);
			
				spawnEnemy();
			
			
			s.addEventListener(Event.ENTER_FRAME, camera);
			
			addEventListener(Event.ENTER_FRAME, update);
			addEventListener(MouseEvent.CLICK, onClick);
			
			heart = new Heart();
			heart.x = 2203;
			addChildAt(heart, 2);
			
			towerFactory = new TowerFactory;
			
			scope = new Microscope();
			addChild(scope);
			
			pauseButton = new PauseButton();
			addChild(pauseButton);
			pauseButton.visible = true;
			
			pauseButton.addEventListener(MouseEvent.CLICK, openMenu);
			
			shop = new Shop(s);
			addChild(shop);
			shop.addEventListener(buildTurret, spawnTurret);
			
			cam = new Cam(0x000000, 1,s);
			addChildAt(cam, 3);
			
		}
		
		private function spawnEnemy():void 
		{
			for (var i:int = 0; i < 2; i++ ) {
				enemyFactory = new EnemyFactory();
				_enemy = enemyFactory.createEnemy(EnemyFactory.NORMAL_ENEMY);
				enemyArray.push(_enemy);
				addChildAt(_enemy,2);
				_enemy.x = (34 * 6 - 34) * i + 100;
				_enemy.y = 64 * 6 - 34;
				_enemy.enemyBehaviour();
				
				_enemy.addEventListener(death, enemyDeath);
			}
		}
		
		private function enemyDeath(e:Event):void 
		{
			var l:int = enemyArray.length - 1;
			for (var i:int = l; i > 0; i--) {
				if (enemyArray[i].died == true) {
					removeChild(enemyArray[i]);
					enemyArray.splice(i, 1);
				}
			}
		}
		
		private function spawnTurret(e:Event):void 
		{
			tower = towerFactory.createTower(TowerFactory.NORMAL_TOWER);
			towerArray.push(tower);
			addChildAt(tower, 2);
			tower.x = indexX * 64 + 34;
			tower.y = indexY * 64 + 34;
			
			tower.towerBehaviour(tower.x / 64, tower.y / 64);
		}
		
		private function openMenu(e:MouseEvent):void 
		{
			pauseMenu = new PauseMenu();
			pauseMenu.x = cam.x;
			pauseMenu.y = cam.y;
			addChild(pauseMenu);
			pauseMenu.addEventListener(closeMenu, exitMenu);
			paused = true
			
			pauseButton.visible = false;
		}
		
		private function exitMenu(e:Event):void 
		{
			removeChild(pauseMenu);
			pauseMenu = null;
			paused = false;
			pauseButton.visible = true;
		}
		
		private function update(e:Event):void
		{
			if(!paused){
			scope.x = cam.x;
			scope.y = cam.y;
			
			pauseButton.x = cam.x + 750;
			pauseButton.y = cam.y + 30;
			
			shop.x = cam.x;
			shop.y = cam.y;
			
			indexX = Math.floor(mouseX / 64);
			indexY = Math.floor(mouseY / 64);
			
			/*var difbla:int = -70;
			if (difbla < 0) {
				//trace("bruh");
			}*/
			}else {
				
			}
			
		}
		
		private function onClick(e:MouseEvent):void 
		{
			if(!paused){
				var grid:Array = TileGrid.tileGrid;
				var gridTex:Array = TileGrid.tileTexture;
				
				/*
				 * tile 19 = - recht
				 * 
				 * tile 20 = | omhoog/omlaag
				 * 
				 * tile 21 = -| links omlaag / 90
				 * 
				 * tile 22 = _| links omhoog / 180
				 * 
				 * tile 23 = |_ omhoog rechts / 270
				 * 
				 * tile 24 = |- omlaag rechts / 0
				 */
				if (grid[indexY][indexX] == 18) {
					if (grid[indexY][indexX - 1] > 0 && grid[indexY][indexX + 1] > 0) {
						grid[indexY][indexX] = 29;
						tileGrid.changeTileMultie(indexY, indexX);
					} else if (grid[indexY][indexX + 1] > 0 && grid[indexY][indexX - 1] <= 0) {
						grid[indexY][indexX] = 27;
						tileGrid.changeTileCorner(270, indexY, indexX);
					} else if (grid[indexY][indexX - 1] > 0 && grid[indexY][indexX + 1] <= 0) {
						grid[indexY][indexX] = 28;
						tileGrid.changeTileCorner(180, indexY, indexX);
					}  else {
					}
				} else if (grid[indexY][indexX] == 19) {
					if (grid[indexY][indexX - 1] > 0 && grid[indexY][indexX + 1] > 0) {
						grid[indexY][indexX] = 29;
						tileGrid.changeTileMultie(indexY, indexX);
					} else if (grid[indexY][indexX + 1] > 0 && grid[indexY][indexX - 1] <= 0) {
						grid[indexY][indexX] = 27;
						tileGrid.changeTileCorner(270, indexY, indexX);
					} else if (grid[indexY][indexX - 1] > 0 && grid[indexY][indexX + 1] <= 0) {
						grid[indexY][indexX] = 28;
						tileGrid.changeTileCorner(180, indexY, indexX);
					}  else {
					}
				} else if (grid[indexY][indexX] == 20) {
					if (grid[indexY - 1][indexX] > 0 && grid[indexY + 1][indexX] > 0) {
						grid[indexY][indexX] = 25;
						tileGrid.changeTileMultie(indexY, indexX);
					} else if (grid[indexY + 1][indexX] > 0 && grid[indexY - 1][indexX] <= 0) {
						grid[indexY][indexX] = 26;
						tileGrid.changeTileCorner(90, indexY, indexX);
					} else if (grid[indexY - 1][indexX] > 0 && grid[indexY + 1][indexX] <= 0) {
						grid[indexY][indexX] = 28;
						tileGrid.changeTileCorner(180, indexY, indexX);
					}  else {
					}
				} else if (grid[indexY][indexX] == 21) {
					if (grid[indexY - 1][indexX] > 0 && grid[indexY + 1][indexX] > 0) {
						grid[indexY][indexX] = 19;
						tileGrid.changeTile(90, indexY, indexX);
					} else if (grid[indexY][indexX - 1] > 0 && grid[indexY][indexX + 1] > 0) {
						grid[indexY][indexX] = 20;
						tileGrid.changeTile(0, indexY, indexX);
					} else {
					}
				} else if (grid[indexY][indexX] == 26 || grid[indexY][indexX] == 27 || grid[indexY][indexX] == 28 || grid[indexY][indexX] == 29) {
					if (grid[indexY - 1][indexX] > 0 && grid[indexY + 1][indexX] > 0 && grid[indexY][indexX + 1] > 0) {
						grid[indexY][indexX] = 19;
						tileGrid.changeTile(90, indexY, indexX);
					} else if (grid[indexY - 1][indexX] > 0 && grid[indexY + 1][indexX] > 0 && grid[indexY][indexX - 1] > 0) {
						grid[indexY][indexX] = 18;
						tileGrid.changeTile(270, indexY, indexX);
					} else if (grid[indexY][indexX - 1] > 0 && grid[indexY][indexX + 1] > 0 && grid[indexY - 1][indexX] > 0) {
						grid[indexY][indexX] = 21;
						tileGrid.changeTile(0, indexY, indexX);
					} else if (grid[indexY][indexX - 1] > 0 && grid[indexY][indexX + 1] > 0 && grid[indexY + 1][indexX] > 0) {
						grid[indexY][indexX] = 20;
						tileGrid.changeTile(180, indexY, indexX);
					} else {
					}
				} else {
				
				}
		}
		}
		
		private function camera(e:Event):void 
		{
			if(!paused)root.scrollRect = new Rectangle(cam.x, cam.y, 800, 600);
		}
	}

}