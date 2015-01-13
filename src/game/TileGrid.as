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
							/*1*/	[0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0], 
							/*2*/	[0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0], 
							/*3*/	[0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0, -6, -1, -1, -1, -1, -3,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0], 
							/*4*/	[0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0, -6, -1, -1, -1, -1, -1, -3,  0,  0,  0,  0,  0, -2, 12,  7,  7,  9, -9, -1, -1, -1, -3,  0,  0,  0,  0,  0,  0,  0,  0], 
							/*5*/	[0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0, -2, 12,  7,  7,  7,  9, -2,  0,  0,  0,  0,  0, -2,  8, -6, -3,  8, -2, 12,  7,  9, -2,  0,  0,  0,  0,  0,  0,  0,  0], 
							/*6*/	[1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  3, -2,  8, -6, -1, -3,  8, -2,  0,  0,  0, -6, -1, -5,  8, -2, -2,  8, -7,  8, -8,  8, -2,  0,  0,  0,  0,  0,  0,  0,  0], 
							/*7*/	[0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  2, -7,  8, -2,  0, -2,  8, -2,  0,  0,  0, -2, 12,  7, 11, -2, -2, 10,  7, 11, -2,  8, -2,  0,  0,  0,  0,  0,  0,  0,  0], 
							/*8*/	[0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0, 19,  7, 11, -2,  0, -2,  8, -2,  0,  0,  0, -2,  8, -6, -1, -5, -4, -1, -1, -1, -2,  8, -2,  0,  0,  0,  0,  0,  0,  0,  0], 
							/*9*/	[0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  2, -6, -1, -5,  0, -2,  8, -2,  0,  0,  0, -2,  8, -2, -6, -1, -1, -1, -3,  0, -2,  8, -2,  0,  0,  0,  0,  0,  0,  0,  0], 
							/*10*/	[0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  2, -4, -1, -1, -1, -5,  8, -4, -1, -1, -1,-30,  8, -2, -2, 12,  7,  9, -4, -3, -2,  8, -2,  0,  0,  0,  0,  0,  0,  0,  0],  
							/*11*/	[0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  4, 20,  1,  1, 24,  1, 25,  1,  1,  1,  3, -7,  8, -2, -2,  8, -2, 10,  3, -9, -5,  8, -7,  0,  0,  0,  0,  0,  0,  0,  0],  
							/*12*/	[0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  8,  0,  0,  8,  0,  0,  0,  0,  0, 19,  1, 11, -2, -2,  8,-30, -3,  8, -2,  6, 25,  1, 20,  1,  1, 24,  1,  1,  1, 99],  
							/*13*/	[0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  8,  0,  0,  8,  0,  0,  0,  0,  0,  2, -1, -1,-30, -5,  8, -4, -5,  8, -7,  2,  0,  0,  8,  0,  0,  8,  0,  0,  0,  0], 
							/*14*/	[0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0, 12,  7,  7, 11,  0,  0,  8,  0,  0,  0,  0,  0,  4, 20,  1,  1,  1, 21, 24,  1, 25,  1,  5,  0,  0,  8,  0,  0,  8,  0,  0,  0,  0], 
							/*15*/	[0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  8,  0,  0,  0,  0,  0,  8,  0,  0,  0,  0,  0,  0,  8,  0,  0,  0,  0,  8,  0,  0,  0,  0, 12,  7, 11,  0,  0,  8,  0,  0,  0,  0], 
							/*16*/	[0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  8,  0,  0,  0,  0,  0,  8,  0,  0,  0,  0,  0,  0,  8,  0,  0,  0,  0,  8,  0,  0,  0,  0,  8,  0,  0,  0, 12, 11,  0,  0,  0,  0],  
							/*17*/	[0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0, 10,  7,  7,  7,  9,  0,  8,  0,  0,  0, 12,  7,  7, 11,  0,  0,  0,  0,  8,  0,  0,  0,  0,  8,  0,  0,  0,  8,  0,  0,  0,  0,  0],  
							/*18*/	[0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  8,  0,  8,  0,  0,  0,  8,  0,  0,  0,  0,  0,  0,  0, 10,  7,  9,  0,  0, 10,  7,  7,  7, 11,  0,  0,  0,  0,  0],  
							/*19*/	[0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0, 10,  7, 11,  0,  0,  0,  8,  0,  0,  0,  0,  0,  0,  0,  0,  0,  8,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0], 
							/*20*/	[0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  8,  0,  0,  0,  0,  0,  0,  0, 12,  7, 11,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0],  
							/*21*/	[0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  8,  0,  0,  0,  0,  0,  0,  0,  8,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0],  
							/*22*/	[0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0, 10,  7,  7,  9,  0,  0,  0,  0,  8,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0],  
							/*23*/	[0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  8,  0,  0,  0,  0,  8,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0],  
							/*24*/	[0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0, 10,  7,  7,  7,  7, 11,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0],  
							/*25*/	[0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0], 
							/*26*/	[0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0], 
							/*27*/	[0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0], 
							/*28*/	[0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0]
																																				];
																											
		public static var tileTexture:Array = [ //0 wall,  1 straight grid,  2 down grid,  3 corner,  4 corner,  5 corner,  6 corner 
							/*1*/	[0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
							/*2*/	[0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
							/*3*/	[0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
							/*4*/	[0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 6, 7, 7, 3, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
							/*5*/	[0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 6, 7, 7, 7, 3, 0, 0, 0, 0, 0, 0, 0, 8, 0, 0, 8, 0, 6, 7, 3, 0, 0, 0, 0, 0, 0, 0, 0, 0],
							/*6*/	[1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 3, 0, 8, 0, 0, 0, 8, 0, 0, 0, 0, 0, 0, 0, 8, 0, 0, 8, 0, 8, 0, 8, 0, 0, 0, 0, 0, 0, 0, 0, 0],
							/*7*/	[0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2, 0, 8, 0, 0, 0, 8, 0, 0, 0, 0, 0, 6, 7, 5, 0, 0, 4, 7, 5, 0, 8, 0, 0, 0, 0, 0, 0, 0, 0, 0],
							/*8*/	[0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,19, 7, 5, 0, 0, 0, 8, 0, 0, 0, 0, 0, 8, 0, 0, 0, 0, 0, 0, 0, 0, 8, 0, 0, 0, 0, 0, 0, 0, 0, 0],
							/*9*/	[0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2, 0, 0, 0, 0, 0, 8, 0, 0, 0, 0, 0, 8, 0, 0, 0, 0, 0, 0, 0, 0, 8, 0, 0, 0, 0, 0, 0, 0, 0, 0],
							/*10*/	[0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2, 0, 0, 0, 0, 0, 8, 0, 0, 0, 0, 0, 8, 0, 0, 6, 1, 3, 0, 0, 0, 8, 0, 0, 0, 0, 0, 0, 0, 0, 0], 
							/*11*/	[0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 4,20, 1, 1,24, 1,25, 1, 1, 1, 3, 0, 8, 0, 0, 2, 0, 4, 3, 0, 0, 8, 0, 0, 0, 0, 0, 0, 0, 0, 0], 
							/*12*/	[0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 8, 0, 0, 8, 0, 0, 0, 0, 0,19, 1, 5, 0, 0, 2, 0, 0, 2, 0, 6,25, 1,20, 1, 1,24, 1, 1, 1,99], 
							/*13*/	[0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 8, 0, 0, 8, 0, 0, 0, 0, 0, 2, 0, 0, 0, 0, 2, 0, 0, 2, 0, 2, 0, 0, 8, 0, 0, 8, 0, 0, 0, 0],
							/*14*/	[0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 6, 7, 7, 5, 0, 0, 8, 0, 0, 0, 0, 0, 4,20, 1, 1, 1,21,24, 1,25, 1, 5, 0, 0, 8, 0, 0, 8, 0, 0, 0, 0],
							/*15*/	[0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 8, 0, 0, 0, 0, 0, 8, 0, 0, 0, 0, 0, 0, 8, 0, 0, 0, 0, 8, 0, 0, 0, 0, 6, 7, 5, 0, 0, 8, 0, 0, 0, 0],
							/*16*/	[0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 8, 0, 0, 0, 0, 0, 8, 0, 0, 0, 0, 0, 0, 8, 0, 0, 0, 0, 8, 0, 0, 0, 0, 8, 0, 0, 0, 6, 5, 0, 0, 0, 0], 
							/*17*/	[0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 4, 7, 7, 7, 3, 0, 8, 0, 0, 0, 6, 7, 7, 5, 0, 0, 0, 0, 8, 0, 0, 0, 0, 8, 0, 0, 0, 8, 0, 0, 0, 0, 0], 
							/*18*/	[0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 8, 0, 8, 0, 0, 0, 8, 0, 0, 0, 0, 0, 0, 0, 4, 7, 3, 0, 0, 4, 7, 7, 7, 5, 0, 0, 0, 0, 0], 
							/*19*/	[0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 4, 7, 5, 0, 0, 0, 8, 0, 0, 0, 0, 0, 0, 0, 0, 0, 8, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
							/*20*/	[0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 8, 0, 0, 0, 0, 0, 0, 0, 6, 7, 5, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0], 
							/*21*/	[0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 8, 0, 0, 0, 0, 0, 0, 0, 8, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0], 
							/*22*/	[0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 4, 7, 7, 3, 0, 0, 0, 0, 8, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0], 
							/*23*/	[0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 8, 0, 0, 0, 0, 8, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0], 
							/*24*/	[0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 4, 7, 7, 7, 7, 5, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0], 
							/*25*/	[0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
							/*26*/	[0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
							/*27*/	[0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
							/*28*/	[0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]
																																				];
		
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
		
		private var cellWidth:Number;
		private var cellHeight:Number;
		private var numColumns:Number = 43;
		private var numRows:Number = 28;
		
		private var newTile;
		
		public function createGrid(cellWidth:Number, cellHeight:Number):void 
		{
			this.cellWidth = cellWidth + 1;
			this.cellHeight = cellHeight + 1;
			 for (row = 0; row < numRows; row++){
				for (col = 0; col < numColumns; col++){
					if (tileGrid[row][col] == 0){
						// coming
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
							gridBlue(0);
					} else if (tileGrid[row][col] == -2) {
							gridBlue(90);
					} else if (tileGrid[row][col] == -3) {
							gridBlueCorner(90);
					} else if (tileGrid[row][col] == -4) {
							gridBlueCorner(270);
					} else if (tileGrid[row][col] == -5) {
							gridBlueCorner(180);
					} else if (tileGrid[row][col] == -6) {
							gridBlueCorner(0);
					} else if (tileGrid[row][col] == -7) {
							gridBlue(90);
					} else if (tileGrid[row][col] == -8) {
							gridBlue(90);
					} else if (tileGrid[row][col] == -9) {
							gridBlue(0);
					} else if (tileGrid[row][col] == -10) {
							gridBlue(0);
					} else if (tileGrid[row][col] == -30) {
							gridBlue(90);
					} else if (tileGrid[row][col] == 18) {
						grid3Corn(270);
					}  else if (tileGrid[row][col] == 19) {
						grid3Corn(90);
					} else if (tileGrid[row][col] == 20) {
						grid3Corn(180);
					} else if (tileGrid[row][col] == 21) {
						grid3Corn(0);
					} 	else if (tileGrid[row][col] == 22) {
							grid3Corn(270)
						} else if (tileGrid[row][col] == 23) {
							grid3Corn(90);
						} else if (tileGrid[row][col] == 24) {
							grid3Corn(180);
						} else if (tileGrid[row][col] == 25) {
							grid3Corn(0);
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
		
		public function grid3Corn(rot:int):void 
		{
			_grid3Corn = new Grid3Corn();
			tileTexture[row][col] = _grid3Corn;
			addChild(_grid3Corn);
			_grid3Corn.x = col * cellWidth  + 34;
			_grid3Corn.y = row * cellHeight + 34;
			_grid3Corn.width = cellWidth;
			_grid3Corn.height = cellHeight;
			
			_grid3Corn.rotation = rot;
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
		
		public function changeTileCorner(rot:int, rowNr:int, colNr:int):void 
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
			
		}
		public function changeTile(rot:int, rowNr:int, colNr:int):void 
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
			
		}
		public function changeTileMultie(rowNr:int, colNr:int):void 
		{
			removeChild(tileTexture[rowNr][colNr]);
			newTile = new GridCorners();
			tileTexture[rowNr][colNr] = newTile;
			addChild(newTile);
			newTile.x = colNr * cellWidth  + 34;
			newTile.y = rowNr * cellHeight + 34;
			newTile.width = cellWidth;
			newTile.height = cellHeight;
		}
	}

}