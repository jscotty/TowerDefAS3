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
			enemy.width = 32;
			enemy.height = 32;
			
			health = 100;
			speed = 3.1;
			scaleFactor = 0.001;
		}
		
	}

}