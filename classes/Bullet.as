package  {
	
	import flash.display.MovieClip;
	import flash.events.*;
	import flash.geom.*;
	
	public class Bullet extends MovieClip {
		
		private var xSpeed:int;
		private var ySpeed:int;
		private var xSpeedCur:int;
		private var ySpeedCur:int;
		private var ele:int;
		private var damage:int;
		private var slow:Number;
		private var poison:Number;
		private var amplification:Number;
		private var splash:Boolean;
		private var frame:int;
		private var target:Creep;
		
		public function Bullet(typ:int, xSpd:int, ySpd:int, dmg:int, slw:Number, psn:Number, amp:Number, trg:Creep, frm:int) {
			addEventListener(Event.ENTER_FRAME, eFrame);
			gotoAndStop(frm);
			frame = frm;
			xSpeed = xSpd;
			ySpeed = ySpd;
			damage = dmg;
			slow = slw;
			poison = psn;
			amplification = amp;
			target = trg;
			ele = typ;
			if(ele == 1){
				splash = true;
			}
		}
		
		private function eFrame(e:Event):void {
			if(target.root == null) {
				remove(false);
			} else {
				x += xSpeedCur;
				y += ySpeedCur;
				var point:Point = parent.localToGlobal(new Point(x, y));
				var yDist:Number = target.y - point.y;
				var xDist:Number = target.x - point.x;
				var angle:Number = Math.atan2(yDist, xDist);
				ySpeedCur = Math.sin(angle) * ySpeed;
				xSpeedCur = Math.cos(angle) * xSpeed;
				if (Math.sqrt(Math.pow(point.y - target.y, 2) + Math.pow(point.x - target.x, 2)) < 23) {
					target.takeDamage(damage, slow, poison, amplification, splash);
					remove(true);
				}
			}
		}
		
		private function remove(impact:Boolean):void {
			if(impact){
				var i:int = 5;
				while (i > 0) {
					var newPlode:Plode = new Plode(x, y, 5, new ColorTransform());
					stage.addChild(newPlode);
					i--;
				}
			}
			if(parent != null) {
				removeEventListener(Event.ENTER_FRAME, eFrame);
				parent.removeChild(this);
			}
		}
	}
	
}
