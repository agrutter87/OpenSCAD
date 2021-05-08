use <posts.scad>

TOP                             = true;
BOTTOM                          = false;

/* Examples for viewing */
arduino_uno_posts(TOP);

module arduino_uno_posts(top = false)
{
    /* Post parameters */
    post_height                 = 5;
    post_outer_diameter         = 3;
    post_inner_diameter         = 2;
    
    /* Post support parameters */
    support_diameter            = 5;
    support_count               = 4;
    support_start_angle         = [0,0,0,0];
    support_thickness           = 1;
    support_flip                = false;
    
    /* Length positioning parameters */
    hole1_offset_length         = 14.0 + 1.3;
    hole2_offset_length         = 14.0;
    hole3_offset_length         = 14.0 + 1.3 + 50.8;
    hole4_offset_length         = hole3_offset_length;
    
    /* Width positioning parameters */
    hole1_offset_width          = 2.5 + 5.1 + 27.9 + 15.2;
    hole2_offset_width          = 2.5;
    hole3_offset_width          = 2.5 + 5.1 + 27.9;
    hole4_offset_width          = 2.5 + 5.1;
    
    board_width                 = 53.3;

    if(top)
    {
        /* Hole 1: */
        translate([hole1_offset_length, board_width - hole1_offset_width, 0])
        four_posts_with_supports(post_height, post_outer_diameter, post_inner_diameter, 0, 0, support_diameter, support_count, support_start_angle, support_thickness, support_flip);
        
        /* Hole 2: */
        translate([hole2_offset_length, board_width - hole2_offset_width, 0])
        four_posts_with_supports(post_height, post_outer_diameter, post_inner_diameter, 0, 0, support_diameter, support_count, support_start_angle, support_thickness, support_flip);
            
        /* Hole 3: */
        translate([hole3_offset_length, board_width - hole3_offset_width, 0])
        four_posts_with_supports(post_height, post_outer_diameter, post_inner_diameter, 0, 0, support_diameter, support_count, support_start_angle, support_thickness, support_flip);
        
        /* Hole 4: */
        translate([hole4_offset_length, board_width - hole4_offset_width, 0])
        four_posts_with_supports(post_height, post_outer_diameter, post_inner_diameter, 0, 0, support_diameter, support_count, support_start_angle, support_thickness, support_flip);
    }
    else
    {
        /* Hole 1: */
        translate([hole1_offset_length, hole1_offset_width, 0])
        four_posts_with_supports(post_height, post_outer_diameter, post_inner_diameter, 0, 0, support_diameter, support_count, support_start_angle, support_thickness, support_flip);
        
        /* Hole 2: */
        translate([hole2_offset_length, hole2_offset_width, 0])
        four_posts_with_supports(post_height, post_outer_diameter, post_inner_diameter, 0, 0, support_diameter, support_count, support_start_angle, support_thickness, support_flip);
            
        /* Hole 3: */
        translate([hole3_offset_length, hole3_offset_width, 0])
        four_posts_with_supports(post_height, post_outer_diameter, post_inner_diameter, 0, 0, support_diameter, support_count, support_start_angle, support_thickness, support_flip);
        
        /* Hole 4: */
        translate([hole4_offset_length, hole4_offset_width, 0])
        four_posts_with_supports(post_height, post_outer_diameter, post_inner_diameter, 0, 0, support_diameter, support_count, support_start_angle, support_thickness, support_flip);
    }
}
