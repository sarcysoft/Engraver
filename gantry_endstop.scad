use <Pieces.scad>
$fn = 128;

module gantry_endstop() {
    //cube([22, 66, 10]);
    
    union() {
        difference() {
            union() {
                cube([32, 68, 12]);
                translate([2, 31, -7]) cube([18, 8, 7]);
            }
            union() {
                translate([11, 47, -6]) rotate([90,0,0]) cylinder(24, 7.5, 7.5);

                translate([-1, 7, 6]) rotate([0,90,0]) cylinder(34, 4.1, 4.1);            
                translate([-1, 61, 6]) rotate([0,90,0]) cylinder(34, 4.1, 4.1);            
            }
        }
        
        translate([10,0,12]) cube([22, 5, 10]);
    }
}

gantry_endstop();