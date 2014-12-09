package game.tower.towerType 
{
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
		}
		
	}

}