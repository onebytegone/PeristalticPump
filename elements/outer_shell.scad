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

         // Tabs
         rotate([0,0,180]) mountingTab(OuterWidth/2, ShellTotalThickness);
         rotate([0,0,SecondaryMountingTabAngle/2]) mountingTab(OuterWidth/2, ShellTotalThickness);
         rotate([0,0,-SecondaryMountingTabAngle/2]) mountingTab(OuterWidth/2, ShellTotalThickness);
      }

      translate([0,0,ShellTotalThickness - ChannelHeight]) {
         cylinder(ChannelHeight + Overlap, OuterHoseEdge/2, OuterHoseEdge/2);
         linear_extrude(height = ChannelHeight + Overlap) polygon(points=[[0,0],[-ShellCutoutSideShift,ShellCutoutRadius],[ShellCutoutSideShift,ShellCutoutRadius]]);
      }
   }


   rotate([0, 0, ShellCutoutAngle / 2]) translate([0, OuterWidth / 2 - ShellLipThickness/2, ShellTotalThickness - ChannelHeight]) cylinder(ChannelHeight, ShellLipThickness/2, ShellLipThickness/2, $fn = EdgeSmooth);
   rotate([0, 0, -ShellCutoutAngle / 2]) translate([0, OuterWidth / 2 - ShellLipThickness/2, ShellTotalThickness - ChannelHeight]) cylinder(ChannelHeight, ShellLipThickness/2, ShellLipThickness/2, $fn = EdgeSmooth);
}

module mountingTab(length, thickness) {
   width = MountingTabSize;
   difference() {
      translate([-width/2,0]) cube([width, length + MountingTabSize, thickness]);
      translate([-width/2, length + MountingTabSize]) CornerCutout(CORNER_NE, thickness, CornerRadius);
      translate([width/2, length + MountingTabSize]) CornerCutout(CORNER_NW, thickness, CornerRadius);
      translate([0, length + MountingTabSize/2, -Overlap]) cylinder(thickness + Overlap*2, MountingTabBoltDiameter/2, MountingTabBoltDiameter/2);
   }
}
