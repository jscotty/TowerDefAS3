package game 
{
	import flash.display.Sprite;
	import flash.display.Stage;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import game.tower.Tower;
	import game.tower.TowerFactory;
	/**
	 * ...
	 * @author justin Bieshaar
	 */
	public class Shop extends Sprite
	{
		private var btn;
		public static var btnArray:Array = [];
		
		private var counter:int;
		
		private var towerBuild:Boolean = false;
		private var towerBuildArray:Array = [];
		
		
		public var iX:Number = 0;
		public var iY:Number = 0;
		private var buildTurret:String = "buildTurret";
		
		public function Shop(s:Stage) 
		{
			for (var i:int = 0; i < 5; i++) {
				counter ++;
				if (counter == 1) btn = new TowerBtn1;
				else btn = new TowerBtn;
					btnArray.push(btn);
					addChild(btn);
					
					btn.width = 90;
					btn.height = 90;
					btn.x = 210 + i * 100;
					btn.y = 550;
			}
			towerBuildArray = new Array;
			for (var b:int = 0; b < 5; b++) {
					towerBuildArray.push(towerBuild);
					towerBuildArray[b] = false;
			}
			
			
			addEventListener(Event.ENTER_FRAME, update);
			s.addEventListener(MouseEvent.CLICK, onClick);
		}
		
		private function update(e:Event):void 
		{
			iX  = Game.indexX;
			iY  = Game.indexY;
			
			for (var i:int = 0; i < towerBuildArray.length; i++) {
				if (towerBuildArray[i]) {
					btnArray[i].alpha = 0.5;
				}else {
					btnArray[i].alpha = 1;
				}
			}
			
		}
		
		private function onClick(e:MouseEvent):void 
		{
			
			var grid:Array = TileGrid.tileGrid;
			if (grid[iY][iX] == -1) {
				if (towerBuildArray[0]) {
					grid[iY][iX] = 0;
					dispatchEvent(new Event(buildTurret));
					trace("place turret");
				} else {
					trace("je bent een fucking sukkel dat je dit probeert");
				}
				
			}
			for (var i:int = 0; i < towerBuildArray.length; i++) {
				towerBuildArray[i] = false;
				if (e.target == btnArray[i]) {
					if (towerBuildArray[i]) {
						towerBuildArray[i] = false;
					} else {
						towerBuildArray[i] = true;
					}
				}
			}
			
		}
		
	}

}