$fn=100;

length=52;
height=8;
width=19;

module roof() {
  polygon([[-width, 0], [0, height], [width,0], [width+5, -2.1], [width+5, -0.1], [width, 2], [0, height+2], [-width, 2], [-width-5, -0.1], [-width-5, -2.1]]);
}

linear_extrude(length) {
  roof();
  polygon([[-width, 0], [-width, -3], [-width+2, -3], [-width+2, 1]]);
  polygon([[width, 0], [width, -3], [width-2, -3], [width-2, 1]]);
}

translate([0,0,length-0.01]) {
  linear_extrude(4) {
    roof();
  }
}

translate([0,0,-4]) {
  linear_extrude(4.001) {
    roof();
  }
}
