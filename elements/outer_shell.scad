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
      translate([0, 0, ShellBaseThickness]) coreShape(OuterHoseEdge, OuterHeight, ShellLipHeight + Overlap);
   }
   assign(size = OuterHeight - (OuterWidth / 2)) translate([-OuterWidth / 2, - size]) cube([OuterWidth, size +  Overlap, ShellBaseThickness]);
}

module coreShape(width, height, thickness) {
   HalfCylinder(width, thickness);
   assign(size = height - (width / 2)) translate([-width / 2, - size]) cube([width, size +  Overlap, thickness]);
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
