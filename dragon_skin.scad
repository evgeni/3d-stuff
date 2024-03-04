$fn = 100;

w = 2;       // width of rectangle
h = 1;       // height of rectangle
l = 25.5;      // length of chord of the curve
dh = 6;           // delta height of the curve

module curve(width, height, length, dheight) {
    r = (pow(length/2, 2) + pow(dheight, 2))/(2*dheight);
    a = 2*asin((length/2)/r);
    translate([-(r -dheight), 0, -width/2]) rotate([0, 0, -a/2])         rotate_extrude(angle = a) translate([r, 0, 0]) square(size = [height, width], center = true);
}

for ( col = [0:7] ) {
for ( row = [0:7] ) {

n = col%2==0 ? 0 : 24/2;
translate([col*24.5, row*25+n, 0]){
curve(w, h, l, dh);

translate([0,0,-w])
linear_extrude(height=w) {
difference() {
scale([1,.5]) {
  difference(){
    circle(r=25);
    circle(r=24);
  }
}
translate([-25.0,0,0])
square(size=[50,50], center=true);
}
}

}
}
}
