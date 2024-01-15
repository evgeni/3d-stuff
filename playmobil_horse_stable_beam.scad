$fn=100;

length=147;
width=7.5;
height=6;

depth=2;

linear_extrude(depth) {
  difference() {
    square([length, width], center=true);
    translate([-(length/2)+3+2.5, 0]) {
      square([5, 4], center=true);
    }
    translate([(length/2)-3-2.5, 0]) {
      square([5, 4], center=true);
    }
  }
}

translate([0,0,depth])
linear_extrude(height-depth) {
  square([length, width], center=true);
}
