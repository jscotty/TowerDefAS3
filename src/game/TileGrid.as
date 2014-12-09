package game 
{
	import flash.display.Sprite;
	/**
	 * ...
	 * @author justin Bieshaar
	 */
	public class TileGrid extends Sprite
	{
		public static var tileGrid:Array = [  //1 wall, 0 straight grid, 2 down grid, 3 corner, 4 corner, 5 corner, 6 corner, 4 blue grid straight, 5 blue grid down 
							/*1*/	[1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1],
							/*2*/	[1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1],
							/*3*/	[1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1],
							/*4*/	[1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 9, 7, 7,11, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1],
							/*5*/	[1, 1, 1, 1, 1, 1, 1, 1, 9, 7, 7, 7,11, 1, 1, 1, 1, 1, 1, 1, 8, 1, 1, 8, 1, 9, 8,11, 1, 1, 1, 1, 1, 1, 1, 1, 1],
							/*6*/	[1, 0, 0, 0, 0, 0, 3, 1, 8, 1, 1, 1, 8, 1, 1, 1, 1, 1, 1, 1, 8, 1, 1, 8, 1, 8, 1, 8, 1, 1, 1, 1, 1, 1, 1, 1, 1],
							/*7*/	[1, 1, 1, 1, 1, 1, 2, 1, 8, 1, 1, 1, 8, 1, 1, 1, 1, 1, 9, 7,12, 1, 1,10, 7,12, 1, 8, 1, 1, 1, 1, 1, 1, 1, 1, 1],
							/*8*/	[1, 1, 1, 1, 1, 1,19, 7,12, 1, 1, 1, 8, 1, 1, 1, 1, 1, 8, 1, 1, 1, 1, 1, 1, 1, 1, 8, 1, 1, 1, 1, 1, 1, 1, 1, 1],
							/*9*/	[1, 1, 1, 1, 1, 1, 2, 1, 1, 1, 1, 1, 8, 1, 1, 1, 1, 1, 8, 1, 1, 1, 1, 1, 1, 1, 1, 8, 1, 1, 1, 1, 1, 1, 1, 1, 1],
							/*10*/	[1, 1, 1, 1, 1, 1, 2, 1, 1, 1, 1, 1, 8, 1, 1, 1, 1, 1, 8, 1, 1, 9, 7,11, 1, 1, 1, 8, 1, 1, 1, 1, 1, 1, 1, 1, 1], 
							/*11*/	[1, 1, 1, 1, 1, 1, 4, 3, 0, 0,25, 0,25, 0, 0, 0,21, 7,12, 1, 1, 8, 1,10,11, 1, 1, 8, 1, 1, 1, 1, 1, 1, 1, 1, 1], 
							/*12*/	[1, 1, 1, 1, 1, 1, 1,14, 1, 1,14, 1, 1, 1, 1, 1, 2, 1, 1, 1, 1, 8, 1, 1, 8, 1, 6,25, 0,20, 0, 0,25, 0, 0, 0, 1], 
							/*13*/	[1, 1, 1, 1, 1, 1, 1,14, 1, 1,14, 1, 1, 1, 1, 1, 2, 1, 1, 1, 1, 8, 1, 1, 8, 1, 2, 1, 1,14, 1, 1,14, 1, 1, 1, 1],
							/*14*/	[1, 1, 1, 1,15,13,13,18, 1, 1,14, 1, 1, 1, 1, 1, 4,20, 0, 0, 0,20,25, 0,25, 0, 5, 1, 1,14, 1, 1,14, 1, 1, 1, 1],
							/*15*/	[1, 1, 1, 1,14, 1, 1, 1, 1, 1,14, 1, 1, 1, 1, 1, 1,14, 1, 1, 1, 1,14, 1, 1, 1, 1,15,13,18, 1, 1,14, 1, 1, 1, 1],
							/*16*/	[1, 1, 1, 1,14, 1, 1, 1, 1, 1,14, 1, 1, 1, 1, 1, 1,14, 1, 1, 1, 1,14, 1, 1, 1, 1,14, 1, 1, 1,15,18, 1, 1, 1, 1], 
							/*17*/	[1, 1, 1, 1,16,13,13,13,17, 1,14, 1, 1, 1,15,13,13,18, 1, 1, 1, 1,14, 1, 1, 1, 1,14, 1, 1, 1,14, 1, 1, 1, 1, 1], 
							/*18*/	[1, 1, 1, 1, 1, 1, 1, 1,14, 1,14, 1, 1, 1,14, 1, 1, 1, 1, 1, 1, 1,16,13,17, 1, 1,16,13,13,13,18, 1, 1, 1, 1, 1], 
							/*19*/	[1, 1, 1, 1, 1, 1, 1, 1,16,13,18, 1, 1, 1,14, 1, 1, 1, 1, 1, 1, 1, 1, 1,14, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1],
							/*20*/	[1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1,14, 1, 1, 1, 1, 1, 1, 1,15,13,18, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1], 
							/*21*/	[1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1,14, 1, 1, 1, 1, 1, 1, 1,14, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1], 
							/*22*/	[1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1,16,13,13,17, 1, 1, 1, 1,14, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1], 
							/*23*/	[1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1,14, 1, 1, 1, 1,14, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1], 
							/*24*/	[1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1,16,13,13,13,13,18, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1], 
							/*25*/	[1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1]
																																				];
																											
		public static var tileTexture:Array = [ //1 wall, 0 straight grid, 2 down grid, 3 corner, 4 corner, 5 corner, 6 corner, 4 blue grid straight, 5 blue grid down 
							/*1*/	[1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1],
							/*2*/	[1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1],
							/*3*/	[1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1],
							/*4*/	[1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 9, 7, 7,11, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1],
							/*5*/	[1, 1, 1, 1, 1, 1, 1, 1, 9, 7, 7, 7,11, 1, 1, 1, 1, 1, 1, 1, 8, 1, 1, 8, 1, 9, 8,11, 1, 1, 1, 1, 1, 1, 1, 1, 1],
							/*6*/	[1, 0, 0, 0, 0, 0, 3, 1, 8, 1, 1, 1, 8, 1, 1, 1, 1, 1, 1, 1, 8, 1, 1, 8, 1, 8, 1, 8, 1, 1, 1, 1, 1, 1, 1, 1, 1],
							/*7*/	[1, 1, 1, 1, 1, 1, 2, 1, 8, 1, 1, 1, 8, 1, 1, 1, 1, 1, 9, 7,12, 1, 1,10, 7,12, 1, 8, 1, 1, 1, 1, 1, 1, 1, 1, 1],
							/*8*/	[1, 1, 1, 1, 1, 1,19, 7,12, 1, 1, 1, 8, 1, 1, 1, 1, 1, 8, 1, 1, 1, 1, 1, 1, 1, 1, 8, 1, 1, 1, 1, 1, 1, 1, 1, 1],
							/*9*/	[1, 1, 1, 1, 1, 1, 2, 1, 1, 1, 1, 1, 8, 1, 1, 1, 1, 1, 8, 1, 1, 1, 1, 1, 1, 1, 1, 8, 1, 1, 1, 1, 1, 1, 1, 1, 1],
							/*10*/	[1, 1, 1, 1, 1, 1, 2, 1, 1, 1, 1, 1, 8, 1, 1, 1, 1, 1, 8, 1, 1, 9, 7,11, 1, 1, 1, 8, 1, 1, 1, 1, 1, 1, 1, 1, 1], 
							/*11*/	[1, 1, 1, 1, 1, 1, 4, 3, 0, 0,25, 0,25, 0, 0, 0,21, 7,12, 1, 1, 8, 1,10,11, 1, 1, 8, 1, 1, 1, 1, 1, 1, 1, 1, 1], 
							/*12*/	[1, 1, 1, 1, 1, 1, 1,14, 1, 1,14, 1, 1, 1, 1, 1, 2, 1, 1, 1, 1, 8, 1, 1, 8, 1, 6,25, 0,20, 0, 0,25, 0, 0, 0, 1], 
							/*13*/	[1, 1, 1, 1, 1, 1, 1,14, 1, 1,14, 1, 1, 1, 1, 1, 2, 1, 1, 1, 1, 8, 1, 1, 8, 1, 2, 1, 1,14, 1, 1,14, 1, 1, 1, 1],
							/*14*/	[1, 1, 1, 1,15,13,13,18, 1, 1,14, 1, 1, 1, 1, 1, 4,20, 0, 0, 0,20,25, 0,25, 0, 5, 1, 1,14, 1, 1,14, 1, 1, 1, 1],
							/*15*/	[1, 1, 1, 1,14, 1, 1, 1, 1, 1,14, 1, 1, 1, 1, 1, 1,14, 1, 1, 1, 1,14, 1, 1, 1, 1,15,13,18, 1, 1,14, 1, 1, 1, 1],
							/*16*/	[1, 1, 1, 1,14, 1, 1, 1, 1, 1,14, 1, 1, 1, 1, 1, 1,14, 1, 1, 1, 1,14, 1, 1, 1, 1,14, 1, 1, 1,15,18, 1, 1, 1, 1], 
							/*17*/	[1, 1, 1, 1,16,13,13,13,17, 1,14, 1, 1, 1,15,13,13,18, 1, 1, 1, 1,14, 1, 1, 1, 1,14, 1, 1, 1,14, 1, 1, 1, 1, 1], 
							/*18*/	[1, 1, 1, 1, 1, 1, 1, 1,14, 1,14, 1, 1, 1,14, 1, 1, 1, 1, 1, 1, 1,16,13,17, 1, 1,16,13,13,13,18, 1, 1, 1, 1, 1], 
							/*19*/	[1, 1, 1, 1, 1, 1, 1, 1,16,13,18, 1, 1, 1,14, 1, 1, 1, 1, 1, 1, 1, 1, 1,14, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1],
							/*20*/	[1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1,14, 1, 1, 1, 1, 1, 1, 1,15,13,18, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1], 
							/*21*/	[1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1,14, 1, 1, 1, 1, 1, 1, 1,14, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1], 
							/*22*/	[1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1,16,13,13,17, 1, 1, 1, 1,14, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1], 
							/*23*/	[1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1,14, 1, 1, 1, 1,14, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1], 
							/*24*/	[1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1,16,13,13,13,13,18, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1], 
							/*25*/	[1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1]
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
						_grid0 = new Grid0();
						addChild(_grid0);
							grid0();
					} else if (tileGrid[row][col] == 1) {
						// coming
					} else if (tileGrid[row][col] == 2) {
						_grid0 = new Grid0();
						addChild(_grid0);
							grid0();
						_grid0.rotation = 90;
					} else if (tileGrid[row][col] == 3) {
						_grid3 = new Grid3();
						addChild(_grid3);
							grid3();
						_grid3.rotation = 90;
					} else if (tileGrid[row][col] == 4) {
						_grid3 = new Grid3();
						addChild(_grid3);
							grid3();
						_grid3.rotation = 270;
					} else if (tileGrid[row][col] == 5) {
						_grid3 = new Grid3();
						addChild(_grid3);
							grid3();
						_grid3.rotation = 180;
					} else if (tileGrid[row][col] == 6) {
						_grid3 = new Grid3();
						addChild(_grid3);
							grid3();
							
					}	else if (tileGrid[row][col] == 7) {
							_gridDRedS = new GridDRedStraight();
							addChild(_gridDRedS);
								gridDredS();
						}else if (tileGrid[row][col] == 8) {
							_gridDRedS = new GridDRedStraight();
							addChild(_gridDRedS);
								gridDredS();
							_gridDRedS.rotation = 90;
						} else if (tileGrid[row][col] == 9) {
							_gridDRedC = new GridDarkRedCorner();
							addChild(_gridDRedC);
								gridDRedC();
						} else if (tileGrid[row][col] == 10) {
							_gridDRedC = new GridDarkRedCorner();
							addChild(_gridDRedC);
								gridDRedC();
							_gridDRedC.rotation = 270;
						} else if (tileGrid[row][col] == 11) {
							_gridDRedC = new GridDarkRedCorner();
							addChild(_gridDRedC);
								gridDRedC();
							_gridDRedC.rotation = 90;
						} else if (tileGrid[row][col] == 12) {
							_gridDRedC = new GridDarkRedCorner();
							addChild(_gridDRedC);
								gridDRedC();
							_gridDRedC.rotation = 180;
						}	else if (tileGrid[row][col] == 13) {
								_gridBlueS = new GridBlueStraight();
								addChild(_gridBlueS);
									gridBlueS();
							}else if (tileGrid[row][col] == 14) {
								_gridBlueS = new GridBlueStraight();
								addChild(_gridBlueS);
									gridBlueS();
								_gridBlueS.rotation = 90;
							} else if (tileGrid[row][col] == 15) {
								_gridBlueC = new GridBlueCorner();
								addChild(_gridBlueC);
									gridBlueC();
							} else if (tileGrid[row][col] == 16) {
								_gridBlueC = new GridBlueCorner();
								addChild(_gridBlueC);
									gridBlueC();
								_gridBlueC.rotation = 270;
							} else if (tileGrid[row][col] == 17) {
								_gridBlueC = new GridBlueCorner();
								addChild(_gridBlueC);
									gridBlueC();
								_gridBlueC.rotation = 90;
							} else if (tileGrid[row][col] == 18) {
								_gridBlueC = new GridBlueCorner();
								addChild(_gridBlueC);
									gridBlueC();
								_gridBlueC.rotation = 180;
							}
					else if (tileGrid[row][col] == 19) {
						_grid0 = new Grid0();
						addChild(_grid0);
							grid0();
						_grid0.alpha = 0.9;
						_grid0.rotation = 90;
					} else if (tileGrid[row][col] == 20) {
						_grid0 = new Grid0();
						addChild(_grid0);
							grid0();
						_grid0.alpha = 0.9;
					} else if (tileGrid[row][col] == 21) {
						_grid3 = new Grid3();
						addChild(_grid3);
							grid3();
						_grid3.alpha = 0.9;
						_grid3.rotation = 90;
					} else if (tileGrid[row][col] == 22) {
						_grid3 = new Grid3();
						addChild(_grid3);
							grid3();
						_grid3.alpha = 0.9;
						_grid3.rotation = 180;
					} else if (tileGrid[row][col] == 23) {
						_grid3 = new Grid3();
						addChild(_grid3);
							grid3();
						_grid3.alpha = 0.9;
						_grid3.rotation = 270;
					} else if (tileGrid[row][col] == 24) {
						_grid3 = new Grid3();
						addChild(_grid3);
							grid3();
						_grid3.alpha = 0.9;
					} else if (tileGrid[row][col] == 25) {
						_grid0 = new Grid0();
						addChild(_grid0);
							grid0();
					}
				
				}
			}
		}
		
		private function gridBlueC():void 
		{
			_gridBlueC.x = col * cellWidth  + 34;
			_gridBlueC.y = row * cellHeight + 34;
			_gridBlueC.width = cellWidth;
			_gridBlueC.height = cellHeight;
			
			tileTexture[row][col] = _gridBlueC;
		}
		
		private function gridBlueS():void 
		{
			_gridBlueS.x = col * cellWidth  + 34;
			_gridBlueS.y = row * cellHeight + 34;
			_gridBlueS.width = cellWidth;
			_gridBlueS.height = cellHeight;
			
			tileTexture[row][col] = _gridBlueS;
		}
		
		private function gridDredS():void 
		{
			_gridDRedS.x = col * cellWidth  + 34;
			_gridDRedS.y = row * cellHeight + 34;
			_gridDRedS.width = cellWidth;
			_gridDRedS.height = cellHeight;
			
			tileTexture[row][col] = _gridDRedS;
		}
		
		private function gridDRedC():void 
		{
			_gridDRedC.x = col * cellWidth  + 34;
			_gridDRedC.y = row * cellHeight + 34;
			_gridDRedC.width = cellWidth;
			_gridDRedC.height = cellHeight;
			
			tileTexture[row][col] = _gridDRedC;
		}
		
		private function grid0():void 
		{
			_grid0.x = col * cellWidth  + 34;
			_grid0.y = row * cellHeight + 34;
			_grid0.width = cellWidth;
			_grid0.height = cellHeight;
			
			tileTexture[row][col] = _grid0;
		}
		
		private function grid3():void 
		{
			_grid3.x = col * cellWidth  + 34;
			_grid3.y = row * cellHeight + 34;
			_grid3.width = cellWidth;
			_grid3.height = cellHeight;
			
			tileTexture[row][col] = _grid3;
		}
	}

}