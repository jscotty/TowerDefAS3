package game.enemy.enemyType 
{
	import assets.NEnemyPH;
	import game.enemy.Enemy;
	/**
	 * ...
	 * @author justin Bieshaar
	 */
	public class NormalEnemy extends Enemy
	{
		private var enemy:EnemyNormal;
		
		public function NormalEnemy() 
		{
			enemy = new EnemyNormal();
			addChild(enemy);
			enemy.width = 64;
			enemy.height = 64;
			
			health = 100;
			speed = 3;
			mass = 3;
		}
		
	}

}