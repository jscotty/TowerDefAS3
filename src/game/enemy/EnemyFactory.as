package game.enemy 
{
	import game.enemy.EnemyType.NormalEnemy;
	/**
	 * ...
	 * @author justin Bieshaar
	 */
	public class EnemyFactory 
	{
		public static const NORMAL_ENEMY:String = "normalEnemy";
		
		public function createEnemy(enemyType:String) : Enemy
		{
			var enemy:Enemy;
			
			if (enemyType == NORMAL_ENEMY) {
				enemy = new NormalEnemy();
			}else {
				enemy = new Enemy();
			}
			
			return enemy;
		}
		
	}

}