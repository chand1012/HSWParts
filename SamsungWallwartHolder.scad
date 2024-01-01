include <BOSL/constants.scad>
use <BOSL/shapes.scad>
use <insertHexMount.scad>

$fn = 20;

inner_x = 33.5;
inner_y = 18.5;
inner_z = 11.4;

wall_thickness = 2;
wall_thickness_x = 4;

outer_x = wall_thickness_x * 2 + inner_x;
outer_y = wall_thickness * 2 + inner_y;
outer_z = wall_thickness + inner_z;

prong_distance = 11.22;
prong_x = 1.6;
prong_y = 6.4;
prong_z = wall_thickness * 2;

prong_1_dx = prong_distance / 2 + prong_x / 2;
prong_2_dx = prong_distance / -2 + prong_x / -2;
prong_dz = wall_thickness * -2.5;

mount_offset = 5;

difference()
{
    union()
    {
        cuboid([ outer_x, outer_y, outer_z ], chamfer = 1, edges = EDGES_ALL);
        translate([ outer_x / 2 + mount_offset, 0, 0 ]) rotate([ 0, 0, 90 ]) mount_hex();
    }
    translate([ 0, 0, wall_thickness ]) cuboid([ inner_x, inner_y, inner_z ], fillet = 2, edges = EDGES_Z_ALL);
    translate([ prong_1_dx, 0, prong_dz ]) cuboid([ prong_x, prong_y, prong_z ]);
    translate([ prong_2_dx, 0, prong_dz ]) cuboid([ prong_x, prong_y, prong_z ]);
}
