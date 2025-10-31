use <Pieces.scad>
$fn = 128;

module pulley_mount() {    
    difference() {
        union () {
            translate([-10.5, 0,0]) cube([21,17,17]);
            translate([7.5,0,-16]) cube([3,10,17.5]);
            translate([7.5,0,-10]) cube([5,3,27]);
            translate([7.5, 0, -10])  rotate([0,90,0]) cylinder(6,6,6);
        }
        union() {
            translate([0,0,3]) linear_extrude(15)
                polygon([[-7.6, -0.1], [7.6,-0.1], [9.1,15.1], [-9.1, 15.1]]);
            translate([0,7.5,-1])  cylinder(6,2,2);
            translate([0,7.5,3])  cube([7,4,3], center = true);
            translate([0,0,-10])  rotate([0,90,0]) cylinder(15,3.9,3.9);
        }
    }
}

pulley_mount();