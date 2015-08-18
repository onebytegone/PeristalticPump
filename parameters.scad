/**
 * These are all of the shared variables that
 * are needed for the pump.
 *
 * Created 2015-08-18 by Ethan Smith
 */

/**
 * Outside diameter for the hose/tubing
 */
HoseOD = 5;

/**
 * Size to which the hose should be compressed to
 */
HoseCompressedThickness = 3;

/**
 * The basic wall thickness to abide by
 */
WallThickness = 2;

/**
 * The distance from center to center of
 * where the tubing will reside
 */
PumpDiameter = 35;

/**
 * Thickness for the bottom of the outer shell
 */
ShellBaseThickness = 2;

/**
 * Height for the lip supporting the hose
 */
ShellLipHeight = HoseOD;


/*------------------------
 * RENDERING
 *----------------------*/

/**
 * This helps prevent non-maniford meshes
 */
Overlap = 0.1;


/*------------------------
 * CALCULATED
 *----------------------*/

/**
 * Distance for the outer shell of the pump
 *
 * Sizing:
 * | WALL | 1/2 of HOSE |  PumpDiameter | 1/2 of HOSE | WALL |
 */
OuterHoseEdge = PumpDiameter + HoseOD;
OuterWidth = OuterHoseEdge + (WallThickness * 2);

/**
 * Entire height for the outer shell
 */
ShellTotalThickness = ShellBaseThickness + ShellLipHeight;
