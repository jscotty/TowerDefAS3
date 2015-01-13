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
		private var enemy:Enemy2;
		
		public function NormalEnemy() 
		{
			enemy = new Enemy2();
			addChild(enemy);
			enemy.width = 64;
			enemy.height = 33;
			
			health = 100;
			speed = 5;
			mass = 3;
		}
		
	}

}