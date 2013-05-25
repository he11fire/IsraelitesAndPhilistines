package  
{
	import net.flashpunk.Entity;
	import net.flashpunk.FP;
	import net.flashpunk.graphics.Spritemap;
	
	/**
	 * ...
	 * @author ll
	 */
	public class Enemy extends Entity 
	{
		[Embed(source = "../lib/swordguy.png")]
		private const THESWGUY:Class;
		
		public var theSwordGuy:Spritemap;
		
		public function Enemy() 
		{
			theSwordGuy = new Spritemap(THESWGUY, 48, 32);
			theSwordGuy.add("stand", [0, 1, 2, 3, 4, 5], 20, true);
			theSwordGuy.add("run", [6, 7, 8, 9, 10, 11], 20, true);
			
			graphic = theSwordGuy;
			
			x = FP.rand(FP.screen.width);
			y = FP.rand(FP.screen.height);
			
			setHitbox(48, 32);
			type = "enemy";
			
			theSwordGuy.play("stand");
		}
		
	}

}