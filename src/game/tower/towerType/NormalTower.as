package game.tower.towerType 
{
	import flash.events.Event;
	import game.tower.Tower;
	/**
	 * ...
	 * @author justin Bieshaar
	 */
	public class NormalTower extends Tower
	{
		private var tower:Tower1;
		
		public function NormalTower() 
		{
			tower = new Tower1();
			addChild(tower);
			tower.stop();
			
			tower.width = 64;
			tower.height = 64;
			
			coolDown = 30;
			damage = 0.02;
			bullet = "weak";
			
			addEventListener(Event.ENTER_FRAME, animation);
		}
		
		private function animation(e:Event):void 
		{
			
		}
		
	}

}