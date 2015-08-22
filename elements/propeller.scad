include <../parameters.scad>;

module propeller() {
   difference() {
      union() {
         cylinder(PropellerCenterThickness, PropellerWidth/2, PropellerWidth/2);
         armSet();
         rotate([0,0,90]) armSet();
      }
      translate([0, 0, -Overlap]) cylinder(PropellerCenterThickness + (Overlap * 2), AxelDiameter/2, AxelDiameter/2, $fn = PropellerSmooth);
   }
}

module armSet() {
   assign(length = PropellerRollerDistance) {
      difference () {
         union() {
            translate([-length/2, -PropellerWidth/2]) cube([length, PropellerWidth, PropellerBacking]);
            translate([length/2, 0]) cylinder(PropellerBacking, PropellerWidth/2, PropellerWidth/2, $fn = PropellerSmooth);
            translate([-length/2, 0]) cylinder(PropellerBacking, PropellerWidth/2, PropellerWidth/2, $fn = PropellerSmooth);
         }

         translate([length/2, 0, -Overlap]) cylinder(PropellerBacking + (Overlap * 2), RollerBolt/2, RollerBolt/2, $fn = PropellerSmooth);
         translate([-length/2, 0, -Overlap]) cylinder(PropellerBacking + (Overlap * 2), RollerBolt/2, RollerBolt/2, $fn = PropellerSmooth);
      }
   }
}
