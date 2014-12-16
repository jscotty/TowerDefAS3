package game 
{
	import flash.display.Sprite;
	/**
	 * ...
	 * @author justin Bieshaar
	 */
	public class Shop extends Sprite
	{
		private var btn:TowerBtn;
		public static var btnArray:Array = [];
		
		private var tower:Tower1;
		
		public function Shop() 
		{
			for (var i:int = 0; i < 5; i++) {
				btn = new TowerBtn;
				btnArray.push(btn);
				addChild(btn);
				
				btn.x = 210 + i * 100;
				btn.y = 550;
			}
			tower = new Tower1();
			addChild(tower);
			tower.x = btnArray[0].x;
			tower.y = btnArray[0].y;
		}
		
	}

}