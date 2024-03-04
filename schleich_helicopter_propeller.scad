$fn = 100;

insert_diameter = 8.5;
insert_wall = 2.5;
insert_notch = 4;
insert_notch_height = 3;
insert_height = 12;

insert_top = 15.5;
insert_top_height = 10;

blade_length = 105;
blade_width = 13;
blade_thick_1 = 4;
blade_thick_2 = 2;

linear_extrude(height=insert_top_height) {
  circle(d=insert_top);
}

translate([0, 0, insert_top_height]) {
  linear_extrude(height=insert_height) {
    difference(){
      circle(d=insert_diameter);
      circle(d=insert_diameter-2*insert_wall);
    }
  }
}

translate([0, 0, insert_height+insert_top_height-insert_notch_height])
rotate_extrude()
translate([insert_diameter, 0, 0])
rotate([0, 0, 90])
polygon([[0, 0], [0, insert_notch], [insert_notch_height, insert_notch], [insert_notch_height, insert_wall]]);

module blade(rotation = 0) {
  rotate([-90, 180, rotation]) {
    translate([-blade_width/2, 0, 0]) {
      linear_extrude(height=blade_length) {
        polygon([[0, 0], [0, blade_thick_1], [blade_width, blade_thick_1], [blade_width, blade_thick_2]]);
      }
    }
  }
}

//blade();
//blade(120);
//blade(240);
