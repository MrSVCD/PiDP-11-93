/*
    10 inch rack panel for emulated MicroPDP-11 or MicroVAX
    Copyright (C) 2026 Pär Moberg

    This program is free software: you can redistribute it and/or modify
    it under the terms of the GNU Affero General Public License as
    published by the Free Software Foundation, either version 3 of the
    License, or (at your option) any later version.

    This program is distributed in the hope that it will be useful,
    but WITHOUT ANY WARRANTY; without even the implied warranty of
    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
    GNU Affero General Public License for more details.

    You should have received a copy of the GNU Affero General Public License
    along with this program.  If not, see <https://www.gnu.org/licenses/>.
*/

$fn=90;
difference(){
    //Basic shape that everything is sculpted from.
    union(){
        translate([-25.4*0.625,0]) color("green") cube([25.4*10,25.4*1.75,25.4*0.1]);
        translate([0.2,0,0]) cube([(25.4*8.75)-0.4,25.4*1.75,18.6]);
    }
    //Mounting holes for 10inch rack
    for(j=[0,8.75+(5/8)]) for(i=[2,7,12]){
        translate([(-5/16*25.4)+(j*25.4),i/8*25.4]) hull(){
            translate([-1/16*25.4,0]) cylinder(h=25.4,d=6.2);
            translate([ 1/16*25.4,0]) cylinder(h=25.4,d=6.2);
        }
    }
    
    //Power Switch
    translate([12.7*1.25,12.7*1.75]) cube([22.2,30.1,25.4*3],center=true);
    //Marklines for sticker
    translate([25.4*1.3,12.7*1.75]) cube([0.1,25.4*1.75,0.4],center=true);
    translate([25.4*3.9,12.7*1.75]) cube([0.1,25.4*1.75,0.4],center=true);
    
    //DC OK
    translate([25.4*1.65,25.4*((1.75/2)-0.25)]) led();
    //Run
    translate([25.4*1.65,25.4*((1.75/2)+0.25)]) led();
    //Restart
    translate([25.4*2.1,25.4*((1.75/2)-0.25)]) button();
    //Halt
    translate([25.4*2.1,25.4*((1.75/2)+0.25)]) mirror([0,1,0]) button();
    //Ready 0
    translate([25.4*2.7,25.4*((1.75/2)-0.25)]) button();
    //WriterProtect 0
    translate([25.4*2.7,25.4*((1.75/2)+0.25)]) mirror([0,1,0]) button();
    //Ready 1
    translate([25.4*3.3,25.4*((1.75/2)-0.25)]) button();
    //WriterProtect 1
    translate([25.4*3.3,25.4*((1.75/2)+0.25)]) mirror([0,1,0]) button();

    //Raspberry PI sized cutout with heat insert for M3 screws.
    translate([25.4*4.5,25.4*0.25]){
        for(j=[-0.25,3.75]) for(i=[2,7,12]) translate([25.4*j,((i/8)-0.25)*25.4]){
            cylinder(h=0.4,d1=5.2,d2=4.4);
            cylinder(h=25.4,d=4.4);
        }
        cube([3.5*25.4,1.25*25.4,25.4]);
    }
}


module led(){
    cylinder(h=25.4,d=3.2);
    translate([0,0,5]) cylinder(h=25.4,d=5);
}

module button(){
    cylinder(h=25.4,d=6.3);
    translate([-8.6/2,-8.6/2,10]) cube([8.6,8.6,8.6]);
    translate([25.4*0,25.4*-0.25]) led();
}
