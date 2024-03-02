$fn=100;

circle_opening_diameter=14;
circle_with_walls=circle_opening_diameter+(2*3);

clamp_height=12.5;

linear_extrude(height=circle_with_walls)
polygon([[0,0], [0,clamp_height], [14,clamp_height], [14,3], [10,3], [10, 5], [12, 6], [12,10], [5,10], [4,4], [4,0]]);

rotate([0, 0, 160])
translate([-60, -8, 0])
rotate_extrude(angle = 30) translate([50, 0, 0]) square(size = [2, circle_with_walls], center = false);

translate([-(circle_with_walls/2),clamp_height,circle_with_walls/2])
rotate([90,0,0])
linear_extrude(height=4){
  difference(){
    circle(d=circle_with_walls);
    circle(d=circle_opening_diameter);
  }
  difference() {
    translate([0,-(circle_with_walls/2)])
      square([circle_with_walls/2,circle_with_walls]);
    circle(d=circle_opening_diameter);
  }
}
