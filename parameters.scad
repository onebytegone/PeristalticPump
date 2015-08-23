/**
 * These are all of the shared variables that
 * are needed for the pump.
 *
 * Created 2015-08-18 by Ethan Smith
 */


/*------------------------
 * HARDWARE
 *----------------------*/

/**
 * Sizing for a #6 bolt or equivalent
 */
SmallBoltDiameter = 3.5;
SmallBoltCountersinkEndDiameter = 7.3;
SmallBoltCountersinkDepth = 2.3;


/*------------------------
 * FIXED MODEL SIZES
 *----------------------*/

/**
 * Outside diameter for the hose/tubing
 */
HoseOD = 5;

/**
 * Size to which the hose should be compressed to
 */
HoseCompressedThickness = 1.5;


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
ShellBaseThickness = 2.3;

/**
 * Height for the channel supporting the hose
 */
ChannelHeight = 9.5;

/**
 * Thickness for the back wall for the outer shell
 */
ShellLipThickness = 4;

/**
 * Angle used to set the length of the gap in
 * the wall for the tubing to come out
 */
ShellCutoutAngle = 50;

/**
 * The radius for the the outer edges for the shell
 */
ShellPerimeterEdgeRadius = 1;

/**
 * The extra between the propeller supports and the shell
 */
ShellPropellerBuffer = 0.5;

/**
 * Diameter for the axel
 */
AxelDiameter = SmallBoltDiameter;

/**
 * General corner radius
 */
CornerRadius = 3;

/**
 * Bolt to hold roller
 */
RollerBolt = SmallBoltDiameter;
RollerBoltCountersinkEndDiameter = SmallBoltCountersinkEndDiameter;
RollerBoltCountersinkDepth = SmallBoltCountersinkDepth;

/**
 * Outside diameter for roller
 */
RollerOD = 11;

/**
 * Height/Thickness for roller
 */
RollerThickness = 8;

/**
 * $fn used for the roller bolt and outside
 */
RollerSmooth = 30;

/**
 * The thickness for the propeller arms
 */
PropellerBacking = 3;

/**
 * $fn used for the propeller
 */
PropellerSmooth = 30;

/**
 * The wall thickness for the propeller
 */
PropellerMinWall = 2.8;

/**
 * The thickness for the propeller retaining plate
 */
PropellerSupport = 3;

/**
 * The general $fn to be used for edge smoothing
 */
EdgeSmooth = 20;


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
 * Thickness for the shell that includes outer wall and
 * the inset for the propeller
 */
ShellCoreThickness = ShellBaseThickness + PropellerSupport;

/**
 * Entire height for the outer shell
 */
ShellTotalThickness = ShellCoreThickness + ChannelHeight;

/**
 * How far the angled cutout needs to extend
 */
ShellCutoutRadius = OuterWidth / 2 + Overlap;

/**
 * How far to the side the cutout is offset by to get
 * the correct angle opening
 */
ShellCutoutSideShift = ShellCutoutRadius * (tan(ShellCutoutAngle / 2));

/**
 * The total length for the propeller
 */
PropellerTotalLength = OuterHoseEdge - HoseCompressedThickness * 2;

/**
 * The distance from the centers of the bolts for oppisate  for the propeller
 */
PropellerRollerDistance = PropellerTotalLength - RollerOD;

/**
 * The width for the propeller
 */
PropellerWidth = AxelDiameter + PropellerMinWall * 2;

/**
 * The thickness for the propeller
 */
PropellerCenterThickness = RollerThickness + PropellerBacking;

/**
 * Diameter for the cutout for the propeller retainer plate
 */
ShellPropellerCutoutDiameter = PropellerRollerDistance + PropellerWidth + ShellPropellerBuffer * 2;
