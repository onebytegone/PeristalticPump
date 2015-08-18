include <../parameters.scad>;

module outer_shell() {
   difference() {
      HalfCylinder(OuterWidth, ShellTotalThickness);
      translate([0, 0, ShellBaseThickness]) HalfCylinder(OuterHoseEdge, ShellLipHeight + Overlap);
   }
}

module HalfCylinder(size, thickness) {
   assign(halfWidth = size / 2)
   difference() {
      cylinder(thickness, size/2, size/2);
      assign(outerHalfWidth = halfWidth + Overlap) translate([-outerHalfWidth, -outerHalfWidth, -Overlap]) cube([
         outerHalfWidth * 2,
         outerHalfWidth,
         ShellTotalThickness + (Overlap * 2)
      ]);
   }
}
