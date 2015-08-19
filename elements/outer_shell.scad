include <../parameters.scad>;
include <../thirdparty/CornerCutout.scad>;

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

   translate([-OuterWidth / 2, -SupportTabLength]) difference() {
      cube([OuterWidth, SupportTabLength + Overlap, ShellBaseThickness]);
      CornerCutout(CORNER_SW, ShellBaseThickness, CornerRadius);
      translate([OuterWidth, 0]) CornerCutout(CORNER_SE, ShellBaseThickness, CornerRadius);
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
