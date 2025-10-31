$fn = 128;

module end_cap() {
    difference() {
        union() {
            for (i = [ 0 : 3 ]) {
                rotate([0, 0, i * 90]) {
                    translate([0,0,2.5]) linear_extrude(5)
                        polygon(points=[[-2.5,3.75],[-5.5,8],[-3,8],[-3, 10],
                                        [3,10],[3,8],[5.5,8],[2.5, 3.75]]);
                }
            }
            translate([-10,-10,0]) cube([20,20,2.5]);
            translate([-12.5,-10,0]) cube([2.5,20,22.5]);
            translate([-12.5,10,0]) cube([22.5,2.5,22.5]);
        }
        cylinder(20, 3, 3, center=true);
        translate([0,0,15]) rotate([90,0,0]) cylinder(40, 3, 3, center=true);
        translate([0,0,15]) rotate([0,90,0]) cylinder(40, 3, 3, center=true);
    }
}

module runner_cap() {
    union () {
        end_cap();
        translate([-27.5,-10,0]) difference() {
            translate([0,2.5, 0]) cube([15,15,10]);
            translate([5, 10, 7.5]) cylinder(10, 4.1, 4.1, center=true);
        }
        translate([-10,-30,0]) difference() {
            cube([20,20,2.5]);
            translate([10, 10, 0]) cylinder(10, 3, 3, center=true);
        }
        translate([-12.5, -10, 0]) rotate([0, 90, 0]) linear_extrude(2.5)
            polygon(points=[[0,0],[0,-20],[-2.5, -20], [-22.5, 0]]);
    }
}

module motor_bracket() {
    difference() {
        translate([0,0,0]) cube([44, 7, 42]);
        union() {
            translate([-1,5,9.5]) cube([24, 3, 23]);
            translate([-1,-1,17.5]) cube([24, 9, 7]);
            translate([23,9, 21]) rotate([90,0,0]) cylinder(4, 11.5, 11.5);
            translate([23,6, 21]) rotate([90,0,0]) cylinder(7, 3.5, 3.5);

            translate([6.5,-1, 5]) rotate([-90,0,0]) {
                cylinder(9, 2, 2);
                cylinder(3, 3.5, 3.5);
            }
            translate([6.5,-1, 36]) rotate([-90,0,0]) {
                cylinder(9, 2, 2);
                cylinder(3, 3.5, 3.5);
            }
            translate([37.5,-1, 5]) rotate([-90,0,0]) {
                cylinder(9, 2, 2);
                cylinder(3, 3.5, 3.5);
            }
            translate([37.5,-1, 36]) rotate([-90,0,0]) {
                cylinder(9, 2, 2);
                cylinder(3, 3.5, 3.5);
            }
        }
    }
}

module belt_bracket() {
    difference() {
        cube([30, 10, 10]);
        difference() {
            union() {
                translate([10, 8, 5]) rotate([90,0,0]) cylinder(9, 4, 4);
                translate([20, 8, 5]) rotate([90,0,0]) cylinder(9, 4, 4);
                translate([-1, -1, 1]) cube([11, 9, 8]);
                translate([20, -1, 1]) cube([11, 9, 8]);
            }

            union() {
                translate([10, 8, 5]) rotate([90,0,0]) cylinder(9, 2.5, 2.5);
                translate([20, 8, 5]) rotate([90,0,0]) cylinder(9, 2.5, 2.5);
                translate([-1, -1, 2.5]) cube([11, 9, 5]);
                translate([20, -1, 2.5]) cube([11, 9, 5]);
            }
        }
    }

    for(i = [0:5])
        translate([i*2, 8, 1]) rotate([90,0,0]) linear_extrude(8) polygon([[0,0], [1,0], [1,1.0]]);
    for(i = [0:5])
        translate([30-i*2, 0, 1]) rotate([90,0,180]) linear_extrude(8) polygon([[0,0], [1,0], [1,1.0]]);
}

belt_bracket();
