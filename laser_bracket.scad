use <Pieces.scad>
$fn = 128;

focus_offset = 35;

focus_ring_depth = 8;
mount_offset = 47.5;

gantry_offset = 69;
gantry_depth = 12;

b_offset = (focus_offset+focus_ring_depth+mount_offset) - (gantry_offset+gantry_depth);

module laser_bracket() {
    //translate([0, 55, 12]) 
    difference() {
        union() {
            cube([58, 19, 3]);
            translate([12, 0, 0]) cube([34, 3, 15]);
            translate([28, 0, 0]) rotate([90,0,90]) 
                linear_extrude(2) polygon([[3,3], [19, 3], [3, 15]]);
        }
        union() {
            translate([6, 9.5, -4.5]) cylinder(12.5, 2.1, 2.1);
            translate([52, 9.5, -4.5]) cylinder(12.5, 2.1, 2.1);

            translate([20.5, 9.5, b_offset]) rotate([90,0,0]) cylinder(12.5, 1.65, 1.65);
            translate([37.5, 9.5, b_offset]) rotate([90,0,0]) cylinder(12.5, 1.65, 1.65);
        }
    }

}

laser_bracket();