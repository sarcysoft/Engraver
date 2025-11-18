use <Pieces.scad>
$fn = 128;

module runner_pulley_cap() {    
    union () {
        runner_cap();
        translate([-12, 19, 0]) rotate([0,180,0]) tension_bracket();
        translate([10,12.5,0]) rotate([0,-90,0]) 
            linear_extrude(2.5) polygon([[0,0], [22.5,0], [0,22.5]]);
        difference() {
            translate([10,-10,0]) cube([20,22.5,2.5]);
            translate([20,0,-1]) cylinder(5, 3, 3);
        }
        translate([10,12.5,2.50]) rotate([90,0,0]) 
            linear_extrude(2.5) polygon([[0,0], [20,0], [0,20]]);    }
}

runner_pulley_cap();