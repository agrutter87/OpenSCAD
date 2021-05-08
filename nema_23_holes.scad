use <posts.scad>

/* Examples for viewing */
nema_23_holes();

module nema_23_holes()
{
    /* Hole parameters */
    mount_hole_depth            = 4.5;
    hole_inner_diameter         = 5;
    
    /* Based on drawings */
    total_width                 = 56.4;
    mount_hole_spacing          = 47.1;
    
    /* Calculated offset from edge to start of hole */
    mount_edge_offset           = (total_width - mount_hole_spacing) / 2;
    
    /* Shaft baseplate circular offset clearance */
    shaft_baseplate_diameter    = 38.1;
    shaft_baseplate_depth       = 1.6;
    shaft_diameter              = 6;
    shaft_length                = 20.6;
    
    /* Length positioning parameters */
    hole1_offset_length         = mount_edge_offset;
    hole2_offset_length         = hole1_offset_length;
    hole3_offset_length         = mount_edge_offset + mount_hole_spacing;
    hole4_offset_length         = hole3_offset_length;
    hole5_offset_length         = total_width / 2;
    
    /* Width positioning parameters */
    hole1_offset_width          = mount_edge_offset + mount_hole_spacing;
    hole2_offset_width          = mount_edge_offset;
    hole3_offset_width          = hole1_offset_width;
    hole4_offset_width          = hole2_offset_width;
    hole5_offset_width          = total_width / 2;
    
    /* Hole 1: */
    translate([hole1_offset_length, total_width - hole1_offset_width, -mount_hole_depth])
    four_posts(mount_hole_depth, hole_inner_diameter, 0, 0, 0);
    
    /* Hole 2: */
    translate([hole2_offset_length, total_width - hole2_offset_width, -mount_hole_depth])
    four_posts(mount_hole_depth, hole_inner_diameter, 0, 0, 0);
        
    /* Hole 3: */
    translate([hole3_offset_length, total_width - hole3_offset_width, -mount_hole_depth])
    four_posts(mount_hole_depth, hole_inner_diameter, 0, 0, 0);
    
    /* Hole 4: */
    translate([hole4_offset_length, total_width - hole4_offset_width, -mount_hole_depth])
    four_posts(mount_hole_depth, hole_inner_diameter, 0, 0, 0);

    /* Hole 5: */
    translate([hole5_offset_length, total_width - hole5_offset_width, -shaft_baseplate_depth])
    four_posts(shaft_baseplate_depth, shaft_baseplate_diameter, 0, 0, 0);

    /* Hole 6: */
    translate([hole5_offset_length, total_width - hole5_offset_width, -shaft_length])
    four_posts(shaft_length, shaft_diameter, 0, 0, 0);
}
