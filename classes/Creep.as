package  {
	
	import flash.display.MovieClip;
	import flash.events.*;
	import flash.geom.*;
	
	public class Creep extends MovieClip {
		
		private const DISTANCE:int = 5;
		
		private var xSpeed:Number;
		private var ySpeed:Number;
		private var xSpeedMax:int;
		private var ySpeedMax:int;
		private var xThere:Boolean;
		private var yThere:Boolean;
		private var track:Array;
		private var trackGuideNumber:int;
		private var maxHealth:Number;
		private var health:Number;
		private var poison:Number;
		private var poisonCounter:int;
		private var amplification:Number;
		private var ampCounter:int;
		private var slowCounter:int;
		private var moveTarget:Object;
		private var colorTransform:ColorTransform;
		private var color:ColorTransform;
		private var poisonStack:int;
		
		public function Creep(xs:int, ys:int, trk:Array, hp:Number, clr:ColorTransform){
			addEventListener(Event.ENTER_FRAME, eFrame);
			psnFilter.visible = false;
			slwFilter.visible = false;
			color = clr;
			xSpeedMax = xs;
			ySpeedMax = ys;
			xSpeed = xSpeedMax;
			ySpeed = ySpeedMax;
			xThere = false;
			yThere = false;
			maxHealth = hp;
			poison = 0;
			amplification = 1;
			health = maxHealth;
			track = trk;
			trackGuideNumber = 0;
			poisonCounter = 0;
			slowCounter = 0;
			ampCounter = 0;
			poisonStack = 0;
			moveTarget = track[trackGuideNumber];
		}
		
		public function takeDamage(dmg:int, slow:Number, psn:Number, amp:Number, splash:Boolean=false):void {
			if(splash){
				var p:CreepHandler = parent as CreepHandler;
				p.splash(this, dmg/5);
			}

			if(amp > amplification){
				amplification = amp;
				ampCounter = 60;
			} else if(amp > 1){
				ampCounter += 24;
				amplification += amp / 50;
				health -= amplification * amplification * 3;
			}
			health -= (dmg * amplification);
			if(psn >= poison && psn > 0){
				poison += psn - .5;
				poisonCounter += 48;
				//psnFilter.visible = true;
			}
			
			if((xSpeedMax - slow) < xSpeed){
				xSpeed = xSpeedMax - slow;
				//slowCounter = 120;
				if(xSpeed < 1){
					xSpeed = 1;
				}
				//slwFilter.visible = true;
			} else if(slow > 0){
				//slowCounter += 12;
				xSpeed -= slow / 20;
				ySpeed -= slow / 20;
				health -= dmg / (8 - slow);
				if(xSpeed < 1){
					xSpeed = 1;
					ySpeed = 1;
				}
			}
			
			if(slow > 0){
				slowCounter = 180;
			}
			if((ySpeedMax - slow) < ySpeed){
				ySpeed = ySpeedMax - slow;
				if(ySpeed < 1){
					ySpeed = 1;
				}
				//slowCounter = 120;
			} else if(slow > 0){
				//slowCounter += 12;
				xSpeed -= slow / 20;
				ySpeed -= slow / 20;
				health -= slow * 3;
				if(xSpeed < 1){
					xSpeed = 1;
					ySpeed = 1;
				}
			}
			
			if(health < 0){
				health = 0;
			}
		}
		
		private function deathCheck():void {
			if(health <= 0){
				death();
			}
		}
		
		private function death():void {
			var i:int = 5;
			while (i > 0) {
				var newPlode:Plode = new Plode(x, y, 20, color);
				stage.addChild(newPlode);
				i--;
			}
			dispatchEvent(new Event("death"));
			removeEventListener(Event.ENTER_FRAME, eFrame);
		}
		
		private function eFrame(e:Event):void {
			counterTick();
			bodyOf.rotationZ += xSpeed;
			edgeOf.rotationZ += xSpeed;
			psnFilter.rotationZ += xSpeed;
			slwFilter.rotationZ += xSpeed;
			health -= (poison * amplification);
			if(Validator.getDistance(this, moveTarget) > DISTANCE){
				if(x + DISTANCE < moveTarget.x){
					x += xSpeed;
				} else if(x - DISTANCE > moveTarget.x){
					x -= xSpeed;
				}
				if(y + DISTANCE < moveTarget.y){
					y += ySpeed;
				} else if(y - DISTANCE > moveTarget.y){
					y -= ySpeed;
				}
			} else {
				if(trackGuideNumber < track.length - 1){
					x = moveTarget.x;
					y = moveTarget.y;
					trackGuideNumber++;
					moveTarget = track[trackGuideNumber];
				} else {
					dispatchEvent(new Event("finish"));
					removeEventListener(Event.ENTER_FRAME, eFrame);
				}
			}
			healthBar.bar.width = (health / maxHealth) * 37;
			if(health / maxHealth < .6){
				if(health / maxHealth > .25) {
					colorTransform = new ColorTransform();
					colorTransform.color = 0xFFFF00;
					healthBar.bar.transform.colorTransform = colorTransform;
				} else {
					colorTransform = new ColorTransform();
					colorTransform.color = 0xFF0000;
					healthBar.bar.transform.colorTransform = colorTransform;
				}
			} else {
				colorTransform = new ColorTransform();
				colorTransform.color = 0x00FF00;
				healthBar.bar.transform.colorTransform = colorTransform;
			}
			deathCheck();
		}
		
		private function counterTick():void {
			if(poisonCounter > 0){
				poisonCounter--;
				if(poisonCounter <= 0){
					poison = 0;
					psnFilter.visible = false;
				}
			}
			if(slowCounter > 0){
				slowCounter--;
				if(slowCounter <= 0){
					xSpeed = xSpeedMax;
					ySpeed = ySpeedMax;
					slwFilter.visible = false;
				}
			}
			if(ampCounter > 0){
				ampCounter--;
				if(ampCounter <= 0){
					amplification = 1;
				}
			}
		}

	}
	
}