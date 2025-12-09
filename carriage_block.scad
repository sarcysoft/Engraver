use <Pieces.scad>
$fn = 128;

module carriage_block() {
    //cube([58, 66, 10]);
    
    union() {
        difference() {
            union() {
                cube([58, 74, 12]);
                translate([22, 0, -7.5]) cube([14, 20, 8]);
                translate([22, 54, -7.5]) cube([14, 20, 8]);
            }
            union() {
                translate([16.75, 10, -4.5]) rotate([0,90,0]) cylinder(24.5, 7.5, 7.5);
                translate([16.75, 64, -4.5]) rotate([0,90,0]) cylinder(24.5, 7.5, 7.5);
                translate([12,19,-10]) cube([36,36,25]);
                
                translate([6, 64.5, -4.5]) cylinder(24.5, 2, 2);
                translate([52, 64.5, -4.5]) cylinder(24.5, 2, 2);

                translate([6, 64.5, 0]) cube([5,8,15], center=true);
                translate([52, 64.5, 0]) cube([5,8,15], center=true);
                
            }
        }
        
        translate([4,-9.5,2]) rotate([0,0,0]) belt_bracket();
    }  
}

carriage_block();