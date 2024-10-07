$fn = 100;

insert_diameter = 8.5;
insert_wall = 2.5;
insert_notch = 3.5;
insert_notch_height = 3;
insert_height = 12;

insert_top = 15.5;
insert_top_height = 10;

blade_length = 105;
blade_width = 13;
blade_thick_1 = 5;
blade_thick_2 = 3;

difference(){
  cylinder(d=insert_top, h=insert_top_height);
  translate([0,0,-0.01]) {
    difference() {
      cylinder(d=insert_top+1, h=insert_top_height/2);
      cylinder(d=insert_top/2, h=insert_top_height/2, $fn=3);
    }
  }
}

module notch() {
translate([0, 0, insert_top_height])
rotate_extrude(angle=50)
translate([insert_diameter/2-insert_wall, 0, 0])
polygon([[0, 0], [0, insert_height], [insert_wall, insert_height], [insert_notch, insert_height-(insert_notch_height/1.5)], [insert_notch, insert_height-insert_notch_height], [insert_wall, insert_height-insert_notch_height], [insert_wall, 0]]);
}

notch();
rotate([0, 0, 120]) notch();
rotate([0, 0, 240]) notch();

module blade(rotation = 0) {
  difference(){
  rotate([-90, 180, rotation]) {
    translate([-blade_width/2, 0, 0]) {
      linear_extrude(height=blade_length) {
        polygon([[0, 0], [0, blade_thick_1], [blade_width, blade_thick_1], [blade_width, blade_thick_2]]);
      }
    }
  }
  cylinder(d=insert_top/2+0.4, h=insert_top_height/2+0.02, $fn=3);
  }
}
//translate([0,0,-10])
difference() {
  cylinder(d=insert_top, h=insert_top_height/2);
  translate([0, 0, -0.01])
  cylinder(d=insert_top/2+0.4, h=insert_top_height/2+0.02, $fn=3);
}
blade();
blade(120);
blade(240);
