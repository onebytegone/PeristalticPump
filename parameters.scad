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
HoseCompressedThickness = 2.5;


/**
 * The basic wall thickness to abide by
 */
WallThickness = 1.2;

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
ShellLipHeight = 8;

/**
 * Thickness for the back wall for the outer shell
 */
ShellLipThickness = 4;

/**
 * Length for the base support tab
 */
SupportTabLength = 9;

/**
 * Diameter for the axel
 */
AxelDiameter = 3.5;  // Approx size of #6 bolt

/**
 * General corner radius
 */
CornerRadius = 3;

/**
 * Bolt to hold roller
 */
RollerBolt = 3.5;  // Approx size of #6 bolt

/**
 * Outside diameter for roller
 */
RollerOD = 9;

/**
 * Height/Thickness for roller
 */
RollerThickness = 5;

/**
 * $fn used for the roller bolt and outside
 */
RollerSmooth = 30;


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
OuterWidth = OuterHoseEdge + (ShellLipThickness * 2);

/**
 * Entire height for the outer shell
 */
ShellTotalThickness = ShellBaseThickness + ShellLipHeight;

/**
 * The total length for the propeller
 */
PropellerLength = OuterHoseEdge - HoseCompressedThickness * 2;

/**
 * The width for the propeller
 */
PropellerWidth = AxelDiameter + WallThickness * 2;

/**
 * The thickness for the propeller
 */
PropellerThickness = ShellLipHeight;
