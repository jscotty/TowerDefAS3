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
		private var enemy:Enemy1;
		
		public function NormalEnemy() 
		{
			enemy = new Enemy1();
			addChild(enemy);
			enemy.width = 32;
			enemy.height = 32;
			
			health = 100;
			speed = 5;
			mass = 3;
		}
		
	}

}