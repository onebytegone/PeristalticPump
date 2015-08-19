include <../parameters.scad>;

module propeller() {
   difference() {
      union() {
         armSet();
         rotate([0,0,90]) armSet();
      }
      translate([0, 0, -Overlap]) cylinder(PropellerThickness + (Overlap * 2), AxelDiameter/2, AxelDiameter/2);
   }
}

module armSet() {
   assign(length = PropellerLength - PropellerWidth) {
      translate([-length/2, -PropellerWidth/2]) cube([length, PropellerWidth, PropellerThickness]);

      translate([length/2, 0]) cylinder(PropellerThickness, PropellerWidth/2, PropellerWidth/2);
      translate([-length/2, 0]) cylinder(PropellerThickness, PropellerWidth/2, PropellerWidth/2);
   }
}
