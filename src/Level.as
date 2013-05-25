package  
{
	import flash.utils.ByteArray;
	import net.flashpunk.Entity;
	import net.flashpunk.graphics.Tilemap;
	import net.flashpunk.masks.Grid;
	
	/**
	 * ...
	 * @author ll
	 */
	public class Level extends Entity 
	{
		[Embed(source = "../lib/tiles.png")]
		private const TILES:Class
		
		private var mTiles:Tilemap;
		private var mGrid:Grid;
		
		public var xmlData:XML;
		
		public function Level(xml:Class) 
		{
			
			mTiles = new Tilemap(TILES, 500, 400, 32, 32);
			graphic = mTiles;
			
			//render layer.
			layer = 1;
			
			mGrid = new Grid(500, 400, 32, 32, 0, 0);
			mask = mGrid;
			
			type = "level";
			
			loadLevel(xml);
		}
		
		private function loadLevel(xml:Class):void
		{
			var rawData:ByteArray = new xml;
			var dataStream:String = rawData.readUTFBytes(rawData.length);
			xmlData = new XML(dataStream);
			
			var dataList:XMLList = xmlData.OurTiles.tile;
			var dataElement:XML;
			
			for each( dataElement in dataList )
			{
				mTiles.setTile(int(dataElement.@x) / 32, int(dataElement.@y) / 32, int(dataElement.@ty) / 32);
				mGrid.setTile(int(dataElement.@x) / 32, int(dataElement.@y) / 32, int(dataElement.@ty) / 32 == 0);
			}
		}
		
	}

}