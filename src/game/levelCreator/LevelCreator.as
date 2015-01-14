package game.levelCreator 
{
	import flash.display.Sprite;
	import game.TileGrid;
	/**
	 * ...
	 * @author justin Bieshaar
	 */
	public class LevelCreator extends Sprite
	{
		private var tilegrid:TileGrid;
		
		public function LevelCreator() 
		{
			tilegrid = new TileGrid();
			addChild(tilegrid);
			tilegrid.createGrid(15, 15, "creator");
		}
		
	}

}