package com.blueflamedev.effects.particles
{
	import flash.display.Sprite;
	import flash.filters.DropShadowFilter;

	public class WhiteParticle extends Sprite
	{
		public function WhiteParticle()
		{
			draw();
		}
		
		private function draw():void
		{
			graphics.clear();
			graphics.beginFill(0xFFFFFF, 1);
			graphics.drawCircle(-2, -2, 2);
			graphics.endFill();
		}
	}
}