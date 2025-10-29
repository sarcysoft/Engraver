use <Pieces.scad>
$fn = 128;

module carrage_block() {
    //cube([58, 66, 10]);
    
    union() {
        difference() {
            union() {
                cube([58, 72, 12]);
                translate([25, 0, -7]) cube([8, 18, 7]);
                translate([25, 54, -7]) cube([8, 18, 7]);
            }
            union() {
                translate([17, 9, -4.5]) rotate([0,90,0]) cylinder(24, 7.5, 7.5);
                translate([17, 63, -4.5]) rotate([0,90,0]) cylinder(24, 7.5, 7.5);
                translate([11.5,18.5,-10]) cube([35,35,25]);
            }
        }
        translate([14,-10,0]) rotate([0,0,0]) belt_bracket();
    }  
}

carrage_block();