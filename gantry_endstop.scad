use <Pieces.scad>
$fn = 128;

module gantry_endstop() {
    //cube([22, 66, 10]);
    
    difference() {
        union() {
            cube([32, 68, 12]);
            translate([0, 19.75, -1]) cube([20, 28.5, 1]);
            translate([0, 28, -8.5]) cube([20, 12, 9]);
            /*translate([15,10.5,12]) {
                translate([0,-7.5, 0]) cube([10,15,15]);
                translate([0,-9,7.5]) cube([10,18,5]);
            }*/
            translate([25, -11, 30]) rotate([180,-90,0]) tension_bracket();
            translate([29,5,12]) rotate([-90,180,0]) 
                linear_extrude(2.5) polygon([[0,0], [29,0], [0,34]]); 
            translate([25,0,8]) rotate([0,0,180]) 
                linear_extrude(2.5) polygon([[0,0], [25,0], [0,27]]); 
            translate([29,0,8]) rotate([0,90,180]) 
                linear_extrude(4) polygon([[0,0], [8,0], [0,27]]); 
        }
        union() {
            translate([10, 46.25, -6]) rotate([90,0,0]) cylinder(24.5, 7.5, 7.5);

            translate([-1, 7, 6]) rotate([0,90,0]) cylinder(34, 4.1, 4.1);            
            translate([-1, 61, 6]) rotate([0,90,0]) cylinder(34, 4.1, 4.1);            
        }
    }
        
}

gantry_endstop();