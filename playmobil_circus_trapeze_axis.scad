$fn=100;

length=49;
diameter=7.8+0.2;

cutout_width=1.8;
cutout_height=1.8;
cutout_length=8;

difference(){
  linear_extrude(length) {
    circle(d=diameter);
  }
  translate([diameter/2,0,-0.01]) {
    linear_extrude(cutout_length) {
      square([cutout_width*2, cutout_height], center=true);
    }
  }
  translate([diameter/2,0,length+0.01-cutout_length]) {
    linear_extrude(cutout_length) {
      square([cutout_width*2, cutout_height], center=true);
    }
  }
}
