use <elements/outer_shell.scad>;
use <elements/propeller.scad>;
use <elements/roller.scad>;
include <parameters.scad>;

outer_shell();
translate([0, 0, ShellBaseThickness + PropellerCenterThickness]) rotate([0,0,45]) rotate([180,0]) propeller();
translate([0, 0, ShellBaseThickness + RollerThickness]) rotate([0,0,45]) translate([PropellerRollerDistance/2, 0]) rotate([180,0]) roller();
translate([0, 0, ShellBaseThickness + RollerThickness]) rotate([0,0,45]) translate([-PropellerRollerDistance/2, 0]) rotate([180,0]) roller();
translate([0, 0, ShellBaseThickness + RollerThickness]) rotate([0,0,45]) translate([0, PropellerRollerDistance/2]) rotate([180,0]) roller();
translate([0, 0, ShellBaseThickness + RollerThickness]) rotate([0,0,45]) translate([0, -PropellerRollerDistance/2]) rotate([180,0]) roller();
