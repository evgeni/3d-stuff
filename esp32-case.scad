$fn=100;

wall_height = 20;

stilts_distance_x = 23.5;
stilts_distance_y = 51.5;
stills_thin_height = 3;
stills_thin = 2;
stills_thick_height = 5;
stills_thick = 4;

wall_thickness = 2;
space_around = 5;

width = stilts_distance_x + 2*space_around + 2*wall_thickness;
length = stilts_distance_y + 2*space_around + 2*wall_thickness;

usb_cutout_width = 12;
usb_cutout_height = 9;
usb_cutout_around_board = 5;

module stand() {
  cylinder(d=stills_thin, h=stills_thin_height);
  translate([0, 0, -stills_thick_height]) cylinder(d=stills_thick, h=stills_thick_height);
}

stand();
translate([-stilts_distance_x, 0, 0]) stand();
translate([-stilts_distance_x, stilts_distance_y, 0]) stand();
translate([0, stilts_distance_y, 0]) stand();

translate([-stilts_distance_x-space_around-wall_thickness, -stills_thick-wall_thickness, -stills_thick_height-wall_thickness+0.01]) cube([width, length, wall_thickness]);

difference() {
  translate([-stilts_distance_x-space_around-wall_thickness, -stills_thick-wall_thickness, -stills_thick_height]) cube([width, wall_thickness, wall_height]);
  translate([-stilts_distance_x-space_around+usb_cutout_width, -stills_thick-wall_thickness-0.01, -(usb_cutout_height/2)]) cube([usb_cutout_width, wall_thickness+0.02, usb_cutout_height]);
}
translate([-stilts_distance_x-space_around-wall_thickness, length-2*wall_thickness-stills_thick, -stills_thick_height]) cube([width, wall_thickness, wall_height]);

translate([-stilts_distance_x-space_around-wall_thickness, -stills_thick-wall_thickness, -stills_thick_height]) cube([wall_thickness, length, wall_height]);
translate([stills_thick+wall_thickness/2, -stills_thick-wall_thickness, -stills_thick_height]) cube([wall_thickness, length, wall_height]);
