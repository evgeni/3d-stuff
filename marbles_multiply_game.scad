// fn resolution
$fn=100; //[100:360]

/* [Base Settings] */
marble_cutout_radius = 4;
marble_distance = 10;
marble_rows = 10;
marble_cols = 10;

border_left = 1.5*marble_distance;
border_right = marble_distance;

width = border_left + (marble_cols*2*marble_cutout_radius) + (marble_cols-1)*marble_distance + border_right;
depth = border_left + (marble_rows*2*marble_cutout_radius) + (marble_rows-1)*marble_distance + border_right;
height = 8;

translate_distance = marble_distance + 2*marble_cutout_radius;
font_size = marble_cutout_radius*1.8;

difference() {
  cube([width, depth, height]);
  for ( col = [1:marble_cols] ) {
    translate([border_left+(col*2*marble_cutout_radius)+(col-1)*marble_distance, depth-(border_left/2), height-2])
      linear_extrude(3)
      text(str(col), halign = "center", valign = "center", size = font_size);

    for ( row = [1:marble_rows] ) {
      /* no need to paint it marble_cols times */
      if ( col == 1 ) {
        translate([border_left/2, depth-border_left-(row*2*marble_cutout_radius)-(row-1)*marble_distance, height-2])
          linear_extrude(3)
          text(str(row), halign = "center", valign="center", size = font_size);
      }

      translate([border_left+(col*2*marble_cutout_radius)+(col-1)*marble_distance, depth-border_left-(row*2*marble_cutout_radius)-(row-1)*marble_distance, height]) sphere(r=marble_cutout_radius);
    }
  }
}
