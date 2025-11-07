use <Pieces.scad>
$fn = 128;

module runner_pulley_cap() {    
    union () {
        runner_cap();
        translate([-25,7,0]) cube([5,2,10]);
        translate([-25,-9,0]) cube([5,2,10]);
    }
}

runner_pulley_cap();