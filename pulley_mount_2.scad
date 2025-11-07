use <Pieces.scad>
$fn = 128;

module pulley_mount() {    
    difference() {
        union () {
            translate([-10.5, 0,-2]) cube([21,17,19]);
            translate([-10.5,7,-16]) cube([3,10,17.5]);
            translate([-12.5,14,-10]) cube([5,3,27]);
            translate([-12.5, 16, -10])  rotate([0,90,0]) cylinder(5.0,6,6);
            translate([-13.5,16,-10])  rotate([0,90,0]) cylinder(4.0,3.9,3.9);
        }
        union() {
            translate([-7.6,-0.9,3]) cube([15.2,16,15]);
            translate([-9.1,7.4,3]) cube([18.2,5.2,15]);

            translate([0,7.5,-3])  cylinder(7,2.6,2.6);
            translate([0,7.5,0])  cylinder(5,4.5,4.5, $fn = 6);
            translate([-22,16,-10])  rotate([0,90,0]) cylinder(15,2.6,2.6);
        }
    }
}

pulley_mount();