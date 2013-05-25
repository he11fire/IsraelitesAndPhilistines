package 
{
	import flash.display.Sprite;
	import flash.events.Event;
	import net.flashpunk.Engine;
	import net.flashpunk.FP;
	
	/**
	 * ...
	 * @author LL
	 */
	[SWF(width=500, height=400)]
	public class Main extends Engine 
	{
		
		public function Main():void 
		{
			super(500, 400);
			
			FP.console.enable();
			
			FP.world = new MeineWorld;
		}
		
	}
	
}