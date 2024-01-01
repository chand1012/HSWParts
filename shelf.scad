include <BOSL/constants.scad>
use <BOSL/shapes.scad>

// customize these to change your shelf
// in multiples of hexes
shelf_len = 4;
// in mm
depth = 20;


// constants, DO NOT CHANGE
hex_radius = 15.47/2;  // radius of the hexagon
mount_height = 12;
chamfer_amt = 1;
shelf_thickness = 2.5;

union () {
    mount_hex();
    translate([depth / 2 + hex_radius / 4, shelf_len/2 * hex_radius + hex_radius/4, hex_radius/-4])
        cuboid([depth + 2, hex_radius * shelf_len, shelf_thickness], center = true);
}

module mount_hex() {
    rotate([0, -90, 0])
        cyl(r=hex_radius, h=mount_height, $fn=6, chamfer = chamfer_amt);
}
