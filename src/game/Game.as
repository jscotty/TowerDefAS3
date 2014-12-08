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
		private var enemy:Enemy;
		private var tileGrid:TileGrid;
		private var char:Cam;
		
		public function Game(s:Stage) 
		{
			tileGrid = new TileGrid();
			addChild(tileGrid);
			tileGrid.createGrid(36, 25, 64, 64	);
			
			char = new Cam(0x000000, 1,s);
			addChild(char);
			
			s.addEventListener(Event.ENTER_FRAME, camera);
			
			addEventListener(Event.ENTER_FRAME, update);
			
		}
		
		
		private function update(e:Event):void
		{
		}
		
		private function camera(e:Event):void 
		{
			root.scrollRect = new Rectangle(char.x, char.y, 800, 600);
		}
	}

}