package  {
	
	import flash.display.*;
	import flash.events.*;
	import flash.geom.ColorTransform;
	
	public class Tower extends MovieClip {
		
		private var attacking:Boolean;
		private var attack:int;
		private var slow:int;
		private var attackSpeed:int;
		private var attackTimer:int;
		private var exp:int;
		
		public var rank:int;
		
		public var stats:Array;
		
		public var level:int;
		public var ele:int;
		
		public var txt:String = "";
		
		private var target:Creep;
		
		public function Tower(typ:int) {
			stats = new Array();
			addEventListener(Event.ENTER_FRAME, eFrame);
			addEventListener(MouseEvent.MOUSE_UP, clicked);
			ele = typ;
			gotoAndStop(ele);
			attacking = false;
			target = null;
			attackTimer = 0;
			level = 0;
			exp = 0;
			rank = 0;
		}
		
		public function attackTarget(c:Creep):void {
			target = c;
			attacking = true
			target.addEventListener("death", targetDeath);
		}
		
		private function targetDeath(e:Event):void {
			attacking = false;
			target = null;
			exp += 10;
			rankUpCheck();
		}
		
		private function eFrame(e:Event):void {
			attackTimer++;
			if(x < 600 && y < 460){
				if(attacking && (attackTimer >= stats[level][5] - (rank / 100))){
					if(Validator.getDistance(this, target) < getRange()){
						rotation = (Math.atan2(target.y - y, target.x - x) / Math.PI * 180) - 90;
						attackTimer = 0;
						var newBullet = new Bullet(ele, stats[level][6], stats[level][6], stats[level][0] + rank, stats[level][1], stats[level][2], stats[level][4], target, ele);//zspd, yspd, dmg, slow, psn, amp, target
						newBullet.x = x;
						newBullet.y = y;
						parent.addChildAt(newBullet, 0);
					} else {
						attacking = false;
						target = null;
					}
				}
			}
		}
		
		private function rankUpCheck():void {
			if(exp >= (rank * 30) + 100){
				rank += 1;
				exp = 0;
			}
		}
		
		public function levelUp():void {
			level++;
			gotoAndStop(ele + (5 * level));
			dispatchEvent(new Event("clicked"));
		}
		
		private function clicked(m:MouseEvent):void {
			dispatchEvent(new Event("clicked"));
		}
		
		public function getRange():int {
			return(stats[level][3] + rank);
		}
		
		public function sold():void {
			removeEventListener(Event.ENTER_FRAME, eFrame);
			removeEventListener(MouseEvent.MOUSE_UP, clicked);
		}
	}
	
}