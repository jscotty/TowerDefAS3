package game 
{
	import flash.display.Sprite;
	import flash.display.Stage;
	import flash.events.Event;
	import flash.events.MouseEvent;
	/**
	 * ...
	 * @author justin Bieshaar
	 */
	public class Shop extends Sprite
	{
		private var btn;
		public static var btnArray:Array = [];
		
		private var tower:Tower1;
		private var counter:int;
		
		private var towerBuild:Boolean = false;
		private var towerBuildArray:Array = [];
		
		public function Shop(s:Stage) 
		{
			for (var i:int = 0; i < 5; i++) {
				counter ++;
				if (counter == 1) btn = new Tower1;
				else btn = new TowerBtn;
					btnArray.push(btn);
					addChild(btn);
					
					btn.x = 210 + i * 100;
					btn.y = 550;
				
			}
			towerBuildArray = new Array;
			for (var b:int = 0; b < 5; b++) {
					towerBuildArray.push(towerBuild);
					towerBuildArray[b] = false;
			}
			s.addEventListener(MouseEvent.CLICK, onClick);
		}
		
		private function onClick(e:MouseEvent):void 
		{
			for (var i:int = 0; i < btnArray.length; i++) {
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