use <Pieces.scad>
$fn = 128;

focus_offset = 35;

focus_ring_depth = 5;
mount_offset = (23+28);

gantry_offset = 63.5;
gantry_depth = 12;

b_offset = (focus_offset+focus_ring_depth+mount_offset) - (gantry_offset+gantry_depth);

module laser_bracket() {
    //translate([0, 55, 12]) 
    difference() {
        union() {
            cube([58, 19, 3]);
            translate([12, 0, 0]) cube([34, 3, 30]);
            translate([28, 0, 0]) rotate([90,0,90]) 
                linear_extrude(2) polygon([[3,3], [19, 3], [3, 30]]);
        }
        union() {
            translate([6, 9.5, -4.5]) cylinder(12.5, 2, 2);
            translate([52, 9.5, -4.5]) cylinder(12.5, 2, 2);

            translate([20.5, 9.5, b_offset]) rotate([90,0,0]) cylinder(12.5, 1.5, 1.5);
            translate([37.5, 9.5, b_offset]) rotate([90,0,0]) cylinder(12.5, 1.5, 1.5);
        }
    }

}

laser_bracket();