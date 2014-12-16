package game 
{
	import flash.display.MovieClip;
	import flash.display.Sprite;
	import flash.events.Event;
	/**
	 * ...
	 * @author justin Bieshaar
	 */
	public class TileGrid extends Sprite
	{
		public static var tileGrid:Array = [  //0 wall, 1 straight grid, 2 down grid, 3 corner, 4 corner, 5 corner, 6 corner, 4 blue grid straight, 5 blue grid down 
							/*1*/	[0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
							/*2*/	[0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
							/*3*/	[0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
							/*4*/	[0, 0, 0, 0, 0, 0, 0, 0,-1,-1,-1,-1,-1,-1, 0, 0, 0, 0, 0, 0, 9, 7, 7,11, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1],
							/*5*/	[0, 0, 0, 0, 0, 0, 0, 0, 9, 7, 7, 7,11, 0, 0, 0, 0, 0, 0, 0, 8, 0, 0, 8, 0, 9, 7,11, 0, 0, 0, 0, 0, 0, 0, 0, 1],
							/*6*/	[0, 1, 1, 1, 1, 1, 3, 0, 8, 0, 0, 0, 8, 0, 0, 0, 0, 0, 0, 0, 8, 0, 0, 8, 0, 8, 0, 8, 0, 0, 0, 0, 0, 0, 0, 0, 1],
							/*7*/	[0, 0, 0, 0, 0, 0, 2, 0, 8, 0, 0, 0, 8, 0, 0, 0, 0, 0, 9, 7,12, 0, 0,10, 7,12, 0, 8, 0, 0, 0, 0, 0, 0, 0, 0, 1],
							/*8*/	[0, 0, 0, 0, 0, 0,19, 7,12, 0, 0, 0, 8, 0, 0, 0, 0, 0, 8, 0, 0, 0, 0, 0, 0, 0, 0, 8, 0, 0, 0, 0, 0, 0, 0, 0, 1],
							/*9*/	[0, 0, 0, 0, 0, 0, 2, 0, 0, 0, 0, 0, 8, 0, 0, 0, 0, 0, 8, 0, 0, 0, 0, 0, 0, 0, 0, 8, 0, 0, 0, 0, 0, 0, 0, 0, 1],
							/*10*/	[0, 0, 0, 0, 0, 0, 2, 0, 0, 0, 0, 0, 8, 0, 0, 0, 0, 0, 8, 0, 0, 9, 7,11, 0, 0, 0, 8, 0, 0, 0, 0, 0, 0, 0, 0, 1], 
							/*11*/	[0, 0, 0, 0, 0, 0, 4,20, 1, 1, 1, 1, 1, 1, 1, 1, 3, 0, 8, 0, 0, 8, 0,10,11, 0, 0, 8, 0, 0, 0, 0, 0, 0, 0, 0, 1], 
							/*12*/	[0, 0, 0, 0, 0, 0, 0,14, 0, 0,14, 0, 0, 0, 0, 0,19, 7,12, 0, 0, 8, 0, 0, 8, 0, 6, 1, 1,20, 1, 1, 1, 1, 1, 1, 99], 
							/*13*/	[0, 0, 0, 0, 0, 0, 0,14, 0, 0,14, 0, 0, 0, 0, 0, 2, 0, 0, 0, 0, 8, 0, 0, 8, 0, 2, 0, 0,14, 0, 0,14, 0, 0, 0, 1],
							/*14*/	[0, 0, 0, 0,15,13,13,18, 0, 0,14, 0, 0, 0, 0, 0, 4,20, 1, 1, 1,20, 1, 1, 1, 1, 5, 0, 0,14, 0, 0,14, 0, 0, 0, 1],
							/*15*/	[0, 0, 0, 0,14, 0, 0, 0, 0, 0,14, 0, 0, 0, 0, 0, 0,14, 0, 0, 0, 0,14, 0, 0, 0, 0,15,13,18, 0, 0,14, 0, 0, 0, 1],
							/*16*/	[0, 0, 0, 0,14, 0, 0, 0, 0, 0,14, 0, 0, 0, 0, 0, 0,14, 0, 0, 0, 0,14, 0, 0, 0, 0,14, 0, 0, 0,15,18, 0, 0, 0, 1], 
							/*17*/	[0, 0, 0, 0,16,13,13,13,17, 0,14, 0, 0, 0,15,13,13,18, 0, 0, 0, 0,14, 0, 0, 0, 0,14, 0, 0, 0,14, 0, 0, 0, 0, 1], 
							/*18*/	[0, 0, 0, 0, 0, 0, 0, 0,14, 0,14, 0, 0, 0,14, 0, 0, 0, 0, 0, 0, 0,16,13,17, 0, 0,16,13,13,13,18, 0, 0, 0, 0, 1], 
							/*19*/	[0, 0, 0, 0, 0, 0, 0, 0,16,13,18, 0, 0, 0,14, 0, 0, 0, 0, 0, 0, 0, 0, 0,14, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1],
							/*20*/	[0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,14, 0, 0, 0, 0, 0, 0, 0,15,13,18, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1], 
							/*21*/	[0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,14, 0, 0, 0, 0, 0, 0, 0,14, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1], 
							/*22*/	[0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,16,13,13,17, 0, 0, 0, 0,14, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1], 
							/*23*/	[0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,14, 0, 0, 0, 0,14, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1], 
							/*24*/	[0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,16,13,13,13,13,18, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1], 
							/*25*/	[0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1]
																																				];
																											
		public static var tileTexture:Array = [ //0 wall, 1 straight grid, 2 down grid, 3 corner, 4 corner, 5 corner, 6 corner 
							/*1*/	[0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
							/*2*/	[0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
							/*3*/	[0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
							/*4*/	[0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 9, 7, 7,11, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1],
							/*5*/	[0, 0, 0, 0, 0, 0, 0, 0, 9, 7, 7, 7,11, 0, 0, 0, 0, 0, 0, 0, 8, 0, 0, 8, 0, 9, 7,11, 0, 0, 0, 0, 0, 0, 0, 0, 1],
							/*6*/	[0, 1, 1, 1, 1, 1, 3, 0, 8, 0, 0, 0, 8, 0, 0, 0, 0, 0, 0, 0, 8, 0, 0, 8, 0, 8, 0, 8, 0, 0, 0, 0, 0, 0, 0, 0, 1],
							/*7*/	[0, 0, 0, 0, 0, 0, 2, 0, 8, 0, 0, 0, 8, 0, 0, 0, 0, 0, 9, 7,12, 0, 0,10, 7,12, 0, 8, 0, 0, 0, 0, 0, 0, 0, 0, 1],
							/*8*/	[0, 0, 0, 0, 0, 0,19, 7,12, 0, 0, 0, 8, 0, 0, 0, 0, 0, 8, 0, 0, 0, 0, 0, 0, 0, 0, 8, 0, 0, 0, 0, 0, 0, 0, 0, 1],
							/*9*/	[0, 0, 0, 0, 0, 0, 2, 0, 0, 0, 0, 0, 8, 0, 0, 0, 0, 0, 8, 0, 0, 0, 0, 0, 0, 0, 0, 8, 0, 0, 0, 0, 0, 0, 0, 0, 1],
							/*10*/	[0, 0, 0, 0, 0, 0, 2, 0, 0, 0, 0, 0, 8, 0, 0, 0, 0, 0, 8, 0, 0, 9, 7,11, 0, 0, 0, 8, 0, 0, 0, 0, 0, 0, 0, 0, 1], 
							/*11*/	[0, 0, 0, 0, 0, 0, 4,20, 1, 1, 1, 1, 1, 1, 1, 1, 3, 0, 8, 0, 0, 8, 0,10,11, 0, 0, 8, 0, 0, 0, 0, 0, 0, 0, 0, 1], 
							/*12*/	[0, 0, 0, 0, 0, 0, 0,14, 0, 0,14, 0, 0, 0, 0, 0,19, 7,12, 0, 0, 8, 0, 0, 8, 0, 6, 1, 1,20, 1, 1, 1, 1, 1, 1, 99], 
							/*13*/	[0, 0, 0, 0, 0, 0, 0,14, 0, 0,14, 0, 0, 0, 0, 0, 2, 0, 0, 0, 0, 8, 0, 0, 8, 0, 2, 0, 0,14, 0, 0,14, 0, 0, 0, 1],
							/*14*/	[0, 0, 0, 0,15,13,13,18, 0, 0,14, 0, 0, 0, 0, 0, 4,20, 1, 1, 1,20, 1, 1, 1, 1, 5, 0, 0,14, 0, 0,14, 0, 0, 0, 1],
							/*15*/	[0, 0, 0, 0,14, 0, 0, 0, 0, 0,14, 0, 0, 0, 0, 0, 0,14, 0, 0, 0, 0,14, 0, 0, 0, 0,15,13,18, 0, 0,14, 0, 0, 0, 1],
							/*16*/	[0, 0, 0, 0,14, 0, 0, 0, 0, 0,14, 0, 0, 0, 0, 0, 0,14, 0, 0, 0, 0,14, 0, 0, 0, 0,14, 0, 0, 0,15,18, 0, 0, 0, 1], 
							/*17*/	[0, 0, 0, 0,16,13,13,13,17, 0,14, 0, 0, 0,15,13,13,18, 0, 0, 0, 0,14, 0, 0, 0, 0,14, 0, 0, 0,14, 0, 0, 0, 0, 1], 
							/*18*/	[0, 0, 0, 0, 0, 0, 0, 0,14, 0,14, 0, 0, 0,14, 0, 0, 0, 0, 0, 0, 0,16,13,17, 0, 0,16,13,13,13,18, 0, 0, 0, 0, 1], 
							/*19*/	[0, 0, 0, 0, 0, 0, 0, 0,16,13,18, 0, 0, 0,14, 0, 0, 0, 0, 0, 0, 0, 0, 0,14, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1],
							/*20*/	[0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,14, 0, 0, 0, 0, 0, 0, 0,15,13,18, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1], 
							/*21*/	[0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,14, 0, 0, 0, 0, 0, 0, 0,14, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1], 
							/*22*/	[0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,16,13,13,17, 0, 0, 0, 0,14, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1], 
							/*23*/	[0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,14, 0, 0, 0, 0,14, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1], 
							/*24*/	[0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,16,13,13,13,13,18, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1], 
							/*25*/	[0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1]
																											];
		
		private var row:int;
		private var col:int;
		private var _grid0:Grid0;
		private var _grid3:Grid3;
		private var _gridDRedS:GridDRedStraight;
		private var _gridDRedC:GridDarkRedCorner;
		private var _gridBlueS:GridBlueStraight;
		private var _gridBlueC:GridBlueCorner;
		
		private var cellWidth:Number;
		private var cellHeight:Number;
		private var numColumns:Number = 36;
		private var numRows:Number = 25;
		
		private var newTile:Grid0;
		
		public function createGrid(cellWidth:Number, cellHeight:Number):void 
		{
			this.cellWidth = cellWidth;
			this.cellHeight = cellHeight;
			 for (row = 0; row < numRows; row++){
				for (col = 0; col < numColumns; col++){
					if (tileGrid[row][col] == 0){
						// coming
					} else if (tileGrid[row][col] == 1 || tileGrid[row][col] == 99) {
							grid0(0);
							
							tileTexture[row][col] = _grid0;
					} else if (tileGrid[row][col] == 2) {
							grid0(90);
							
							tileTexture[row][col] = _grid0;
					} else if (tileGrid[row][col] == 3) {
							grid3(90);
					} else if (tileGrid[row][col] == 4) {
							grid3(270);
					} else if (tileGrid[row][col] == 5) {
							grid3(180);
					} else if (tileGrid[row][col] == 6) {
							grid3(0);
							
					}	else if (tileGrid[row][col] == 7) {
								gridDredS(0);
						}else if (tileGrid[row][col] == 8) {
								gridDredS(90);
						} else if (tileGrid[row][col] == 9) {
								gridDRedC(0);
						} else if (tileGrid[row][col] == 10) {
								gridDRedC(270);
						} else if (tileGrid[row][col] == 11) {
								gridDRedC(90);
						} else if (tileGrid[row][col] == 12) {
								gridDRedC(180);
						}	else if (tileGrid[row][col] == 13) {
									gridBlueS(0);
							}else if (tileGrid[row][col] == 14) {
									gridBlueS(90);
							} else if (tileGrid[row][col] == 15) {
									gridBlueC(0);
							} else if (tileGrid[row][col] == 16) {
									gridBlueC(270);
							} else if (tileGrid[row][col] == 17) {
									gridBlueC(90);
							} else if (tileGrid[row][col] == 18) {
									gridBlueC(180);
							}
					else if (tileGrid[row][col] == 19) {
							grid0(90);
							
							tileTexture[row][col] = _grid0;
						_grid0.alpha = 0.9;
					} else if (tileGrid[row][col] == 20) {
							grid0(0);
							
							tileTexture[row][col] = _grid0;
						_grid0.alpha = 0.9;
					} else if (tileGrid[row][col] == 21) {
							grid3(90);
						_grid3.alpha = 0.9;
					} else if (tileGrid[row][col] == 22) {
							grid3(180);
						_grid3.alpha = 0.9;
					} else if (tileGrid[row][col] == 23) {
							grid3(270);
						_grid3.alpha = 0.9;
					} else if (tileGrid[row][col] == 24) {
							grid3(0);
						_grid3.alpha = 0.9;
					} else if (tileGrid[row][col] == 25) {
							grid0(0);
					}
				
				}
			}
		}
		
		public function gridBlueC(rot:int):void 
		{
			_gridBlueC = new GridBlueCorner();
			tileTexture[row][col] = _gridBlueC;
			addChild(_gridBlueC);
			_gridBlueC.x = col * cellWidth  + 34;
			_gridBlueC.y = row * cellHeight + 34;
			_gridBlueC.width = cellWidth;
			_gridBlueC.height = cellHeight;
			
			_gridBlueC.rotation = rot;
		}
		
		public function gridBlueS(rot:int):void 
		{
			_gridBlueS = new GridBlueStraight();
			tileTexture[row][col] = _gridBlueS;
			addChild(_gridBlueS);
			_gridBlueS.x = col * cellWidth  + 34;
			_gridBlueS.y = row * cellHeight + 34;
			_gridBlueS.width = cellWidth;
			_gridBlueS.height = cellHeight;
			
			_gridBlueS.rotation = rot;
		}
		
		public function gridDredS(rot:int):void 
		{
			_gridDRedS = new GridDRedStraight();
			tileTexture[row][col] = _gridDRedS;
			addChild(_gridDRedS);
			_gridDRedS.x = col * cellWidth  + 34;
			_gridDRedS.y = row * cellHeight + 34;
			_gridDRedS.width = cellWidth;
			_gridDRedS.height = cellHeight;
			
			_gridDRedS.rotation = rot;
		}
		
		public function gridDRedC(rot:int):void 
		{
			_gridDRedC = new GridDarkRedCorner();
			tileTexture[row][col] = _gridDRedC;
			addChild(_gridDRedC);
			_gridDRedC.x = col * cellWidth  + 34;
			_gridDRedC.y = row * cellHeight + 34;
			_gridDRedC.width = cellWidth;
			_gridDRedC.height = cellHeight;
			
			_gridDRedC.rotation = rot;
			
			tileTexture[row][col] = _gridDRedC;
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
		public function changeTile(rot:int, rowNr:int, colNr:int):void 
		{
			removeChild(tileTexture[rowNr][colNr]);
			newTile = new Grid0;
			tileTexture[rowNr][colNr] = newTile;
			addChild(newTile);
			newTile.x = colNr * cellWidth  + 34;
			newTile.y = rowNr * cellHeight + 34;
			newTile.width = cellWidth;
			newTile.height = cellHeight;
			
			newTile.rotation = rot;
			
		}
	}

}