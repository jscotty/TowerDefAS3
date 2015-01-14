package game 
{
	import com.blueflamedev.effects.ParticleSeed;
	import com.blueflamedev.events.ParticleEvent;
	import com.blueflamedev.math.Vector3D;
	import flash.display.Sprite;
	import flash.geom.Rectangle;
	import utils.Vector2D;
	import bullets.NormalBulletType;
	
	/**
	 * ...
	 * @author justin Bieshaar
	 */
	public class ParticleSystem extends Sprite
	{
		private var particleSeed:ParticleSeed;
		
		private var holder:Sprite;
		
		private var weakBullet:BulletWeak;
		private var normalBullet:BulletNormal;
		private var strongBullet:BulletStrong;
		private var heavyBullet:BulletHeavy;
		
		private var weak:String = "weak";
		private var normal:String = "normal";
		private var strong:String = "strong";
		private var heavy:String = "heavy";
		
		private var enemyNum:int;
		
		private var enemy:Array = Game.enemyArray;
		
		public function startParticle(textureType:String, enemyNum:int):void
		{
			this.enemyNum = enemyNum;
			
			holder = new Sprite();
			addChild(holder);
			holder.x = 800;
			holder.y = 600;
			
			weakBullet = new BulletWeak();
			trace(weakBullet);
			normalBullet = new BulletNormal();
			strongBullet = new BulletStrong();
			heavyBullet = new BulletHeavy();
			
			if (textureType == weak) {
				createParticle(weak);
			} else if (textureType == normal) {
				createParticle(normal);
			} else if (textureType == strong) {
				createParticle(strong);
			} else if (textureType == heavy) {
				createParticle(heavy);
			}
		}
		
		private function createParticle(type:String):void 
		{
			var randomnum:int = Math.random() * 4 - 4;
			
			particleSeed = new ParticleSeed(holder);
			if(type == weak) particleSeed.particle = BulletWeak;
			else if(type == normal) particleSeed.particle = BulletNormal;
			else if(type == strong) particleSeed.particle = BulletStrong;
			else if(type == heavy) particleSeed.particle = BulletHeavy;
			particleSeed.bounds = new Rectangle(enemy[enemyNum].x - 815, enemy[enemyNum].y - 610 - randomnum, enemy[enemyNum].width, enemy[enemyNum].height);
			particleSeed.force = new Vector3D(0, -.1, 0);
			particleSeed.setMagnitude(0, 0);
			particleSeed.releaseInterval = 950;
			particleSeed.duration = 155;
			particleSeed.start();
			holder.addChildAt(particleSeed, 1);
		}
		
		
	}

}