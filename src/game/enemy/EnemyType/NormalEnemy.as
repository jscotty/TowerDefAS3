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
		private var enemy:NEnemyPH;
		
		public function NormalEnemy() 
		{
			enemy = new NEnemyPH();
			addChild(enemy);
			
			health = 100;
			speed = 2;
			mass = 3;
		}
		
	}

}