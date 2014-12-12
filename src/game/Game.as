package game 
{
	import game.Cam;
	import flash.display.Sprite;
	import flash.display.Stage;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import game.enemy.Enemy;
	import game.enemy.EnemyFactory;
	import utils.Vector2D;
	import flash.events.Event;
	import flash.geom.Rectangle;
	import flash.ui.Mouse;
	
	/**
	 * ...
	 * @author justin Bieshaar
	 */
	public class Game extends Sprite 
	{
		private var enemyFactory:EnemyFactory;
		private var _enemy:Enemy;
		
		private var tileGrid:TileGrid;
		private var char:Cam;
		private var bg:BG;
		
		private var scope:Microscope;
		
		private var indexX:Number;
		private var indexY:Number;
		
		public function Game(s:Stage) 
		{
			bg = new BG();
			bg.x = -0;
			bg.y = 110;
			bg.scaleX = 0.78;
			bg.scaleY = 0.78;
			addChild(bg);
			
			tileGrid = new TileGrid();
			addChild(tileGrid);
			tileGrid.createGrid(64, 64);
			
			char = new Cam(0x000000, 1,s);
			addChild(char);
			
			enemyFactory = new EnemyFactory();
			_enemy = enemyFactory.createEnemy(EnemyFactory.NORMAL_ENEMY);
			addChildAt(_enemy,2);
			_enemy.x = 64 * 2 - 34;
			_enemy.y = 64 * 6 - 34;
			_enemy.enemyBehaviour();
			
			s.addEventListener(Event.ENTER_FRAME, camera);
			
			addEventListener(Event.ENTER_FRAME, update);
			addEventListener(MouseEvent.CLICK, onClick);
			
			scope = new Microscope();
			addChildAt(scope,3);
		}
		
		private function update(e:Event):void
		{
			scope.x = char.x;
			scope.y = char.y;
			
			indexX = Math.floor(mouseX / 64);
			indexY = Math.floor(mouseY / 64);
		}
		
		private function onClick(e:MouseEvent):void 
		{
			var grid:Array = TileGrid.tileGrid;
			var gridTex:Array = TileGrid.tileTexture;
			
			if (grid[indexY][indexX] == 19) {
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
			}
		}
		
		private function camera(e:Event):void 
		{
			root.scrollRect = new Rectangle(char.x, char.y, 800, 600);
		}
	}

}