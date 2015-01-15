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
			
			coolDown = 20;
			damage = 0.02;
			bullet = "weak";
			
			addEventListener(Event.ENTER_FRAME, animation);
		}
		
		private function animation(e:Event):void 
		{
			if (anim == 1) {
				tower.play();
			}else if (anim == 0) {
				if (tower.currentFrame == 20) {
					tower.gotoAndStop(1);
				}
			}
		}
		
	}

}