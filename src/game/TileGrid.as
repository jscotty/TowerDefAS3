package game 
{
	import flash.display.MovieClip;
	import flash.display.Sprite;
	import flash.events.Event;
	import game.grid.Grid;
	import game.grid.CreatedGrid;
	/**
	 * ...
	 * @author justin Bieshaar
	 */
	public class TileGrid extends Sprite
	{
		public static var tileGrid:Array = [];
		public static var tileTexture:Array = [];
		
		private var row:int;
		private var col:int;
		private var _grid0:Grid0;
		private var _grid3:Grid3;
		private var _grid3Corn:Grid3Corn;
		private var _gridX:GridX;
		private var _gridBlue:GridKwabB;
		private var _gridBlueCorner:GridKwabBCorner;
		private var _gridRed:GridKwabR;
		private var _gridRedCorner:GridKwabRCorner;
		private var _gridRedEnd:GridKwabREnd;
		private var _gridBlueEnd:GridKwabBEnd;
		
		private var cellWidth:Number;
		private var cellHeight:Number;
		private var numColumns:Number = 43;
		private var numRows:Number = 28;
		
		private var newTile;
		private var _gridRed3Corn:GridKwabR3Way;
		private var _gridBlue3Corn:GridKwabB3Way;
		private var _grid:Sprite;
		
		public var gameGrid:String = "game";
		public var creatorGrid:String = "creator";
		
		public function createGrid(cellWidth:Number, cellHeight:Number, mode:String):void 
		{
			if(mode == gameGrid){
				tileGrid = Grid.tileGrid;
				tileTexture = Grid.tileTexture;
			} else if(mode == creatorGrid){
				tileGrid = CreatedGrid.tileGrid;
				tileTexture = CreatedGrid.tileTexture;
				
				_grid = new Sprite();
				_grid.graphics.clear();
				_grid.graphics.lineStyle(1, 0xffffff);
				_grid.alpha = 0.1;
			} 
			
			this.cellWidth = cellWidth;
			this.cellHeight = cellHeight;
			 for (row = 0; row < numRows; row++){
				for (col = 0; col < numColumns; col++) {
					if (mode == creatorGrid) {
						_grid.graphics.moveTo(col * cellWidth + 0, 0+ 0);
						_grid.graphics.lineTo(col * cellWidth + 0, cellHeight * numRows + 1);
						_grid.graphics.moveTo(0, row * cellHeight + 6);
						_grid.graphics.lineTo(cellWidth * numColumns + 6, row * cellHeight + 6);
						addChild(_grid);
					}
					if (tileGrid[row][col] == 0){
						// nothing
					} else if (tileGrid[row][col] == 1 || tileGrid[row][col] == 99 || tileGrid[row][col] == 7) {
							grid0(0);
					} else if (tileGrid[row][col] == 2 || tileGrid[row][col] == 8) {
							grid0(90);
					} else if (tileGrid[row][col] == 3 || tileGrid[row][col] == 9) {
							grid3(90);
					} else if (tileGrid[row][col] == 4 || tileGrid[row][col] == 10) {
							grid3(270);
					} else if (tileGrid[row][col] == 5 || tileGrid[row][col] == 11) {
							grid3(180);
					} else if (tileGrid[row][col] == 6 || tileGrid[row][col] == 12) {
							grid3(0);
					} else if (tileGrid[row][col] == -1) {
							gridRed(0);
					} else if (tileGrid[row][col] == -2) {
							gridRed(90);
					} else if (tileGrid[row][col] == -3) {
							gridRedCorner(90);
					} else if (tileGrid[row][col] == -4) {
							gridRedCorner(270);
					} else if (tileGrid[row][col] == -5) {
							gridRedCorner(180);
					} else if (tileGrid[row][col] == -6) {
							gridRedCorner(0);
					} else if (tileGrid[row][col] == -7) {
							gridRedEnd(0);
					} else if (tileGrid[row][col] == -8) {
							gridRedEnd(270);
					} else if (tileGrid[row][col] == -9) {
							gridRedEnd(90);
					} else if (tileGrid[row][col] == -10) {
							gridRedEnd(180);
					} else if (tileGrid[row][col] == -11) {
							gridBlue(0);
					} else if (tileGrid[row][col] == -12) {
							gridBlue(90);
					} else if (tileGrid[row][col] == -13) {
							gridBlueCorner(90);
					} else if (tileGrid[row][col] == -14) {
							gridBlueCorner(270);
					} else if (tileGrid[row][col] == -15) {
							gridBlueCorner(180);
					} else if (tileGrid[row][col] == -16) {
							gridBlueCorner(0);
					} else if (tileGrid[row][col] == -17) {
							gridBlueEnd(0);
					} else if (tileGrid[row][col] == -18) {
							gridBlueEnd(270);
					} else if (tileGrid[row][col] == -19) {
							gridBlueEnd(90);
					} else if (tileGrid[row][col] == -20) {
							gridBlueEnd(180);
					} else if (tileGrid[row][col] == -30) {
							gridRed3Corn(180);
					} else if (tileGrid[row][col] == -31) {
							gridRed3Corn(0);
					} else if (tileGrid[row][col] == -32) {
							gridRed3Corn(270);
					} else if (tileGrid[row][col] == -33) {
							gridRed3Corn(90);
					} else if (tileGrid[row][col] == -36) {
							gridBlue3Corn(180);
					} else if (tileGrid[row][col] == -37) {
							gridBlue3Corn(0);
					} else if (tileGrid[row][col] == -38) {
							gridBlue3Corn(270);
					} else if (tileGrid[row][col] == -39) {
							gridBlue3Corn(90);
					} else if (tileGrid[row][col] == 18) {
						grid3Corn(270, true);
					}  else if (tileGrid[row][col] == 19) {
						grid3Corn(90, true);
					} else if (tileGrid[row][col] == 20) {
						grid3Corn(180, true);
					} else if (tileGrid[row][col] == 21) {
						grid3Corn(0, true);
					} 	else if (tileGrid[row][col] == 22) {
							grid3Corn(270, false)
						} else if (tileGrid[row][col] == 23) {
							grid3Corn(90, false);
						} else if (tileGrid[row][col] == 24) {
							grid3Corn(180, false);
						} else if (tileGrid[row][col] == 25) {
							grid3Corn(0, false);
						}
				
				}
			}
		}
		
		public function grid0(rot:int):void 
		{
			_grid0 = new Grid0();
			tileTexture[row][col] = _grid0;
			addChild(_grid0);
			_grid0.x = col * cellWidth  + 34;
			_grid0.y = row * cellHeight + 34;
			_grid0.width = cellWidth;
			_grid0.height = cellHeight;
			
			_grid0.rotation = rot;
		}
		
		public function grid3(rot:int):void 
		{
			_grid3 = new Grid3();
			tileTexture[row][col] = _grid3;
			addChild(_grid3);
			_grid3.x = col * cellWidth  + 34;
			_grid3.y = row * cellHeight + 34;
			_grid3.width = cellWidth;
			_grid3.height = cellHeight;
			
			_grid3.rotation = rot;
		}
		
		public function grid3Corn(rot:int, rotatable:Boolean):void 
		{
			_grid3Corn = new Grid3Corn();
			tileTexture[row][col] = _grid3Corn;
			addChild(_grid3Corn);
			_grid3Corn.x = col * cellWidth  + 34;
			_grid3Corn.y = row * cellHeight + 34;
			_grid3Corn.width = cellWidth;
			_grid3Corn.height = cellHeight;
			
			_grid3Corn.rotation = rot;
			if (rotatable) {
				gridX(row, col);
			} else {
				
			}
		}
		
		public function gridBlue(rot:int):void 
		{
			_gridBlue = new GridKwabB();
			tileTexture[row][col] = _gridBlue;
			addChild(_gridBlue);
			_gridBlue.x = col * cellWidth  + 34;
			_gridBlue.y = row * cellHeight + 34;
			_gridBlue.width = cellWidth;
			_gridBlue.height = cellHeight;
			
			_gridBlue.rotation = rot;
		}
		
		public function gridBlue3Corn(rot:int):void 
		{
			_gridBlue3Corn = new GridKwabB3Way();
			tileTexture[row][col] = _gridBlue3Corn;
			addChild(_gridBlue3Corn);
			_gridBlue3Corn.x = col * cellWidth  + 34;
			_gridBlue3Corn.y = row * cellHeight + 34;
			_gridBlue3Corn.width = cellWidth;
			_gridBlue3Corn.height = cellHeight;
			
			_gridBlue3Corn.rotation = rot;
		}
		
		public function gridBlueEnd(rot:int):void 
		{
			_gridBlueEnd = new GridKwabBEnd();
			tileTexture[row][col] = _gridBlueEnd;
			addChild(_gridBlueEnd);
			_gridBlueEnd.x = col * cellWidth  + 34;
			_gridBlueEnd.y = row * cellHeight + 34;
			_gridBlueEnd.width = cellWidth;
			_gridBlueEnd.height = cellHeight;
			
			_gridBlueEnd.rotation = rot;
		}
		
		public function gridBlueCorner(rot:int):void 
		{
			_gridBlueCorner = new GridKwabBCorner();
			tileTexture[row][col] = _gridBlueCorner;
			addChild(_gridBlueCorner);
			_gridBlueCorner.x = col * cellWidth  + 34;
			_gridBlueCorner.y = row * cellHeight + 34;
			_gridBlueCorner.width = cellWidth;
			_gridBlueCorner.height = cellHeight;
			
			_gridBlueCorner.rotation = rot;
		}
		
		public function gridRed(rot:int):void 
		{
			_gridRed = new GridKwabR();
			tileTexture[row][col] = _gridRed;
			addChild(_gridRed);
			_gridRed.x = col * cellWidth  + 34;
			_gridRed.y = row * cellHeight + 34;
			_gridRed.width = cellWidth;
			_gridRed.height = cellHeight;
			
			_gridRed.rotation = rot;
		}
		
		public function gridRedEnd(rot:int):void 
		{
			_gridRedEnd = new GridKwabREnd();
			tileTexture[row][col] = _gridRedEnd;
			addChild(_gridRedEnd);
			_gridRedEnd.x = col * cellWidth  + 34;
			_gridRedEnd.y = row * cellHeight + 34;
			_gridRedEnd.width = cellWidth;
			_gridRedEnd.height = cellHeight;
			
			_gridRedEnd.rotation = rot;
		}
		
		public function gridRed3Corn(rot:int):void 
		{
			_gridRed3Corn = new GridKwabR3Way();
			tileTexture[row][col] = _gridRed3Corn;
			addChild(_gridRed3Corn);
			_gridRed3Corn.x = col * cellWidth  + 34;
			_gridRed3Corn.y = row * cellHeight + 34;
			_gridRed3Corn.width = cellWidth;
			_gridRed3Corn.height = cellHeight;
			
			_gridRed3Corn.rotation = rot;
		}
		
		public function gridRedCorner(rot:int):void 
		{
			_gridRedCorner = new GridKwabRCorner();
			tileTexture[row][col] = _gridRedCorner;
			addChild(_gridRedCorner);
			_gridRedCorner.x = col * cellWidth  + 34;
			_gridRedCorner.y = row * cellHeight + 34;
			_gridRedCorner.width = cellWidth;
			_gridRedCorner.height = cellHeight;
			
			_gridRedCorner.rotation = rot;
		}
		
		public function changeTileCorner(rot:int, rowNr:int, colNr:int, rotatable:Boolean):void 
		{
			removeChild(tileTexture[rowNr][colNr]);
			newTile = new Grid3();
			tileTexture[rowNr][colNr] = newTile;
			addChild(newTile);
			newTile.x = colNr * cellWidth  + 34;
			newTile.y = rowNr * cellHeight + 34;
			newTile.width = cellWidth;
			newTile.height = cellHeight;
			
			newTile.rotation = rot;
			
			if (rotatable) {
				gridX(rowNr, colNr);
			} else {
				
			}
		}
		public function changeTile(rot:int, rowNr:int, colNr:int, rotatable:Boolean):void 
		{
			removeChild(tileTexture[rowNr][colNr]);
			newTile = new Grid3Corn();
			tileTexture[rowNr][colNr] = newTile;
			addChild(newTile);
			newTile.x = colNr * cellWidth  + 34;
			newTile.y = rowNr * cellHeight + 34;
			newTile.width = cellWidth;
			newTile.height = cellHeight;
			
			newTile.rotation = rot;
			
			if (rotatable) {
				gridX(rowNr, colNr);
			} else {
				
			}
			
		}
		public function changeTileMultie(rowNr:int, colNr:int, rotatable:Boolean):void 
		{
			removeChild(tileTexture[rowNr][colNr]);
			newTile = new GridCorners();
			tileTexture[rowNr][colNr] = newTile;
			addChild(newTile);
			newTile.x = colNr * cellWidth  + 34;
			newTile.y = rowNr * cellHeight + 34;
			newTile.width = cellWidth;
			newTile.height = cellHeight;
			
			if (rotatable) {
				gridX(rowNr, colNr);
			} else {
				
			}
		}
		
		private function gridX(rowNr:int, colNr:int):void 
		{
			_gridX = new GridX();
			addChild(_gridX);
			
			_gridX.x = colNr * cellWidth  + 34;
			_gridX.y = rowNr * cellHeight + 34;
			_gridX.width = cellWidth;
			_gridX.height = cellHeight;
		}
	}

}