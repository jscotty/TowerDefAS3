package game.tower.towerType 
{
	import game.tower.Tower;
	
	/**
	 * ...
	 * @author justin Bieshaar
	 */
	public class AnusTower extends Tower 
	{
		private var tower:Anus;
		
		public function AnusTower() 
		{
			tower = new Anus();
			addChild(tower);
			tower.stop();
			
			tower.width = 64;
			tower.height = 64;
			
			coolDown = 50;
			damage = 0.05;
			bullet = "weak";
			collision = 120;
		}
		
	}

}