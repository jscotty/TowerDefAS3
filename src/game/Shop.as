package game 
{
	import flash.display.Sprite;
	import flash.display.Stage;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import game.tower.Tower;
	import game.grid.Grid;
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
		
		private var towerFactory:TowerFactory;
		private var tower:Tower;
		
		public var iX:Number = 0;
		public var iY:Number = 0;
		private var buildTurret:String = "buildTurret";
		private var towerbool:Boolean = false;
		private var towerint:int;
		
		public function Shop(s:Stage) 
		{
			for (var i:int = 0; i < 5; i++) {
				counter ++;
				if (counter == 1) btn = new TowerBtn1;
				else btn = new TowerBtn;
					btnArray.push(btn);
					addChild(btn);
					
					btn.width = 60;
					btn.height = 60;
					btn.x = 250 + i * 80;
					btn.y = 560;
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
			
			if (towerbool) {
				tower.x = iX * 64;
				tower.y = iY * 64;
			}
		}
		
		private function onClick(e:MouseEvent):void 
		{
			
			var grid:Array = TileGrid.tileGrid;
			if (grid[iY][iX] <= -1) {
				if (towerBuildArray[0]) {
					grid[iY][iX] = 0;
					dispatchEvent(new Event(buildTurret));
				} else {
				}
				
			} else if (grid[iY][iX] >= -1) {
				//trace("mis");
				if (towerbool) removeChild(tower);
				towerbool = false;
				
			}
			for (var i:int = 0; i < towerBuildArray.length; i++) {
				towerBuildArray[i] = false;
				if (e.target == btnArray[i]) {
					if (towerBuildArray[i]) {
						towerBuildArray[i] = false;
						towerbool = false;
					} else {
						towerBuildArray[i] = true;
						if (i == 0) {
							towerFactory = new TowerFactory();
							tower = towerFactory.createTower(TowerFactory.NORMAL_TOWER);
						}
						addChild(tower);
						towerbool = true;
						towerint = 1;
						tower.alpha = 0.3;
					}
				}else {
				}
			}
			
		}
		
	}

}