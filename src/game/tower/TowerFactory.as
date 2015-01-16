package game.tower 
{
	import game.tower.towerType.NormalTower;
	import game.tower.towerType.AnusTower;
	/**
	 * ...
	 * @author justin Bieshaar
	 */
	public class TowerFactory 
	{
		public static const NORMAL_TOWER:String = "normalTower";
		public static const ANUS_TOWER:String = "anusTower";
		public function createTower(towerType:String) : Tower
		{
			var tower:Tower;
			
			if (towerType == NORMAL_TOWER) {
				tower = new NormalTower();
			} else if (towerType == ANUS_TOWER) {
				tower = new AnusTower();
			} else {
				tower = new Tower();
			}
			
			return tower;
		}
		
	}

}