package game.enemy 
{
	import game.enemy.enemyType.EbolaEnemy;
	import game.enemy.enemyType.HeavyEnemy;
	import game.enemy.enemyType.NormalEnemy;
	import game.enemy.enemyType.StrongEnemy;
	import game.enemy.enemyType.WeakEnemy;
	/**
	 * ...
	 * @author justin Bieshaar
	 */
	public class EnemyFactory 
	{
		public static const EASY_ENEMY:String = "easyEnemy";
		public static const NORMAL_ENEMY:String = "normalEnemy";
		public static const STRONG_ENEMY:String = "strongEnemy";
		public static const EBOLA_ENEMY:String = "ebolaEnemy";
		public static const HEAVY_ENEMY:String = "heavyEnemy";
		
		public function createEnemy(enemyType:String) : Enemy
		{
			var enemy:Enemy;
			
			if (enemyType == EASY_ENEMY) {
				enemy = new WeakEnemy();
			}else if (enemyType == NORMAL_ENEMY) {
				enemy = new NormalEnemy();
			}else if (enemyType == STRONG_ENEMY) {
				enemy = new StrongEnemy();
			}else if (enemyType == EBOLA_ENEMY) {
				enemy = new EbolaEnemy();
			}else if (enemyType == HEAVY_ENEMY) {
				enemy = new HeavyEnemy();
			}else {
				enemy = new Enemy();
			}
			
			return enemy;
		}
		
	}

}