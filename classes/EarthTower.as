package  {
	
	public class EarthTower extends Tower {
		
		public function EarthTower(typ:int) {
			super(typ);
			txt = "Earth Tower";
			stats = [[80, 0, 0, 90, 1.1, 2.5, 13],//dmg, slow, psn, rng, amp, atkSpeed, bulletSpd
					[90, 0, 0, 95, 1.2, 2.4, 13],
					[100, 0, 0, 100, 1.4, 2.3, 13],
					[110, 0, 0, 105, 1.7, 2.2, 13],
					[120, 0, 0, 110, 2.1, 2.1, 13],
					[130, 0, 0, 125, 2.6, 1.9, 15]];
		}

	}
	
}
