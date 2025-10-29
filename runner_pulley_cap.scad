use <Pieces.scad>
$fn = 128;

module runner_pulley_cap() {    
    difference() {
        union () {
            runner_cap();
            translate([-27.5,5,-12.5]) cube([15,7.5,22.5]);
            translate([-20, 15, -6]) rotate([90, 0, 0]) cylinder(3,6,6);
        }
        translate([-20, 19, -6]) rotate([90, 0, 0]) cylinder(15,3.9,3.9);
    }
}

runner_pulley_cap();