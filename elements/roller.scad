include <../parameters.scad>;

module roller() {
   difference() {
      cylinder(RollerThickness, RollerOD/2, RollerOD/2, $fn = RollerSmooth);
      translate([0, 0, -Overlap]) cylinder(RollerThickness + (Overlap * 2), RollerBolt/2, RollerBolt/2, $fn = RollerSmooth);
      translate([0, 0, RollerThickness - RollerBoltCountersinkDepth]) cylinder(RollerBoltCountersinkDepth + Overlap, RollerBolt/2, RollerBoltCountersinkEndDiameter/2, $fn = RollerSmooth);
   }
}
