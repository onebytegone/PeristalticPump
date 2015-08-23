include <../parameters.scad>;
include <../thirdparty/CornerCutout.scad>;

module outer_shell() {
   difference() {
      shellAssembly();
      translate([0, 0, -Overlap]) cylinder(ShellBaseThickness + (Overlap * 2), AxelDiameter/2, AxelDiameter/2);
      translate([0, 0, ShellBaseThickness]) cylinder(PropellerSupport + Overlap, ShellPropellerCutoutDiameter/2, ShellPropellerCutoutDiameter/2);
   }
}

module shellAssembly() {
   difference() {
      union() {
         translate([0,0,ShellPerimeterEdgeRadius]) cylinder(ShellTotalThickness - ShellPerimeterEdgeRadius, OuterWidth/2, OuterWidth/2);
         cylinder(ShellPerimeterEdgeRadius, OuterWidth / 2 - ShellPerimeterEdgeRadius, OuterWidth / 2 - ShellPerimeterEdgeRadius);
         translate([0,0,ShellPerimeterEdgeRadius]) rotate_extrude(convexity = 10) translate([OuterWidth / 2 - ShellPerimeterEdgeRadius, 0]) circle(r = ShellPerimeterEdgeRadius);
      }

      translate([0,0,ShellTotalThickness - ChannelHeight]) {
         cylinder(ChannelHeight + Overlap, OuterHoseEdge/2, OuterHoseEdge/2);
         linear_extrude(height = ChannelHeight + Overlap) polygon(points=[[0,0],[-ShellCutoutSideShift,ShellCutoutRadius],[ShellCutoutSideShift,ShellCutoutRadius]]);
      }
   }


   rotate([0, 0, ShellCutoutAngle / 2]) translate([0, OuterWidth / 2 - ShellLipThickness/2, ShellTotalThickness - ChannelHeight]) cylinder(ChannelHeight, ShellLipThickness/2, ShellLipThickness/2, $fn = EdgeSmooth);
   rotate([0, 0, -ShellCutoutAngle / 2]) translate([0, OuterWidth / 2 - ShellLipThickness/2, ShellTotalThickness - ChannelHeight]) cylinder(ChannelHeight, ShellLipThickness/2, ShellLipThickness/2, $fn = EdgeSmooth);
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
