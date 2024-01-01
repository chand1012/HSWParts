include <BOSL/constants.scad>
use <BOSL/shapes.scad>

hex_radius = 15.47/2;  // radius of the hexagon

module mount_hex(thickness = 12, chamfer1 = 0, chamfer2 = 1) {
    rotate(a=[90, 0, 0])
        cyl(r=hex_radius, h=thickness, $fn=6, chamfer1 = chamfer1, chamfer2 = chamfer2);
}


mount_hex();