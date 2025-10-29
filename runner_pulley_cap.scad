use <Pieces.scad>
$fn = 128;

module runner_pulley_cap() {
    union () {
        runner_cap();
        translate([-27.5,8,0]) cube([15,5,10]);
        translate([-22.5, 24, 5]) rotate([90, 0, 0]) cylinder(12,3.9,3.9);
    }
}

runner_pulley_cap();