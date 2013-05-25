package  
{
	import flash.geom.Point;
	import net.flashpunk.Entity;
	import net.flashpunk.graphics.Image;
	import net.flashpunk.Sfx;
	import net.flashpunk.utils.Input;
	import net.flashpunk.utils.Key;
	import net.flashpunk.FP;
	
	/**
	 * ...
	 * @author ll
	 */
	public class Player extends Entity 
	{
		[Embed(source = "../lib/player.png")]
		private const PLAYER:Class
		
		[Embed(source = "../lib/shoot.mp3")]
		private const SHOOT:Class;
		
		public var image:Image;
		
		public function Player(pt:Point) 
		{
			image = new Image(PLAYER);
			graphic = image;
			
			setHitbox(25, 15, 0, 0);
			type = "player";
			
			x = pt.x;
			y = pt.y;
		}
		
		override public function update():void 
		{
			
			updateMovement();
			updateCollision();
			
			super.update();
		}
		
		private var mVelocity:Point = new Point();
		
		private function updateMovement():void
		{
			var movement:Point = new Point;
			
			if (Input.check(Key.RIGHT)) movement.x++;
			if (Input.check(Key.LEFT)) movement.x--;
			if (Input.check(Key.DOWN)) movement.y++;
			if (Input.check(Key.UP)) movement.y--;
			
			mVelocity.x = 100 * FP.elapsed * movement.x;
			mVelocity.y = 100 * FP.elapsed * movement.y;
		}
		
		private function updateCollision():void
		{
			x += mVelocity.x;
			
			if (collide("level", x, y))
			{
				trace("Collision");
				
				if (FP.sign(mVelocity.x) > 0)
				{
					//moving right
					//llogarit qelizen ku ndodhet me floor dhe /32
					// shto 32 per ta cu fiks ne fillim te qelizes djathtas.
					// hiq gjeresine qe te jete fiks ne piken e perplasjes.
					mVelocity.x = 0;
					x = Math.floor( x / 32 ) * 32 + 32 - width;
				}
				else
				{
					//left
					mVelocity.x = 0;
					x = Math.floor( x / 32 ) * 32 + 32;
				}
			}
			
			y += mVelocity.y;
			
			if (collide("level", x, y))
			{
				trace("Collision");
				
				if (FP.sign(mVelocity.y) > 0)
				{
					//moving right
					mVelocity.y = 0;
					y = Math.floor( y / 32 ) * 32 + 32 - height;
				}
				else
				{
					//left
					mVelocity.y = 0;
					y = Math.floor( y / 32 ) * 32 + 32;
				}
			}
			
			if (collide("enemy", x, y))
			{
				image.color = 0xff0000;
				if (mCanShoot) {
					mCanShoot = false;
					shoot.play();
				}
			}
			else {
				mCanShoot = true;
				image.color = 0xffffff;
			}
		}
		
		private var mCanShoot:Boolean = true;
		public var shoot:Sfx = new Sfx( SHOOT );
		
	}

}