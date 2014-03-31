package  {
	import flash.display.DisplayObject;
	
	public class Validator {

		public function Validator() {
			// constructor code
		}
		
		static function getDistance(obj1:Object, obj2:Object):Number {
			return(Math.sqrt(Math.pow(obj1.x - obj2.x, 2) + Math.pow(obj1.y - obj2.y, 2)));
		}
		
		static function hitTester(obj1:DisplayObject, obj2:DisplayObject):Boolean {
			return(PixelPerfectCollisionDetection.isColliding(obj1, obj2, obj1.parent, true));
		}
		
	}
	
}
