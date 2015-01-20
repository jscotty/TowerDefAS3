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
	import menu.EndScreen;
	import menu.HowToPlayMenu;
	import menu.PauseMenu;
	import utils.Vector2D;
	import flash.events.Event;
	import flash.geom.Rectangle;
	import flash.ui.Mouse;
	import flash.filters.BitmapFilterQuality;
	import game.grid.Grid;
	
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
		public static var paused:Boolean = true;
		private var closeMenu:String = "closeMenu";
		private var buildTurret:String = "buildTurret";
		private var death:String = "enemyDeath";
		private var deathPoint:String = "enemyDeathPoint";
		
		private var weak:String = "weak";
		private var normal:String = "normal";
		private var strong:String = "strong";
		private var heavy:String = "heavy";
		
		private var heart:Heart;
		private var scope:Microscope;
		
		public static var indexX:Number = 0;
		public static var indexY:Number = 0;
		
		private var shop:Shop;
		private var blur:BlurFilter;
		
		public static var difX:Number = 0;
		public static var difY:Number = 0;
		
		private var soundSystem:SoundSystem;
		private var waveSystem:WaveSystem;
		private var particleSystem:ParticleSystem;
		private var preLoader:PreLoader;
		private var doneLoading:String = "LoadDone";
		
		private var wavecount:int = 0;
		private var uid:UID;
		private var howToPlay:HowToPlayMenu;
		private var endscreen:EndScreen;
		
		public function Game(s:Stage, waves:int) 
		{
			soundSystem = Main.soundSystem;
			soundSystem.playMusic(1, 1.6, true);
			
			waveSystem = new WaveSystem();
			addChild(waveSystem);
			waveSystem.addEventListener(waveSystem.startWave, startWave);
			
			bg = new BG();
			bg.x = 0 + 300;
			bg.y = 0;
			bg.scaleX = 1.4;
			bg.visible = false;
			addChildAt(bg, 0);
			
			tileGrid = new TileGrid();
			addChildAt(tileGrid, 1);
			tileGrid.visible = false;
			tileGrid.createGrid(64, 64, tileGrid.gameGrid);
			
			heart = new Heart();
			heart.x = 2690;
			addChildAt(heart, 2);
			
			towerFactory = new TowerFactory;
			
			scope = new Microscope();
			addChild(scope);
			
			pauseButton = new PauseButton();
			addChild(pauseButton);
			pauseButton.scaleX = 0.5;
			pauseButton.scaleY = 0.5;
			pauseButton.visible = false;
			
			pauseButton.addEventListener(MouseEvent.CLICK, openMenu);
			
			shop = new Shop(s);
			addChild(shop);
			shop.visible = false;
			shop.addEventListener(buildTurret, spawnTurret);
			
			cam = new Cam(0x000000, 1,s);
			addChildAt(cam, 1);
			
			preLoader = new PreLoader(s);
			addChild(preLoader);
			preLoader.addEventListener(doneLoading, loadingDone);
			
			uid = new UID();
			addChild(uid);
			uid.totalWaves = waves;
			uid.visible = false;
			uid.addEventListener("doneD", doneD);
			uid.addEventListener("doneW", doneW);
			
			s.addEventListener(Event.ENTER_FRAME, camera);
			
			howToPlay = new HowToPlayMenu();
			addChild(howToPlay);
			howToPlay.addEventListener(howToPlay.startGame, startGame);
			paused = true;
			
			addEventListener(Event.ENTER_FRAME, update);
			addEventListener(MouseEvent.CLICK, onClick);
		}
		
		private function startGame(e:Event):void 
		{
			paused = false;
			pauseButton.visible = true;
			shop.visible = true;
			uid.visible = true;
			bg.visible = true;
			tileGrid.visible = true;
			
			removeChild(howToPlay);
			howToPlay = null;
		}
		
		private function startWave(e:Event):void 
		{
			var enemycount:int = Math.floor(waveSystem.wave * 9 / 3);
			for (var i:int = 0; i < enemycount; i++ ) {
				wavecount++;
				enemyFactory = new EnemyFactory();
				//trace(wavecount);
				if (wavecount <= 6) {
					_enemy = enemyFactory.createEnemy(EnemyFactory.EASY_ENEMY);
					//trace("easyenemy");
				} else if (wavecount <= 11) {
					_enemy = enemyFactory.createEnemy(EnemyFactory.NORMAL_ENEMY);
				} else if (wavecount <= 19) {
					_enemy = enemyFactory.createEnemy(EnemyFactory.STRONG_ENEMY);
				} else if (wavecount <= 28) {
					_enemy = enemyFactory.createEnemy(EnemyFactory.EBOLA_ENEMY);
				} else if (wavecount <= 60) {
					_enemy = enemyFactory.createEnemy(EnemyFactory.HEAVY_ENEMY);
				}
				enemyArray.push(_enemy);
				addChildAt(_enemy,4);
				_enemy.x = (34 * 4 - 34) * i * -2 - 100;
				_enemy.y = 64 * 6 - 34;
				_enemy.enemyBehaviour();
				//trace(_enemy.x);
				
				_enemy.addEventListener(death, enemyDeath);
				_enemy.addEventListener(deathPoint, enemyDeathPoint);
			}
				if (wavecount == enemycount) wavecount = 0;
				else;
		}
		
		private function loadingDone(e:Event):void 
		{
			removeChild(preLoader);
			preLoader = null;
		}
		
		private function enemyDeathPoint(e:Event):void 
		{
			var l:int = enemyArray.length;
			for (var i:int = l - 1; i > 0; i--) {
				if (enemyArray[i].died >= 5) {
						UID.points += enemyArray[i].points;
					removeChild(enemyArray[i]);
					enemyArray.splice(i, 1);
				}
			}
		}
		
		private function enemyDeath(e:Event):void 
		{
			var l:int = enemyArray.length;
			for (var i:int = l - 1; i > 0; i--) {
				if (enemyArray[i].died >= 5) {
						uid.lifeFrame += enemyArray[i].score;
					removeChild(enemyArray[i]);
					enemyArray.splice(i, 1);
				}
			}
			
		}
		
		private function spawnTurret(e:Event):void 
		{
			if (shop.towerType == "weak") {
				tower = towerFactory.createTower(TowerFactory.NORMAL_TOWER);
				UID.points -= shop.towerCost;
			}
			else if (shop.towerType == "normal") {
				tower = towerFactory.createTower(TowerFactory.ANUS_TOWER);
				UID.points -= shop.towerCost;
			}
			else if (shop.towerType == "heavy") {
				tower = towerFactory.createTower(TowerFactory.PLANT_TOWER);
				UID.points -= shop.towerCost;
			}
			towerArray.push(tower);
			addChildAt(tower, 3);
			tower.x = indexX * 64 + 34;
			tower.y = indexY * 64 + 34;
			
			tower.addEventListener("enemyHitted", enemyHit);
			tower.addEventListener("enemyDeath", enemyDeathPoint);
			
			tower.towerBehaviour(tower.x / 64, tower.y / 64);
		}
		
		private function enemyHit(e:Event,enemyNum:int):void 
		{
			
		}
		
		private function openMenu(e:MouseEvent):void 
		{
				Main.soundSystem.playMusic(0, 1, false);
				
			pauseMenu = new PauseMenu();
			pauseMenu.x = cam.x;
			pauseMenu.y = cam.y;
			addChild(pauseMenu);
			pauseMenu.addEventListener(closeMenu, exitMenu);
			paused = true;
			
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
			
			uid.x = cam.x;
			uid.y = cam.y;
			
			uid.time = waveSystem.time;
			
			indexX = Math.floor(mouseX / 64);
			indexY = Math.floor(mouseY / 64);
			
			uid.wave = waveSystem.wave;
			
			/*var difbla:int = -70;
			if (difbla < 0) {
				//trace("bruh");
			}*/
			
			/*for (var i:int = 0; i < enemyArray.length; i++ ) {
				trace(enemyArray[i].x);
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
						tileGrid.changeTileMultie(indexY, indexX, true);
					} else if (grid[indexY][indexX + 1] > 0 && grid[indexY][indexX - 1] <= 0) {
						grid[indexY][indexX] = 27;
						tileGrid.changeTileCorner(270, indexY, indexX, true);
					} else if (grid[indexY][indexX - 1] > 0 && grid[indexY][indexX + 1] <= 0) {
						grid[indexY][indexX] = 28;
						tileGrid.changeTileCorner(180, indexY, indexX, true);
					}  else {
					}
				} else if (grid[indexY][indexX] == 19) {
					if (grid[indexY][indexX - 1] > 0 && grid[indexY][indexX + 1] > 0) {
						grid[indexY][indexX] = 29;
						tileGrid.changeTileMultie(indexY, indexX, true);
					} else if (grid[indexY][indexX + 1] > 0 && grid[indexY][indexX - 1] <= 0) {
						grid[indexY][indexX] = 27;
						tileGrid.changeTileCorner(270, indexY, indexX, true);
					} else if (grid[indexY][indexX - 1] > 0 && grid[indexY][indexX + 1] <= 0) {
						grid[indexY][indexX] = 28;
						tileGrid.changeTileCorner(180, indexY, indexX, true);
					}  else {
					}
				} else if (grid[indexY][indexX] == 20) {
					if (grid[indexY - 1][indexX] > 0 && grid[indexY + 1][indexX] > 0) {
						grid[indexY][indexX] = 25;
						tileGrid.changeTileMultie(indexY, indexX, true);
					} else if (grid[indexY + 1][indexX] > 0 && grid[indexY - 1][indexX] <= 0) {
						grid[indexY][indexX] = 26;
						tileGrid.changeTileCorner(90, indexY, indexX, true);
					} else if (grid[indexY - 1][indexX] > 0 && grid[indexY + 1][indexX] <= 0) {
						grid[indexY][indexX] = 28;
						tileGrid.changeTileCorner(180, indexY, indexX, true);
					}  else {
					}
				} else if (grid[indexY][indexX] == 21) {
					if (grid[indexY - 1][indexX] > 0 && grid[indexY + 1][indexX] > 0) {
						grid[indexY][indexX] = 19;
						tileGrid.changeTile(90, indexY, indexX, true);
					} else if (grid[indexY][indexX - 1] > 0 && grid[indexY][indexX + 1] > 0) {
						grid[indexY][indexX] = 20;
						tileGrid.changeTile(0, indexY, indexX, true);
					} else {
					}
				} else if (grid[indexY][indexX] == 26 || grid[indexY][indexX] == 27 || grid[indexY][indexX] == 28 || grid[indexY][indexX] == 29) {
					if (grid[indexY - 1][indexX] > 0 && grid[indexY + 1][indexX] > 0 && grid[indexY][indexX + 1] > 0) {
						grid[indexY][indexX] = 19;
						tileGrid.changeTile(90, indexY, indexX, true);
					} else if (grid[indexY - 1][indexX] > 0 && grid[indexY + 1][indexX] > 0 && grid[indexY][indexX - 1] > 0) {
						grid[indexY][indexX] = 18;
						tileGrid.changeTile(270, indexY, indexX, true);
					} else if (grid[indexY][indexX - 1] > 0 && grid[indexY][indexX + 1] > 0 && grid[indexY - 1][indexX] > 0) {
						grid[indexY][indexX] = 21;
						tileGrid.changeTile(0, indexY, indexX, true);
					} else if (grid[indexY][indexX - 1] > 0 && grid[indexY][indexX + 1] > 0 && grid[indexY + 1][indexX] > 0) {
						grid[indexY][indexX] = 20;
						tileGrid.changeTile(180, indexY, indexX, true);
					} else {
					}
				} else {
				
				}
		}
		}
		private function doneD(e:Event):void 
		{
			endscreen = new EndScreen();
			addChild(endscreen);
			endscreen.x = cam.x;
			endscreen.y = cam.y;
				endscreen.startEndScreen("lose");
		}
		private function doneW(e:Event):void 
		{
			endscreen = new EndScreen();
			addChild(endscreen);
			endscreen.x = cam.x;
			endscreen.y = cam.y;
				endscreen.startEndScreen("win");
		}
		
		private function camera(e:Event):void 
		{
			if(!paused)root.scrollRect = new Rectangle(cam.x, cam.y, 800, 600);
		}
	}

}