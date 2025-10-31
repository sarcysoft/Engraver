use <Pieces.scad>
$fn = 128;

module runner_pulley_cap() {    
    union () {
        runner_cap();
        translate([-12.5,0,0]) rotate([0, 0, 90]) linear_extrude(10)
            polygon([[-7.5, 0], [-7.5,15], [-9,15]]);
        translate([-12.5,0,0]) rotate([0, 0, 90]) linear_extrude(10)
            polygon([[7.5, 0], [7.5,15], [9,15]]);
    }
}

runner_pulley_cap();