use <Pieces.scad>
$fn = 128;

module gantry_endstop() {
    //cube([22, 66, 10]);
    
    union() {
        difference() {
            union() {
                cube([32, 68, 12]);
                translate([0, 19.75, -1]) cube([20, 28.5, 1]);
                translate([0, 28, -8.5]) cube([20, 12, 9]);
                translate([15,10.5,12]) {
                    translate([0,-7.5, 0]) cube([10,15,15]);
                    translate([0,-9,7.5]) cube([10,18,5]);
                }
            }
            union() {
                translate([10, 46.25, -6]) rotate([90,0,0]) cylinder(24.5, 7.5, 7.5);

                translate([-1, 7, 6]) rotate([0,90,0]) cylinder(34, 4.1, 4.1);            
                translate([-1, 61, 6]) rotate([0,90,0]) cylinder(34, 4.1, 4.1);            
            }
        }
    }
}

gantry_endstop();