// fn resolution
$fn=100; //[100:360]

/* [Base Settings] */
holder_width = 30;
holder_height = 15;
holder_depth = 10;

/* [Arm Settings] */
arm_length = 45;
arm_width_wide = 10;
arm_width_narrow = 3;

/* [Cutout Settings] */
cutout_width = 30;
cutout_radius = 5.5;

/* base with cutout */
difference() {
  translate([0, -holder_depth, -(holder_height/2)])
    cube([holder_width, holder_depth, holder_height]);

  translate([-0.01, 0, 0])
    rotate([0, 90, 0])
    cylinder(h=cutout_width+0.02, r=cutout_radius);
}

/* arm */
rotate([180, 0, 0])
  translate([0, holder_depth-0.001, -(holder_height/2)])
  linear_extrude(height=holder_height)
  polygon(points=[[0,0], [(arm_width_wide-arm_width_narrow),arm_length], [arm_width_wide,arm_length], [arm_width_wide,0]]);
