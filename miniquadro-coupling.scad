$fn=100;

module arm(end_length=5) {
  cylinder(d=7, h=9);
  translate([0,0,9])
    cylinder(d1=7, d2=5, h=1);
  translate([0, 0, -end_length])
    cylinder(d=10, h=end_length);
}

module tube_base() {
  difference() {
    circle(d=10);
    circle(d=7.2);
  }
}

module tube(length=70, open=true) {
  linear_extrude(height=length) {
    tube_base();
  }
  if (!open) {
    cylinder(d=10, h=2);
  }
}

module surface_coupling_2_arm_90_deg() {
  arm();

  translate([5, 0, -5])
    rotate([0, 90, 0])
    arm();

  translate([0, 0, -5])
    sphere(d=10);
}

module surface_coupling_2_arm_180_deg() {
  arm();

  translate([0, 0, -10])
    rotate([0, 180, 0])
    arm();
}

module surface_coupling_3_arm() {
  surface_coupling_2_arm_180_deg();
  translate([5, 0, -5])
    rotate([0, 90, 0])
    arm();
}

module surface_coupling_4_arm() {
  surface_coupling_2_arm_180_deg();
  translate([5, 0, -5])
    rotate([0, 90, 0])
    surface_coupling_2_arm_180_deg();
}

module room_coupling_3_arm() {
  surface_coupling_2_arm_90_deg();
  translate([0, -5, -5])
    rotate([90, 0, 0])
    arm();
}

module room_coupling_4_arm() {
  surface_coupling_3_arm();
  translate([0, -5, -5])
    rotate([90, 0, 0])
    arm();
}

module room_coupling_5_arm() {
  surface_coupling_4_arm();
  translate([0, -5, -5])
    rotate([90, 0, 0])
    arm();
}

module room_coupling_6_arm() {
  surface_coupling_4_arm();
  translate([0, -5, -5])
    rotate([90, 0, 0])
    surface_coupling_2_arm_180_deg();
}

module angle_coupling_45_deg() {
  tube(length=17, open=false);

  difference() {
    translate([8.5, 0, 8.5])
      rotate([0, 45, 0])
      arm(end_length=12);
    translate([0, -5, -10])
    cube([10,10,10]);
  }
}

module tube_2cm() {
  tube(length=20);
}

module tube_3cm() {
  tube(length=30);
}

module tube_4cm() {
  tube(length=40);
}

module tube_5cm() {
  tube(length=50);
}

module tube_7cm() {
  tube(length=70);
}

module tube_15cm() {
  tube(length=150);
}

module curved_pipe() {
  rotate_extrude(angle=90)
    translate([70,0,0])
    tube_base();
}

surface_coupling_2_arm_90_deg();

translate([30, 0, 0])
  surface_coupling_2_arm_180_deg();

translate([50, 0, 0])
  surface_coupling_3_arm();

translate([90, 0, 0])
  surface_coupling_4_arm();

translate([120, 0, 0])
  room_coupling_3_arm();

translate([150, 0, 0])
  room_coupling_4_arm();

translate([190, 0, 0])
  room_coupling_5_arm();

translate([230, 0, 0])
  room_coupling_6_arm();

translate([260, 0, -10])
  angle_coupling_45_deg();

translate([290, 0, -10])
  tube_2cm();

translate([310, 0, -10])
  tube_3cm();

translate([330, 0, -10])
  tube_4cm();

translate([350, 0, -10])
  tube_5cm();

translate([370, 0, -10])
  tube_7cm();

translate([390, 0, -10])
  tube_15cm();

translate([410, 0, -10])
  curved_pipe();
