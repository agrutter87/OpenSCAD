use <posts.scad>

/* Examples for viewing */
noctua_40mm_fan_holes();

module noctua_40mm_fan_holes()
{
    /* Hole parameters */
    mount_hole_depth            = 5;
    hole_inner_diameter         = 4;
    
    /* Based on drawings */
    total_width                 = 40;
    mount_hole_spacing          = 32;
    
    /* Calculated offset from edge to start of hole */
    mount_edge_offset           = (total_width - mount_hole_spacing) / 2;
    
    /* Fan hole circular offset clearance */
    fan_hole_diameter           = 40.0;
    
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
    translate([hole5_offset_length, total_width - hole5_offset_width, -mount_hole_depth])
    four_posts(mount_hole_depth, fan_hole_diameter, 0, 0, 0);
}
