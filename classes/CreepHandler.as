package  {
	
	import flash.display.*;
	import flash.events.*;
	import flash.utils.*;
	import flash.geom.ColorTransform;
	
	public class CreepHandler extends MovieClip {

		private var creepHolder:Array;
		private var towerHolder:Array;
		private var track:Array;
		
		private var waves:Array;
		private var wave:int;
		
		private var creepNumber:int;
		private var creepTimer:int;
		private var creepsInWave:int;
		
		private var i:int;
		
		public function CreepHandler(trk:Array){
			waves = new Array();
			waves = 	 [[10, 250, 5, 6, 1, 0, 0],//#, hp, speed, interval, bounty, frame
					/*2*/ [10, 300, 5, 5, 1.5, 0, 0],
					/*3*/ [15, 250, 8, 5, .66, 0, 0],
					/*4*/ [25, 450, 4, 4, .6, 0, 0],
					/*5*/ [15, 550, 5, 5, 1, 0, 0],
					/*6*/ [30, 700, 6, 7, .5, 0, 0],
					/*7*/ [30, 600, 7, 5, .66, 0, 0],
					/*8*/ [35, 750, 2, 3, .57, 0, 0],
					/*9*/ [30, 600, 9, 5, .5, 0, 0],
					/*10*/ [1, 45000, 3, 0, 50, 0, 0],
					/*11*/ [40, 700, 5, 6, .39, 0, 0],
					/*12*/ [40, 200, 5, 1, .25, 0, 0],
					/*13*/ [10, 2500, 6, 7, 2, 0, 0],
					/*14*/ [50, 2350, 4, 8, .5, 0, 0],
					/*15*/ [50, 1200, 5, 6, .31, 0, 0],
					/*16*/ [40, 1050, 6, 5, .51, 0, 0],
					/*17*/ [5, 17000, 2, 10, 2, 0, 0],
					/*18*/ [60, 1650, 7, 8, .25, 0, 0],
					/*19*/ [100, 100, 8, 1, .26, 0, 0],
					/*20*/ [1, 190000, 3, 0, 100, 0, 0],
					/*21*/ [120, 600, 5, 2, .19, 0, 0],
					/*22*/ [70, 2300, 4, 6, .24, 0, 0],
					/*23*/ [10, 4150, 6, 3, 1.6, 0, 0],
					/*24*/ [30, 2900, 5, 4, .6, 0, 0],
					/*25*/ [30, 2500, 7, 3, .66, 0, 0],
					/*26*/ [45, 1100, 8, 2, .44, 0, 0],
					/*27*/ [60, 350, 9, 1, .25, 0, 0],
					/*28*/ [5, 33000, 3, 20, 3, 0, 0],
					/*29*/ [45, 4250, 6, 5, .55, 0, 0],
					/*30*/ [1, 700000, 5, 0, 100, 0, 0],
					/*31*/ [500, 500, 2, 0, .2, 0, 0],
					/*32*/ [250, 200, 4, 1, .2, 0, 0],
					/*33*/ [30, 8700, 7, 6, .66, 0, 0],
					/*34*/ [40, 5000, 6, 3, .5, 0, 0],
					/*35*/ [25, 15000, 2, 3, .6, 0, 0],
					/*36*/ [25, 17000, 2, 7, .7, 0, 0],
					/*37*/ [60, 8000, 5, 5, .42, 0, 0],
					/*38*/ [65, 20000, 1, 5, .41, 0, 0],
					/*39*/ [70, 7000, 7, 5, .71, 0, 0],
					/*40*/ [1, 900000, 5, 0, 200, 0, 0],
					/*41*/ [100, 9000, 4, 6, .5, 0, 0],
					/*42*/ [25, 17000, 5, 4, .6, 0, 0],
					/*43*/ [40, 18550, 7, 10, .63, 0, 0],
					/*44*/ [60, 10000, 3, 4, .42, 0, 0],
					/*45*/ [10, 27000, 6, 5, 1, 0, 0],
					/*46*/ [50, 8000, 5, 2, .4, 0, 0],
					/*47*/ [70, 6000, 8, 3, .36, 0, 0],
					/*48*/ [500, 400, 7, 0, .2, 0, 0],
					/*49*/ [35, 19000, 3, 2, .57, 0, 0],
					/*50*/ [1, 2000000, 4, 0, 200, 0, 0],
					/*51*/ [40, 21000, 4, 3, .75, 0, 0],
					/*52*/ [45, 24000, 3, 4, .66, 0, 0],
					/*53*/ [30, 25000, 5, 5, .83, 0, 0],
					/*54*/ [200, 11000, 2, 3, .25, 0, 0],
					/*55*/ [15, 30000, 5, 4, 1.2, 0, 0],
					/*56*/ [80, 23000, 6, 8, .51, 0, 0],
					/*57*/ [25, 8000, 5, 1, 1, 0, 0],
					/*58*/ [60, 8000, 7, 2, .34, 0, 0],
					/*59*/ [50, 25000, 4, 5, .52, 0, 0],
					/*60*/ [1, 3500000, 3, 2, 250, 0, 0],
					/*61*/ [85, 18000, 4, 4, .35, 0, 0],
					/*62*/ [90, 20000, 5, 5, .5, 0, 0],
					/*63*/ [35, 27000, 6, 6, .72, 0, 0],
					/*64*/ [65, 28000, 7, 7, .61, 0, 0],
					/*65*/ [25, 30000, 3, 3, 1, 0, 0],
					/*66*/ [45, 30000, 2, 2, .56, 0, 0],
					/*67*/ [50, 30000, 6, 6, .51, 0, 0],
					/*68*/ [70, 29000, 4, 4, .51, 0, 0],
					/*69*/ [30, 34000, 5, 5, .52, 0, 0],
					/*70*/ [1, 4000000, 5, 0, 300, 0, 0],
					/*71*/ [250, 500, 10, 0, .04, 0, 0],
					/*72*/ [35, 28000, 5, 2, .71, 0, 0],
					/*73*/ [50, 24000, 6, 4, .5, 0, 0],
					/*74*/ [65, 37000, 3, 5, .46, 0, 0],
					/*75*/ [100, 2000, 7, 1, .49, 0, 0],
					/*76*/ [15, 68000, 2, 10, 1.5, 0, 0],
					/*77*/ [45, 36000, 4, 3, .56, 0, 0],
					/*78*/ [35, 33000, 5, 6, .86, 0, 0],
					/*79*/ [100, 40000, 8, 6, 1, 0, 0],
					/*80*/ [1, 8500000, 5, 0, 350, 0, 0],
					/*81*/ [10, 35000, 9, 9, 2.5, 0, 0],
					/*82*/ [20, 35000, 8, 8, 1.5, 0, 0],
					/*83*/ [30, 40000, 7, 7, 1, 0, 0],
					/*84*/ [40, 42000, 6, 6, 1, 0, 0],
					/*85*/ [50, 41000, 5, 5, .5, 0, 0],
					/*86*/ [60, 38000, 4, 4, .5, 0, 0],
					/*87*/ [70, 36000, 3, 3, .5, 0, 0],
					/*88*/ [80, 40000, 2, 2, .5, 0, 0],
					/*89*/ [90, 50000, 1, 1, .4, 0, 0],
					/*90*/ [1, 14000000, 4, 0, 400, 0, 0],
					/*91*/ [50, 100000, 5, 20, 1, 0, 0],
					/*92*/ [100, 27000, 8, 4, .5, 0, 0],
					/*93*/ [150, 20000, 6, 7, .5, 0, 0],
					/*94*/ [45, 140000, 3, 8, .75, 0, 0],
					/*95*/ [75, 50000, 7, 10, .52, 0, 0],
					/*96*/ [100, 40000, 5, 5, .5, 0, 0],
					/*97*/ [55, 80000, 4, 4, .83, 0, 0],
					/*98*/ [15, 50000, 7, 3, 2, 0, 0],
					/*99*/ [35, 200000, 4, 10, 1, 0, 0],
					/*100*/ [1, 100000000, 1, 0, 100000000, 0, 0]];

			track = trk;
			creepHolder = new Array();
			towerHolder = Core.towerHandler.getTowerHolder();
			i = 0;
			creepTimer = 0;
			wave = 0;
			creepsInWave = waves[wave][0];
			Core.creepPanel.setText("Wave: " + (wave + 1) + "\nCreeps: " + waves[wave][0] + "\nHealth: " + waves[wave][1]);
			
			for(var i:int = 0; i < waves.length; i++){
				waves[i][5] = Math.floor((Math.random() * 20)) + 1;
			}
			for(i = 0; i < waves.length; i++){
				waves[i][6] = Math.floor((Math.random() * 4)) + 1;
			}
			
			//gameStart();
		}
		
		public function getMoneyAtStart():Number {
			var m:int = 0;
			for(var i:int = 0; i < wave; i++){
				m += (waves[i][4] * waves[i][0]);
			}
			return m;
		}
		
		public function gameStart():void {
			addEventListener(Event.ENTER_FRAME, eFrame);
		}
		
		public function gameOver():void {
			removeEventListener(Event.ENTER_FRAME, eFrame);
		}
		
		public function newGame():void {
			addEventListener(Event.ENTER_FRAME, eFrame);
			wave = -1;
		}
		
		private function eFrame(e:Event):void {
			if(i < waves[wave][0]){
				creepTimer++;
				if(creepTimer >= waves[wave][3]){
					spawn(track[0].x, track[0].y, waves[wave][2], waves[wave][2], track, waves[wave][1], waves[wave][5], waves[wave][6]);
					creepTimer = 0;
					i++;
				}
			} else {
				if(creepsInWave <= 0){
					wave++;
					dispatchEvent(new Event("nextWave"));
					if(wave >= waves.length){
						dispatchEvent(new Event("win"));
						gameOver();
					} else {
						i = 0;
						creepTimer = 0;
						creepsInWave = waves[wave][0];
						Core.creepPanel.setText("Wave: " + (wave + 1) + "\nCreeps: " + waves[wave][0] + "\nHealth: " + waves[wave][1]);
					}
				}
			}
		}
		
		private function spawn(xl:int, yl:int, xs:int, ys:int, trk:Array, hp:int, clr:int, frm:int):void {
			var newCreep:Creep = new Creep(xs, ys, trk, hp, ColorHolder.getColor(clr, 0));
			newCreep.x = xl;
			newCreep.y = yl;
			newCreep.bodyOf.gotoAndStop(frm);
			newCreep.edgeOf.gotoAndStop(frm);
			newCreep.psnFilter.gotoAndStop(frm);
			newCreep.slwFilter.gotoAndStop(frm);
			creepHolder.push(newCreep);
			Core.towerHandler.updateCreepHolder(creepHolder);
			newCreep.addEventListener("death", creepDeath);
			newCreep.addEventListener("finish", creepFinish);
			newCreep.addEventListener("splash", splash);
			newCreep.bodyOf.transform.colorTransform = ColorHolder.getColor(clr, 0);
			newCreep.edgeOf.transform.colorTransform = ColorHolder.getColor(3, 1);
			
			addChildAt(newCreep, 0);
		}
		
		/*private function getColor(frm:int, branch:int):ColorTransform {
			var colorT = new ColorTransform();
			
			if(branch == 0){//body
				switch (frm) {
					case 1 :
						colorT.color = 0xFF0000;
						break;
					case 2 :
						colorT.color = 0x0000CC;
						break;
					case 3 :
						colorT.color = 0x000000;
						break;
					case 4 :
						colorT.color = 0x00CC00;
						break;
					case 5 :
						colorT.color = 0xFFFFFF;
						break;
					case 6 :
						colorT.color = 0xFF6600;
						break;
					case 7 :
						colorT.color = 0x660099;
						break;
					case 8 :
						colorT.color = 0x9999FF;
						break;
					case 9 :
						colorT.color = 0xFFFF00;
						break;
				}
				return(colorT);
			} else if(branch == 1){//edge
				switch (frm) {
					case 1 :
						colorT.color = 0xFF6600;
						break;
					case 2 :
						colorT.color = 0x33FFFF;
						break;
					case 3 :
						colorT.color = 0x330033;
						break;
					case 4 :
						colorT.color = 0x33FF66;
						break;
					case 5 :
						colorT.color = 0x000000;
						break;
					case 6 :
						colorT.color = 0xFFFF00;
						break;
					case 7 :
						colorT.color = 0xCC0099;
						break;
					case 8 :
						colorT.color = 0x000033;
						break;
					case 9 :
						colorT.color = 0x990000;
						break;
				}
				return(colorT);
			} else {
				return(null);
			}
		}*/
		
		private function creepDeath(e:Event):void {//Might not be fullly removed
			var creep:Creep = e.target as Creep;
			if(stage.contains(creep)){
				Core.infoPanel.setMoney(waves[wave][4]);
				removeChild(creep);
				creepHolder.splice(creepHolder.indexOf(creep), 1);
			}
			creepsInWave--;
		}
		
		private function creepFinish(e:Event):void {//Might not be fullly removed
			var creep:Creep = e.target as Creep;
			if(stage.contains(creep)){
				removeChild(creep);
				creepHolder.splice(creepHolder.indexOf(creep), 1);
			}
			creepsInWave--;
			dispatchEvent(new Event("creepFinish"));
		}
		
		public function splash(creep:Creep, dmg:int):void {
			for(var i:int = 0; i < creepHolder.length; i++){
				if(Validator.getDistance(creep, creepHolder[i]) < 75){
					creepHolder[i].takeDamage(dmg, 0, 0, 0, false);
				}
			}
		}
		
		public function getWave():int {
			return wave + 1;
		}

	}
	
}
