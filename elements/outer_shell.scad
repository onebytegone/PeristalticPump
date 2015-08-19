include <../parameters.scad>;

module outer_shell() {
   difference() {
      shellAssembly();
      translate([0, 0, -Overlap]) cylinder(ShellBaseThickness + (Overlap * 2), AxelDiameter/2, AxelDiameter/2);
   }
}

module shellAssembly() {
   difference() {
      HalfCylinder(OuterWidth, ShellTotalThickness);
      translate([0, 0, ShellBaseThickness]) assign(cutoutThickness = ShellLipHeight + Overlap) {
         HalfCylinder(OuterHoseEdge, cutoutThickness);
         translate([-OuterHoseEdge / 2, -Overlap]) cube([OuterHoseEdge, Overlap * 2, cutoutThickness]);
      }
   }
   translate([-OuterWidth / 2, -SupportTabLength]) cube([OuterWidth, SupportTabLength + Overlap, ShellBaseThickness]);
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
