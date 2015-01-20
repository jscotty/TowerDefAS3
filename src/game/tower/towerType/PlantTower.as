package game.tower.towerType 
{
	import flash.events.Event;
	import game.tower.Tower;
	
	/**
	 * ...
	 * @author justin Bieshaar
	 */
	public class PlantTower extends Tower 
	{
		private var tower:Tower3;
		private var towerAtt:Tower3Att;
		
		public function PlantTower() 
		{
			tower = new Tower3();
			addChild(tower);
			tower.play();
			tower.visible = true;
			
			towerAtt = new Tower3Att();
			addChild(towerAtt);
			towerAtt.stop();
			towerAtt.visible = false;
			
			tower.width = 64;
			tower.height = 64;
			
			towerAtt.width = 64;
			towerAtt.height = 64;
			
			coolDown = 50;
			damage = 0.05;
			bullet = "heavy";
			collision = 90;
			
			addEventListener(Event.ENTER_FRAME, update);
		}
		
		private function update(e:Event):void 
		{
			if (anim == 0) {
				tower.visible = true;
				towerAtt.visible = false;
			} else if (anim == 1) {
				tower.visible = false;
				towerAtt.visible = true;
				
				towerAtt.play();
			}
			if (towerAtt.currentFrame == towerAtt.totalFrames) {
					anim = 0;
					towerAtt.gotoAndStop(0);
				}
		}
		
	}

}