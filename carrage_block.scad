use <Pieces.scad>
$fn = 128;

module carrage_block() {
    //cube([58, 66, 10]);
    
    union() {
        difference() {
            union() {
                cube([58, 74, 12]);
                translate([23, 0, -7.5]) cube([12, 20, 8]);
                translate([23, 54, -7.5]) cube([12, 20, 8]);
            }
            union() {
                translate([16.75, 10, -4.5]) rotate([0,90,0]) cylinder(24.5, 7.5, 7.5);
                translate([16.75, 64, -4.5]) rotate([0,90,0]) cylinder(24.5, 7.5, 7.5);
                translate([11.5,19.5,-10]) cube([35,35,25]);
            }
        }
        translate([14,-9.5,2]) rotate([0,0,0]) belt_bracket();
    }  
}

carrage_block();