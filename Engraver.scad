use <2020_profile.scad>
include <motors.scad>
include <Pieces.scad>

$fn = 128;

x_offset = 50;
y_offset = 50;

module extrusion(length, xn=1, yn=1) {
    color("ghostwhite")
        translate([-10 * (xn - 1),-10 * (yn - 1),0]) union()
        {
            for (x = [ 0 : xn - 1]) {
                for (y = [ 0 : yn - 1]) {
                
                    translate([20*x, 20*y,0])
                        linear_extrude(height=length) 2020_profile();            
                }
            }
        }   
}

module bearing() {
    union() {
        color("lightgrey") difference() {
            cylinder(24, 7.5, 7.5);
            translate([0,0,-1]) cylinder(26, 6, 6);
        }
        color("black") difference() {
            translate([0,0,1]) cylinder(22, 6, 6);
            cylinder(24, 4, 4);
        }
    }
}

module laser()
{
    color("dimgrey") union () {
        translate([0,0, 5]) cube([35, 35, 95]);
        translate([17.5, 17.5, 0]) cylinder(6, 12, 12);
    }
}

module pully()
{
    color("darkgrey") difference() {    
        union()
        {
            translate([0,0,0]) cylinder(1, 9, 8.75);
            translate([0,0,0]) cylinder(10, 8, 8);
            translate([0,0,9]) cylinder(1, 8.75, 9);
        }
        translate([0,0,-1]) cylinder(12, 4, 4);
    }
}

module carriage() {

    translate([6,1,0]) rotate ([0,90,0]) bearing();
    translate([6,55,0]) rotate ([0,90,0]) bearing();
    
    color("darkcyan") translate([-10,-8,5]) carriage_block();
    
    translate([0, 10, -10]) laser();
}

module gantry() {
    translate([0,-6,0]) rotate ([-90,0,0]) bearing();
    translate([0,34,0]) rotate ([-90,0,0]) bearing();
    translate([370,13,0]) rotate ([-90,0,0]) bearing();

    color("darkgreen") translate([-35,-8,5]) gantry_block();
    color("darkolivegreen") translate([359,-8,5]) gantry_endstop();
    
    color("silver") {
        translate([-34,-1,11]) rotate ([0,90,0]) cylinder(400, 4, 4);
        translate([-34,53,11]) rotate ([0,90,0]) cylinder(400, 4, 4);
    }    
    translate([x_offset, -2, 11]) carrage();
    
    translate([-32, 55,15]) rotate([90,0,0]) nema17();
    translate([-10.5,0,36.5]) rotate([90,0,0]) pully();
    translate([370,0,36.5]) rotate([90,0,0]) pully();
}

translate([0,0,20]) rotate ([-90,0,0]) extrusion(400, 1, 2);
translate([370,0,20]) rotate ([-90,0,0]) extrusion(400, 1, 2);
translate([10,10,30]) rotate ([0,90,0]) extrusion(350, 1, 1);
translate([10,390,30]) rotate ([0,90,0]) extrusion(350, 1, 1);

color("silver") {
    translate([0,0,52.5]) rotate ([-90,0,0]) cylinder(400, 4, 4);
    translate([370,0,52.5]) rotate ([-90,0,0]) cylinder(400, 4, 4);
}

translate([40,-45,30]) rotate([0,-90,0]) nema17();
translate([-13.25,-23.5,51.5]) rotate([0,-90,0]) pully();
translate([-13.25,397.5,52.5]) rotate([0,-90,0]) pully();

translate([0, y_offset, 52.5]) gantry();

color("blue") {
    translate([0,-2.5,30]) scale([1,1,1]) rotate([-90, 90,0]) runner_cap();
    translate([0,402.5,30]) scale([1,-1,1]) rotate([-90, 90,0]) runner_pulley_cap();
    translate([370,-2.5,30]) scale([-1,1,1]) rotate([-90, 90,0]) runner_cap();
    translate([370,402.5,30]) scale([-1,-1,1]) rotate([-90, 90,0]) runner_cap();
}