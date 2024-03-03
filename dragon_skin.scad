$fn = 100;

w = 2;       // width of rectangle
h = 1;       // height of rectangle
l = 35.5;      // length of chord of the curve
dh = 6;           // delta height of the curve

module curve(width, height, length, dheight) {
    r = (pow(length/2, 2) + pow(dheight, 2))/(2*dheight);
    a = 2*asin((length/2)/r);
    translate([-(r -dheight), 0, -width/2]) rotate([0, 0, -a/2])         rotate_extrude(angle = a) translate([r, 0, 0]) square(size = [height, width], center = true);
}

for ( col = [0:1] ) {
for ( row = [0:1] ) {

n = col%2==0 ? 0 : 34/2;
translate([col*34.5, row*35+n, 0]){
curve(w, h, l, dh);

translate([0,0,-w])
linear_extrude(height=w) {
difference() {
scale([1,.5]) {
  difference(){
    circle(r=35);
    circle(r=34);
  }
}
translate([-35.0,0,0])
square(size=[70,70], center=true);
}
}

}
}
}
