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
            cube([15,18,10]);
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

module runner_pulley_cap() {
    union () {
        runner_cap();
        translate([-27.5,8,0]) cube([15,5,10]);
        translate([-22.5, 24, 5]) rotate([90, 0, 0]) cylinder(12,3.9,3.9);
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

module runner_cap_motor() {
    difference() {
        union () {
            runner_cap();
            translate([10,-10,0]) cube([7,22.5,2.5]);
            translate([14.5,-10,-48]) cube([2.5,22.5,48]);
            translate([-27.5,5.5,-5]) cube([42.5,7,5]);
            translate([-27.5,7.5,0]) cube([15,5,10]);
            translate([-27.5, 12.5, -48]) rotate([180, -90, 0]) motor_bracket(12,3.9,3.9);
            translate([-30.5,-9.5,-11]) rotate([0,-90,0]) {
                translate([0,-0.5,-3]) cube([21, 22.5, 4.5]);
                translate([4, 3.5, 1.5]) cylinder(3, 1.25, 1.25);
            }
        }
        translate([-30.5,-9.5,-11]) rotate([0,-90,0]) {
            translate([-1,-2.5,-6]) cube([12, 17.5, 4]);
            translate([4, 18.5, -4.5]) cylinder(7, 1.4, 1.4);
            
            translate([6.25,15, 1.25]) rotate([90,0,0]) cylinder(8, 2.25, 2.25);
                            
            translate([14.25,19.5, 1.25]) rotate([90,0,0]) cylinder(17, 2.25, 2.25);
            translate([17.75,19.5, 1.25]) rotate([90,0,0]) cylinder(17, 2.25, 2.25);
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
                translate([10, 8, 5]) rotate([90,0,0]) cylinder(9, 2, 2);
                translate([20, 8, 5]) rotate([90,0,0]) cylinder(9, 2, 2);
                translate([-1, -1, 3]) cube([11, 9, 4]);
                translate([20, -1, 3]) cube([11, 9, 4]);
            }
        }
    }

    for(i = [0:4])
        translate([i*2, 8, 1]) rotate([90,0,0]) linear_extrude(8) polygon([[0,0], [1,0], [1,0.85]]);
    for(i = [0:4])
        translate([30-i*2, 0, 1]) rotate([90,0,180]) linear_extrude(8) polygon([[0,0], [1,0], [1,0.85]]);
}

module carrage_block() {
    //cube([58, 66, 10]);
    
    union() {
        difference() {
            union() {
                cube([58, 72, 12]);
                translate([25, 0, -7]) cube([8, 18, 7]);
                translate([25, 54, -7]) cube([8, 18, 7]);
            }
            union() {
                translate([17, 9, -4.5]) rotate([0,90,0]) cylinder(24, 7.5, 7.5);
                translate([17, 63, -4.5]) rotate([0,90,0]) cylinder(24, 7.5, 7.5);
                translate([11.5,18.5,-10]) cube([35,35,25]);
            }
        }
    }  
}

module gantry_block() {
    //cube([42, 66, 10]);
    
    union() {
        difference() {
            union() {
                cube([44, 68, 12]);
                translate([26, 9, -8]) cube([18, 8, 8]);
                translate([26, 51, -8]) cube([18, 8, 8]);
                translate([23,46,12]) {
                    cube([21, 22, 1.5]);
                    translate([4, 18.5, 1.5]) cylinder(3, 1.25, 1.25);
                }
            }
            union() {
                translate([35, 25, -6]) rotate([90,0,0]) cylinder(24, 7.6, 7.6);
                translate([35, 67, -6]) rotate([90,0,0]) cylinder(24, 7.6, 7.6);

                translate([-1, 7, 6]) rotate([0,90,0]) cylinder(48, 4.1, 4.1);            
                translate([-1, 61, 6]) rotate([0,90,0]) cylinder(48, 4.1, 4.1);      

                translate([23,46,12])
                {
                    translate([4, 3.5, -4.5]) cylinder(7, 1.4, 1.4);
                    
                    translate([6.25,15, 1.25]) rotate([90,0,0]) cylinder(8, 2.25, 2.25);
                                    
                    translate([14.25,19.5, 1.25]) rotate([90,0,0]) cylinder(17, 2.25, 2.25);
                    translate([17.75,19.5, 1.25]) rotate([90,0,0]) cylinder(17, 2.25, 2.25);
                }
            }
        }      
        
        translate([0,0,12]) motor_bracket();
        translate([15,49,-10]) rotate([0,0,-90]) belt_bracket();
    }    
}

module gantry_endstop() {
    //cube([22, 66, 10]);
    
    union() {
        difference() {
            union() {
                cube([32, 68, 12]);
                translate([2, 31, -7]) cube([18, 8, 7]);
            }
            union() {
                translate([11, 47, -6]) rotate([90,0,0]) cylinder(24, 7.5, 7.5);

                translate([-1, 7, 6]) rotate([0,90,0]) cylinder(34, 4.1, 4.1);            
                translate([-1, 61, 6]) rotate([0,90,0]) cylinder(34, 4.1, 4.1);            
            }
        }
        
        translate([10,0,12]) cube([22, 5, 10]);
    }
}

//belt_bracket();
//carrage_block();
//gantry_block();
//gantry_endstop();
runner_cap_motor();