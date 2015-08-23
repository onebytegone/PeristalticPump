include <../parameters.scad>;

module propeller() {
   difference() {
      union() {
         translate([-PropellerWidth / 2, -PropellerWidth / 2]) cube([PropellerWidth, PropellerWidth, PropellerCenterThickness]);
         armSet();
         rotate([0,0,90]) armSet();
      }
      translate([0, 0, -Overlap]) cylinder(PropellerCenterThickness + (Overlap * 2), AxelDiameter/2, AxelDiameter/2, $fn = PropellerSmooth);
   }
}

module propeller_retainer() {
   difference() {
      union() {
         armSetCountersunk(PropellerSupport);
         rotate([0,0,90]) armSetCountersunk(PropellerSupport);
      }
      translate([0, 0, -Overlap]) cylinder(PropellerSupport + (Overlap * 2), AxelDiameter/2, AxelDiameter/2, $fn = PropellerSmooth);
   }
}

module armSet(thickness = PropellerBacking) {
   assign(length = PropellerRollerDistance) {
      difference () {
         union() {
            translate([-length/2, -PropellerWidth/2]) cube([length, PropellerWidth, thickness]);
            translate([length/2, 0]) cylinder(thickness, PropellerWidth/2, PropellerWidth/2, $fn = PropellerSmooth);
            translate([-length/2, 0]) cylinder(thickness, PropellerWidth/2, PropellerWidth/2, $fn = PropellerSmooth);
         }

         translate([length/2, 0, -Overlap]) cylinder(thickness + (Overlap * 2), RollerBolt/2, RollerBolt/2, $fn = PropellerSmooth);
         translate([-length/2, 0, -Overlap]) cylinder(thickness + (Overlap * 2), RollerBolt/2, RollerBolt/2, $fn = PropellerSmooth);
      }
   }
}

module armSetCountersunk(thickness) {
   assign(length = PropellerRollerDistance) {
      difference () {
         armSet(thickness);

         translate([length/2, 0, -Overlap]) cylinder(RollerBoltCountersinkDepth + Overlap, RollerBoltCountersinkEndDiameter/2, RollerBolt/2, $fn = PropellerSmooth);
         translate([-length/2, 0, -Overlap]) cylinder(RollerBoltCountersinkDepth + Overlap, RollerBoltCountersinkEndDiameter/2, RollerBolt/2, $fn = PropellerSmooth);
      }
   }
}
