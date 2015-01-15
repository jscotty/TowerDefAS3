package game.levelCreator 
{
	import flash.display.Sprite;
	import flash.display.Stage;
	import flash.events.Event;
	import flash.geom.Rectangle;
	import game.Cam;
	import game.TileGrid;
	/**
	 * ...
	 * @author justin Bieshaar
	 */
	public class LevelCreator extends Sprite
	{
		private var tilegrid:TileGrid;
		private var cam:Cam;
		private var indexX:Number;
		private var indexY:Number;
		private var shop:TileShop;
		
		private var test:int = 0;
		private var testt:int = 0;
		
		public function LevelCreator(s:Stage) 
		{
			tilegrid = new TileGrid();
			addChild(tilegrid);
			tilegrid.createGrid(64, 64, tilegrid.creatorGrid);
			
			cam = new Cam(0x000000, 1,s);
			addChild(cam);
			
			shop = new TileShop(s);
			addChild(shop);
			
			addEventListener(Event.ENTER_FRAME, update);
			s.addEventListener(Event.ENTER_FRAME, camera);
			
			
		}
		
		private function update(e:Event):void 
		{
			testt++;
			if (testt >= 12) {
				test++;
				testt = 0;
			}
			var enemycount:int = Math.floor(test * 10 / 3.2);
			trace(enemycount);
			shop.x = cam.x;
			shop.y = cam.y;
			
			shop.iX = indexX;
			shop.iY = indexY;
			
			indexX = Math.floor(mouseX / 64);
			indexY = Math.floor(mouseY / 64);
		}
		
		private function camera(e:Event):void 
		{
			root.scrollRect = new Rectangle(cam.x, cam.y, 800, 600);
		}
		
	}

}