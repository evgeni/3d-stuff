$fn=100;

outer_circle=92;
inner_circle=46;

notch=25;

height=10;

cutoff_width=40;

difference(){
linear_extrude(height=height) {
difference(){
  circle(d=outer_circle);

  translate([cutoff_width, -outer_circle/3, 0])
    rotate([0, 0, 15])
    polygon([[0,0], [0,outer_circle], [cutoff_width, outer_circle], [cutoff_width, 0]]);

  translate([-cutoff_width*2, -outer_circle/4, 0])
    rotate([0, 0, 345])
    polygon([[0,0], [0,outer_circle], [cutoff_width, outer_circle], [cutoff_width, 0]]);
}
}

translate([0, 0, height/2+0.01])
linear_extrude(height=height/2) {
  circle(d=inner_circle);
}
}

translate([0, outer_circle/2, 0])
  linear_extrude(height=height/2) {
    circle(d=notch);
  }

translate([0, -outer_circle/2, 0])
  linear_extrude(height=height/2) {
    circle(d=notch);
  }
