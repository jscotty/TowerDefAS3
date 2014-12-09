package game.tower 
{
	import game.tower.towerType.NormalTower;
	/**
	 * ...
	 * @author justin Bieshaar
	 */
	public class TowerFactory 
	{
		public static const NORMAL_TOWER:String = "normalTower";
		public function createTower(towerType:String) : Tower
		{
			var tower:Tower;
			
			if (towerType == NORMAL_TOWER) {
				tower = new NormalTower();
			} else {
				tower = new Tower();
			}
			
			return tower;
		}
		
	}

}