package  {
	
	public class AirTower extends Tower {

		//override public const txt:String = "Air Tower";
		
		public function AirTower(typ:int) {
			super(typ);
			txt = "Wind Tower";
			stats = [[80, 0, 2, 95, 1, 2, 17],//dmg, slow, psn, rng, amp, atkSpeed, bulletSpd
					[90, 0, 4, 105, 1, 1.9, 17],
					[100, 0, 8, 115, 1, 1.8, 17],
					[110, 0, 14, 125, 1, 1.6, 17],
					[120, 0, 22, 135, 1, 1.5, 17],
					[130, 0, 32, 160, 1, 1.35, 19]];
		}
	}
}
