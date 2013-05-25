package  
{
	import flash.geom.Point;
	import net.flashpunk.FP;
	import net.flashpunk.Sfx;
	import net.flashpunk.World;
	
	/**
	 * ...
	 * @author ll
	 */
	public class MeineWorld extends World 
	{
		[Embed(source = "lvl1.oel", mimeType = "application/octet-stream")]
		private const LVL1:Class;
		
		[Embed(source = "../lib/vez.mp3")]
		private const VEZ:Class;
		
		public function MeineWorld() 
		{
			var level:Level = Level( add( new Level(LVL1) ) );
			
			add( new Player(new Point( 0, 32 )));
			
			for (var i:int = 0; i < 5; i++)
				add( new Enemy );
			
			var bgMusic:Sfx = new Sfx(VEZ);
			bgMusic.loop(.4);
			
			super.begin();
		}
		
	}

}