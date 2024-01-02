include <BOSL/constants.scad>
use <BOSL/shapes.scad>

// all in mm
// modify for item
hook_type = "side"; // "bottom" or "side"
top_height = 5;
item_thickness = 19;
hex_chamfers = 1;
inner_chamfers = 0;
hook_depth = 12; // at most 12

// DO NOT CHANGE
hex_radius = 15.47 / 2; // radius of the hexagon
bottom_height = 10;     // height of the part that interfaces with the hex wall
z_rotate = hook_type == "bottom" ? 30 : 0;

difference()
{
    cyl(r = hex_radius, h = bottom_height + top_height + item_thickness, $fn = 6, center = false,
        chamfer = hex_chamfers);
    rotate([ 0, 0, z_rotate ]) translate([(hex_radius * 2) - hook_depth, item_thickness / -2, bottom_height + item_thickness / 2 ])
        cuboid([ hex_radius * 2, 100, item_thickness ], center = true, chamfer = inner_chamfers);
}
