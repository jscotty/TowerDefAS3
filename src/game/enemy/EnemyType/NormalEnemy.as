package game.enemy.EnemyType 
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
			speed = 2;
			mass = 3;
		}
		
	}

}