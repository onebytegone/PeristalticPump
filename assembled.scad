use <elements/outer_shell.scad>;
use <elements/propeller.scad>;
include <parameters.scad>;

outer_shell();
translate([0, 0, ShellBaseThickness]) rotate([0,0,45]) propeller();
