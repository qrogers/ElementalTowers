package  {
	
	import flash.events.*;
	import flash.geom.*;
	
	public class CursorTower extends Tower {
		
		public function CursorTower(typ:int) {
			super(typ);
			addEventListener(Event.ENTER_FRAME, eFrame);
			txt = "";
			stats = [[25, 0, 0, 100, 1, 1.5, 10],//dmg, slow, psn, rng, amp, atkSpeed, bulletSpd
					[40, 0, 0, 110, 1, 1.4, 12],
					[60, 0, 0, 120, 1, 1.3, 14],
					[85, 0, 0, 130, 1, 1.2, 16],
					[105, 0, 0, 140, 1, 1.1, 18],
					[155, 0, 1, 170, 1.1, .8, 20]];
		}
		
		private function eFrame(e:Event):void {
			x = stage.mouseX;
			y = stage.mouseY;
			rotationZ += level + 2;
		}
		
		override public function levelUp():void {
			level++;
			gotoAndStop(ele + (5 * level));
		}

	}
	
}
