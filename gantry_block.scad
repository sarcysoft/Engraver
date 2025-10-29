use <Pieces.scad>
$fn = 128;

module gantry_block() {
    //cube([42, 66, 10]);
    
    union() {
        difference() {
            union() {
                cube([44, 68, 12]);
                translate([26, 9, -8]) cube([18, 8, 8]);
                translate([26, 51, -8]) cube([18, 8, 8]);
                translate([23,46,12]) {
                    cube([21, 22, 1.5]);
                    translate([4, 18.5, 1.5]) cylinder(3, 1.25, 1.25);
                }
            }
            union() {
                translate([35, 25, -6]) rotate([90,0,0]) cylinder(24, 7.6, 7.6);
                translate([35, 67, -6]) rotate([90,0,0]) cylinder(24, 7.6, 7.6);

                translate([-1, 7, 6]) rotate([0,90,0]) cylinder(48, 4.1, 4.1);            
                translate([-1, 61, 6]) rotate([0,90,0]) cylinder(48, 4.1, 4.1);      

                translate([23,46,12])
                {
                    translate([4, 3.5, -4.5]) cylinder(7, 1.4, 1.4);
                    
                    translate([6.25,15, 1.25]) rotate([90,0,0]) cylinder(8, 2.25, 2.25);
                                    
                    translate([14.25,19.5, 1.25]) rotate([90,0,0]) cylinder(17, 2.25, 2.25);
                    translate([17.75,19.5, 1.25]) rotate([90,0,0]) cylinder(17, 2.25, 2.25);
                }
            }
        }      
        
        translate([0,0,12]) motor_bracket();
        translate([15,49,-10]) rotate([0,0,-90]) belt_bracket();
    }    
}


gantry_block();