package  {
	
	public class WaterTower extends Tower {

		//override public const txt:String = "Water Tower";

		public function WaterTower(typ:int) {
			super(typ);
			txt = "Water Tower";
			stats = [[75, 1, 0, 90, 1, 2.3, 14],//dmg, slow, psn, rng, amp, atkSpeed, bulletSpd
					[80, 1.5, 0, 95, 1, 2.2, 14],
					[85, 2.5, 0, 100, 1, 2.1, 14],
					[90, 4, 0, 105, 1, 2.0, 14],
					[95, 6, 0, 110, 1, 1.9, 14],
					[105, 8.5, 0, 125, 1, 1.7, 17]];
		}

	}
	
}
