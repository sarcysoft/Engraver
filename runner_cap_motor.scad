use <Pieces.scad>
$fn = 128;

module runner_cap_motor() {
    difference() {
        union () {
            runner_cap();
            translate([-35.5,-10,0]) cube([8,22.5,10]);
            translate([6.5,-10,-48]) cube([3.5,22.5,48]);
            translate([-35.5,5.5,-5]) cube([42.5,7,5]);
            translate([-27.5,7.5,0]) cube([15,5,10]);
            translate([-35.5, 12.5, -48]) rotate([180, -90, 0]) motor_bracket(12,3.9,3.9);
            translate([-38.5,-9.5,-11]) rotate([0,-90,0]) {
                translate([0,-0.5,-3]) cube([21, 22.5, 4.5]);
                translate([4, 3.5, 1.5]) cylinder(3, 1.25, 1.25);
            }
        }
        translate([-38.5,-9.5,-11]) rotate([0,-90,0]) {
            translate([-1,-2.5,-6]) cube([12, 17.5, 4]);
            translate([4, 18.5, -4.5]) cylinder(7, 1.4, 1.4);
            
            translate([6.25,15, 1.25]) rotate([90,0,0]) cylinder(8, 2.25, 2.25);
                            
            translate([14.25,19.5, 1.25]) rotate([90,0,0]) cylinder(17, 2.25, 2.25);
            translate([17.75,19.5, 1.25]) rotate([90,0,0]) cylinder(17, 2.25, 2.25);
        }
    }
}

runner_cap_motor();