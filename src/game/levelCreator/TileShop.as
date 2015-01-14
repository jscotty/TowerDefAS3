package game.levelCreator 
{
	import flash.display.Sprite;
	import flash.display.Stage;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import game.TileGrid;
	import game.grid.CreatedGrid;
	/**
	 * ...
	 * @author justin Bieshaar
	 */
	public class TileShop extends Sprite
	{
		
		private var btn;
		
		public static var btnArray:Array = [];
		
		private var counter:int;
		
		private var towerBuild:Boolean = false;
		private var towerBuildArray:Array = [];
		
		public var iX:Number = 0;
		public var iY:Number = 0;
		
		private var grid:Array;
		private var btnNum:int;
		
		public function TileShop(s:Stage) 
		{
			grid = TileGrid.tileGrid;
			
			towerBuildArray = new Array;
			for (var i:int = 0; i < 10; i++) {
				counter ++;
				if (counter == 1) btn = new CreatorBtn1;
				else if (counter == 2) btn = new CreatorBtn2;
				else if (counter == 3) btn = new CreatorBtn3;
				else if (counter == 4) btn = new CreatorBtn4;
				else if (counter == 5) btn = new CreatorBtn5;
				else if (counter == 6) btn = new CreatorBtn6;
				else if (counter == 7) btn = new CreatorBtn7;
				else if (counter == 8) btn = new CreatorBtn8;
				else if (counter == 9) btn = new CreatorBtn9;
				else if (counter == 10) btn = new CreatorBtn10;
				else btn = new TowerBtn;
					btnArray.push(btn);
					addChild(btn);
					
					btn.width = 60;
					btn.height = 60;
					btn.x = 50 + i * 80;
					btn.y = 560;
					
					towerBuildArray.push(towerBuild);
					towerBuildArray[i] = false;
			}
			
			addEventListener(Event.ENTER_FRAME, update);
			s.addEventListener(MouseEvent.CLICK, onClick);
		}
		
		private function update(e:Event):void 
		{
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
			
			if (isNaN(iX)) {
				
			} else if(iX >= 0 && iY >= 0){
				//trace(grid[iY][iX]);
			}
			
			for (var i:int = 0; i < towerBuildArray.length; i++) {
				towerBuildArray[i] = false;
				if (e.target == btnArray[i]) {
					if (towerBuildArray[i]) {
					} else {
						towerBuildArray[i] = true;
						
						if (i == 0 || i == 1 || i == 2) {
							btnNum = i + 1;
						} else if (i == 3) {
							btnNum = 20;
						} else if (i == 4) {
							btnNum = -1;
						} else if (i == 5) {
							btnNum = -2;
						} else if (i == 6) {
							btnNum = -3;
						} else if (i == 7) {
							btnNum = -11;
						} else if (i == 8) {
							btnNum = -12;
						} else if (i == 9) {
							btnNum = -13;
						}
						trace(btnNum);
					}
				}else {
				}
			}
			
		}
		
	}

}