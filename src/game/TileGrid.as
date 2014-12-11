package game 
{
	import flash.display.Sprite;
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
							/*4*/	[0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 9, 7, 7,11, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1],
							/*5*/	[0, 0, 0, 0, 0, 0, 0, 0, 9, 7, 7, 7,11, 0, 0, 0, 0, 0, 0, 0, 8, 0, 0, 8, 0, 9, 8,11, 0, 0, 0, 0, 0, 0, 0, 0, 1],
							/*6*/	[0, 1, 1, 24, 1, 1, 3, 0, 8, 0, 0, 0, 8, 0, 0, 0, 0, 0, 0, 0, 8, 0, 0, 8, 0, 8, 0, 8, 0, 0, 0, 0, 0, 0, 0, 0, 1],
							/*7*/	[0, 0, 0, 0, 0, 0, 2, 0, 8, 0, 0, 0, 8, 0, 0, 0, 0, 0, 9, 7,12, 0, 0,10, 7,12, 0, 8, 0, 0, 0, 0, 0, 0, 0, 0, 1],
							/*8*/	[0, 0, 0, 0, 0, 0,19, 7,12, 0, 0, 0, 8, 0, 0, 0, 0, 0, 8, 0, 0, 0, 0, 0, 0, 0, 0, 8, 0, 0, 0, 0, 0, 0, 0, 0, 1],
							/*9*/	[0, 0, 0, 0, 0, 0, 2, 0, 0, 0, 0, 0, 8, 0, 0, 0, 0, 0, 8, 0, 0, 0, 0, 0, 0, 0, 0, 8, 0, 0, 0, 0, 0, 0, 0, 0, 1],
							/*10*/	[0, 0, 0, 0, 0, 0, 2, 0, 0, 0, 0, 0, 8, 0, 0, 0, 0, 0, 8, 0, 0, 9, 7,11, 0, 0, 0, 8, 0, 0, 0, 0, 0, 0, 0, 0, 1], 
							/*11*/	[0, 0, 0, 0, 0, 0, 4,20, 1, 1,20, 1, 1, 1, 1, 1, 3, 0, 8, 0, 0, 8, 0,11,11, 0, 0, 8, 0, 0, 0, 0, 0, 0, 0, 0, 1], 
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
																											
		public static var tileTexture:Array = [ //0 wall, 1 straight grid, 2 down grid, 3 corner, 4 corner, 5 corner, 6 corner, 4 blue grid straight, 5 blue grid down 
							/*1*/	[0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
							/*2*/	[0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
							/*3*/	[0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
							/*4*/	[0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 9, 7, 7,11, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1],
							/*5*/	[0, 0, 0, 0, 0, 0, 0, 0, 9, 7, 7, 7,11, 0, 0, 0, 0, 0, 0, 0, 8, 0, 0, 8, 0, 9, 8,11, 0, 0, 0, 0, 0, 0, 0, 0, 1],
							/*6*/	[0, 1, 1, 1, 1, 1, 3, 0, 8, 0, 0, 0, 8, 0, 0, 0, 0, 0, 0, 0, 8, 0, 0, 8, 0, 8, 0, 8, 0, 0, 0, 0, 0, 0, 0, 0, 1],
							/*7*/	[0, 0, 0, 0, 0, 0, 2, 0, 8, 0, 0, 0, 8, 0, 0, 0, 0, 0, 9, 7,12, 0, 0,10, 7,12, 0, 8, 0, 0, 0, 0, 0, 0, 0, 0, 1],
							/*8*/	[0, 0, 0, 0, 0, 0,19, 7,12, 0, 0, 0, 8, 0, 0, 0, 0, 0, 8, 0, 0, 0, 0, 0, 0, 0, 0, 8, 0, 0, 0, 0, 0, 0, 0, 0, 1],
							/*9*/	[0, 0, 0, 0, 0, 0, 2, 0, 0, 0, 0, 0, 8, 0, 0, 0, 0, 0, 8, 0, 0, 0, 0, 0, 0, 0, 0, 8, 0, 0, 0, 0, 0, 0, 0, 0, 1],
							/*10*/	[0, 0, 0, 0, 0, 0, 2, 0, 0, 0, 0, 0, 8, 0, 0, 0, 0, 0, 8, 0, 0, 9, 7,11, 0, 0, 0, 8, 0, 0, 0, 0, 0, 0, 0, 0, 1], 
							/*11*/	[0, 0, 0, 0, 0, 0, 4,23, 1, 1,25, 1,25, 1, 1, 1, 3, 0, 8, 0, 0, 8, 0,11,11, 0, 0, 8, 0, 0, 0, 0, 0, 0, 0, 0, 1], 
							/*12*/	[0, 0, 0, 0, 0, 0, 0,14, 0, 0,14, 0, 0, 0, 0, 0,19, 7,12, 0, 0, 8, 0, 0, 8, 0, 6,25, 1,21, 1, 1,25, 1, 1, 1, 99], 
							/*13*/	[0, 0, 0, 0, 0, 0, 0,14, 0, 0,14, 0, 0, 0, 0, 0, 2, 0, 0, 0, 0, 8, 0, 0, 8, 0, 2, 0, 0,14, 0, 0,14, 0, 0, 0, 1],
							/*14*/	[0, 0, 0, 0,15,13,13,18, 0, 0,14, 0, 0, 0, 0, 0, 4,21, 1, 1, 1,21,25, 1,25, 1, 5, 0, 0,14, 0, 0,14, 0, 0, 0, 1],
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
		;
		private var cellWidth:Number;
		private var cellHeight:Number;
		private var numColumns:Number = 36;
		private var numRows:Number = 25;
		
		public function createGrid(cellWidth:Number, cellHeight:Number):void 
		{
			this.cellWidth = cellWidth;
			this.cellHeight = cellHeight;
			 for (row = 0; row < numRows; row++){
				for (col = 0; col < numColumns; col++){
					if (tileGrid[row][col] == 0){
						// coming
					} else if (tileGrid[row][col] == 1 || tileGrid[row][col] == 99) {
							grid0();
					} else if (tileGrid[row][col] == 2) {
							grid0();
						_grid0.rotation = 90;
					} else if (tileGrid[row][col] == 3) {
							grid3();
						_grid3.rotation = 90;
					} else if (tileGrid[row][col] == 4) {
							grid3();
						_grid3.rotation = 270;
					} else if (tileGrid[row][col] == 5) {
							grid3();
						_grid3.rotation = 180;
					} else if (tileGrid[row][col] == 6) {
							grid3();
							
					}	else if (tileGrid[row][col] == 7) {
								gridDredS();
						}else if (tileGrid[row][col] == 8) {
								gridDredS();
							_gridDRedS.rotation = 90;
						} else if (tileGrid[row][col] == 9) {
								gridDRedC();
						} else if (tileGrid[row][col] == 10) {
								gridDRedC();
							_gridDRedC.rotation = 270;
						} else if (tileGrid[row][col] == 11) {
								gridDRedC();
							_gridDRedC.rotation = 90;
						} else if (tileGrid[row][col] == 12) {
								gridDRedC();
							_gridDRedC.rotation = 180;
						}	else if (tileGrid[row][col] == 13) {
									gridBlueS();
							}else if (tileGrid[row][col] == 14) {
									gridBlueS();
								_gridBlueS.rotation = 90;
							} else if (tileGrid[row][col] == 15) {
									gridBlueC();
							} else if (tileGrid[row][col] == 16) {
									gridBlueC();
								_gridBlueC.rotation = 270;
							} else if (tileGrid[row][col] == 17) {
									gridBlueC();
								_gridBlueC.rotation = 90;
							} else if (tileGrid[row][col] == 18) {
									gridBlueC();
								_gridBlueC.rotation = 180;
							}
					else if (tileGrid[row][col] == 19) {
							grid0();
						_grid0.alpha = 0.9;
						_grid0.rotation = 90;
					} else if (tileGrid[row][col] == 20) {
							grid0();
						_grid0.alpha = 0.9;
					} else if (tileGrid[row][col] == 21) {
							grid3();
						_grid3.alpha = 0.9;
						_grid3.rotation = 90;
					} else if (tileGrid[row][col] == 22) {
							grid3();
						_grid3.alpha = 0.9;
						_grid3.rotation = 180;
					} else if (tileGrid[row][col] == 23) {
							grid3();
						_grid3.alpha = 0.9;
						_grid3.rotation = 270;
					} else if (tileGrid[row][col] == 24) {
							grid3();
						_grid3.alpha = 0.9;
					} else if (tileGrid[row][col] == 25) {
							grid0();
					}
				
				}
			}
		}
		
		private function gridBlueC():void 
		{
			_gridBlueC = new GridBlueCorner();
			addChild(_gridBlueC);
			_gridBlueC.x = col * cellWidth  + 34;
			_gridBlueC.y = row * cellHeight + 34;
			_gridBlueC.width = cellWidth;
			_gridBlueC.height = cellHeight;
			
			tileTexture[row][col] = _gridBlueC;
		}
		
		private function gridBlueS():void 
		{
			_gridBlueS = new GridBlueStraight();
			addChild(_gridBlueS);
			_gridBlueS.x = col * cellWidth  + 34;
			_gridBlueS.y = row * cellHeight + 34;
			_gridBlueS.width = cellWidth;
			_gridBlueS.height = cellHeight;
			
			tileTexture[row][col] = _gridBlueS;
		}
		
		private function gridDredS():void 
		{
			_gridDRedS = new GridDRedStraight();
			addChild(_gridDRedS);
			_gridDRedS.x = col * cellWidth  + 34;
			_gridDRedS.y = row * cellHeight + 34;
			_gridDRedS.width = cellWidth;
			_gridDRedS.height = cellHeight;
			
			tileTexture[row][col] = _gridDRedS;
		}
		
		private function gridDRedC():void 
		{
			_gridDRedC = new GridDarkRedCorner();
			addChild(_gridDRedC);
			_gridDRedC.x = col * cellWidth  + 34;
			_gridDRedC.y = row * cellHeight + 34;
			_gridDRedC.width = cellWidth;
			_gridDRedC.height = cellHeight;
			
			tileTexture[row][col] = _gridDRedC;
		}
		
		private function grid0():void 
		{
			_grid0 = new Grid0();
			addChild(_grid0);
			_grid0.x = col * cellWidth  + 34;
			_grid0.y = row * cellHeight + 34;
			_grid0.width = cellWidth;
			_grid0.height = cellHeight;
			
			tileTexture[row][col] = _grid0;
		}
		
		private function grid3():void 
		{
			_grid3 = new Grid3();
			addChild(_grid3);
			_grid3.x = col * cellWidth  + 34;
			_grid3.y = row * cellHeight + 34;
			_grid3.width = cellWidth;
			_grid3.height = cellHeight;
			
			tileTexture[row][col] = _grid3;
		}
	}

}