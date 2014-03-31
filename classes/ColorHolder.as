package  {
	
	import flash.geom.ColorTransform;
	
	public class ColorHolder {

		public function ColorHolder() {
			
		}
		
		public static function getColor(frm:int, branch:int):ColorTransform {
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
						colorT.color = 0xCCFF00;
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
						colorT.color = 0x33CC99;
						break;
					case 10 :
						colorT.color = 0x993399;
						break;
					case 11 :
						colorT.color = 0x993300;
						break;
					case 12 :
						colorT.color = 0xFFFF33;
						break;
					case 13 :
						colorT.color = 0xCC0000;
						break;
					case 14 :
						colorT.color = 0x003300;
						break;
					case 15 :
						colorT.color = 0x00FFFF;
						break;
					case 16 :
						colorT.color = 0xFF0099;
						break;
					case 17 :
						colorT.color = 0xCCCCCC;
						break;
					case 18 :
						colorT.color = 0x0000FF;
						break;
					case 19 :
						colorT.color = 0x00FF00;
						break;
					case 20 :
						colorT.color = 0x3333FF;
						break;
					case 21 :
						colorT.color = 0x99CC66;
						break;
					case 22 :
						colorT.color = 0xCC9966;
						break;
					case 23 :
						colorT.color = 0x9900FF;
						break;
					case 24 :
						colorT.color = 0xFF3333;
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
						colorT.color = 0x000000;
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
					case 10 :
						colorT.color = 0x330000;
						break;
					case 11 :
						colorT.color = 0x996633;
						break;
					case 12 :
						colorT.color = 0xFFCC00;
						break;
					case 13 :
						colorT.color = 0x000000;
						break;
					case 14 :
						colorT.color = 0x339900;
						break;
					case 15 :
						colorT.color = 0x0099FF;
						break;
					case 16 :
						colorT.color = 0xCC00FF;
						break;
					case 17 :
						colorT.color = 0x0000FF;
						break;
					case 18 :
						colorT.color = 0xFF0000;
						break;
					case 19 :
						colorT.color = 0x333333;
						break;
					case 20 :
						colorT.color = 0xFFFFFF;
						break;
					case 21 :
						colorT.color = 0x6699CC;
						break;
					case 22 :
						colorT.color = 0x66CC33;
						break;
					case 23 :
						colorT.color = 0x330000;
						break;
					case 24 :
						colorT.color = 0x000000;
						break;
				}
				return(colorT);
			} else {
				return(null);
			}
		}

	}
	
}
