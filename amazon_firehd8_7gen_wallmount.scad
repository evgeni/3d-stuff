// fn resolution
$fn=100; //[100:360]

base_thickness = 2;

/* [Base Settings] */
holder_width = 20;
holder_height = 15;
holder_depth = 8;

/* [Cutout Settings] */
cutout_width = holder_width;
cutout_diameter = 11;

tablet_height = 128;

screw_head_top = 7;
screw_head_bottom = 4;

/* base with cutout */
module clamp() {
  difference() {
    translate([0, -holder_depth, -(holder_height/2)])
      cube([holder_width, holder_depth, holder_height]);

    translate([-0.01, 0, 0])
      rotate([0, 90, 0])
      cylinder(h=cutout_width+0.02, d=cutout_diameter);
  }
}

module clamps(){
  translate([holder_width, 0, 0]) clamp();
  translate([-(2*holder_width), 0, 0]) clamp();
  translate([-(holder_width/2), tablet_height-(cutout_diameter-base_thickness), 0]) rotate([180, 0, 0]) clamp();
}

module leg() {
  linear_extrude(base_thickness) polygon([[holder_width, 0], [holder_width*2, 0], [holder_width/2, tablet_height-(cutout_diameter-2)], [-(holder_width/2), tablet_height-(cutout_diameter-2)]]);
}

module legs() {
  translate([0, 0, -(holder_height/2)]) leg();
  translate([0, 0, -(holder_height/2)+base_thickness]) rotate([0, 180, 0]) leg();
}

module mount() {
  clamps();
  legs();
}

module hole() {
  cylinder(h=base_thickness+0.02, d1=screw_head_bottom, d2=screw_head_top);
}

difference() {
  mount();
  translate([0, tablet_height-20, -(holder_height/2)-0.01]) hole();
  translate([0, tablet_height-35, -(holder_height/2)-0.01]) hole();
  translate([-(1.4*holder_width), 10, -(holder_height/2)-0.01]) hole();
  translate([(1.4*holder_width), 10, -(holder_height/2)-0.01]) hole();
}
