use <posts.scad>

TOP                             = true;
BOTTOM                          = false;
BOARD_SIZE_MAX                  = 100;

/* Examples for viewing */
//arduino_uno_posts(TOP);
//raspberry_pi_model_b_plus_posts(TOP);
//renesas_synergy_ae_cloud1_posts(TOP);
//nema_17_holes();
//nema_23_holes();
//noctua_40mm_fan_holes();
//lynxmotion_lss_servo_holes();
hart_mower_battery_interface();

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
module raspberry_pi_model_b_plus_posts()
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
    hole1_offset_length         = 3.5;
    hole2_offset_length         = hole1_offset_length;
    hole3_offset_length         = 3.5 + 58;
    hole4_offset_length         = hole3_offset_length;
    
    /* Width positioning parameters */
    hole1_offset_width          = 3.5 + 49;
    hole2_offset_width          = 3.5;
    hole3_offset_width          = hole1_offset_width;
    hole4_offset_width          = hole2_offset_width;
    
    board_width                 = 56;

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
module renesas_synergy_ae_cloud1_posts()
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
    hole1_offset_length         = 3.81;
    hole2_offset_length         = hole1_offset_length;
    hole3_offset_length         = 76.00 - 3.81;
    hole4_offset_length         = hole3_offset_length;
    
    /* Width positioning parameters */
    hole1_offset_width          = 49.95 - 3.59;
    hole2_offset_width          = 3.59;
    hole3_offset_width          = hole1_offset_width;
    hole4_offset_width          = hole2_offset_width;
    
    board_width                 = 49.95;

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
module nema_17_holes()
{
    /* Hole parameters */
    mount_hole_depth            = 4.5;
    hole_inner_diameter         = 3;
    
    /* Based on drawings */
    total_width                 = 42.3;
    mount_hole_spacing          = 31.0;
    
    /* Calculated offset from edge to start of hole */
    mount_edge_offset           = (total_width - mount_hole_spacing) / 2;
    
    /* Shaft baseplate circular offset clearance */
    shaft_baseplate_diameter    = 22.0;
    shaft_baseplate_depth       = 2;
    shaft_diameter              = 5;
    shaft_length                = 24;
    
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
module lynxmotion_lss_servo_holes()
{
    /* Hole parameters */
    mount_hole_depth                = 5;
    hole_inner_diameter             = 2.5;

    /* Dimensions retrieved from https://www.robotshop.com/info/wiki/lynxmotion/view/lynxmotion-smart-servo/lss-mechanical/ */
    servo_length                    = 50.8;
    servo_width                     = 25.4;
    servo_depth                     = 38.1;

    servo_base_hole_edge_offset     = 3.25;
//    servo_base_pattern_edge_offset  = 6.50; // This is what was in the documentation
    servo_base_pattern_edge_offset  = 5.50; // Make it smaller because of the curves in the servos
    servo_base_hole_major_offset    = 18.9;
    servo_base_to_base_depth        = 34.9;
    servo_base_cutout_width         = servo_width - (2 * servo_base_pattern_edge_offset);
    servo_base_cutout_length        = servo_length;
    servo_base_cutout_depth         = (servo_depth - servo_base_to_base_depth) / 2;
    
    servo_horn_hole_major_offset    = 16.7;
    servo_horn_to_horn_offset       = servo_width;
    servo_horn_to_horn_depth        = 49.27;
    servo_horn_diameter             = servo_width;

    /* Length positioning parameters */
    hole1_offset_length             = servo_base_hole_edge_offset;
    hole2_offset_length             = hole1_offset_length;
    hole3_offset_length             = servo_base_hole_edge_offset + servo_base_hole_major_offset;
    hole4_offset_length             = hole3_offset_length;
    hole5_offset_length             = servo_base_hole_edge_offset + (servo_length / 2);
    hole6_offset_length             = hole5_offset_length;
    hole7_offset_length             = servo_base_hole_edge_offset + servo_base_hole_major_offset + (servo_length / 2);
    hole8_offset_length             = hole7_offset_length;
    hole9_offset_length             = 2 * (servo_length / 4);
    hole10_offset_length            = 1 * (servo_length / 4);
    hole11_offset_length            = 3 * (servo_length / 4);
    
    /* Width positioning parameters */
    hole1_offset_width              = servo_base_hole_edge_offset + servo_base_hole_major_offset;
    hole2_offset_width              = servo_base_hole_edge_offset;
    hole3_offset_width              = hole1_offset_width;
    hole4_offset_width              = hole2_offset_width;
    hole5_offset_width              = servo_base_hole_edge_offset + servo_base_hole_major_offset;
    hole6_offset_width              = servo_base_hole_edge_offset;
    hole7_offset_width              = hole1_offset_width;
    hole8_offset_width              = hole2_offset_width;
    hole9_offset_width              = servo_width / 2;
    hole10_offset_width             = servo_width / 2;
    hole11_offset_width             = servo_width / 2;
    
    /* Hole 1: */
    translate([hole1_offset_length, servo_width - hole1_offset_width, -mount_hole_depth])
    four_posts(mount_hole_depth, hole_inner_diameter, 0, 0, 0);
    
    /* Hole 2: */
    translate([hole2_offset_length, servo_width - hole2_offset_width, -mount_hole_depth])
    four_posts(mount_hole_depth, hole_inner_diameter, 0, 0, 0);
        
    /* Hole 3: */
    translate([hole3_offset_length, servo_width - hole3_offset_width, -mount_hole_depth])
    four_posts(mount_hole_depth, hole_inner_diameter, 0, 0, 0);
    
    /* Hole 4: */
    translate([hole4_offset_length, servo_width - hole4_offset_width, -mount_hole_depth])
    four_posts(mount_hole_depth, hole_inner_diameter, 0, 0, 0);
    
    /* Hole 5: */
    translate([hole5_offset_length, servo_width - hole5_offset_width, -mount_hole_depth])
    four_posts(mount_hole_depth, hole_inner_diameter, 0, 0, 0);
    
    /* Hole 6: */
    translate([hole6_offset_length, servo_width - hole6_offset_width, -mount_hole_depth])
    four_posts(mount_hole_depth, hole_inner_diameter, 0, 0, 0);
        
    /* Hole 7: */
    translate([hole7_offset_length, servo_width - hole7_offset_width, -mount_hole_depth])
    four_posts(mount_hole_depth, hole_inner_diameter, 0, 0, 0);
    
    /* Hole 8: */
    translate([hole8_offset_length, servo_width - hole8_offset_width, -mount_hole_depth])
    four_posts(mount_hole_depth, hole_inner_diameter, 0, 0, 0);
    
    /* Hole 9: */
    translate([hole9_offset_length, servo_width - hole9_offset_width, -(servo_base_cutout_depth / 2)])
    cube([servo_base_cutout_length, servo_base_cutout_width, servo_base_cutout_depth], center = true);

    /* Hole 10: */
    translate([hole10_offset_length, servo_width - hole10_offset_width, -(servo_base_cutout_depth / 2)])
    cube([servo_base_cutout_width, servo_width, servo_base_cutout_depth], center = true);

    /* Hole 11: */
    translate([hole11_offset_length, servo_width - hole11_offset_width, -(servo_base_cutout_depth / 2)])
    cube([servo_base_cutout_width, servo_width, servo_base_cutout_depth], center = true);
}
module hart_mower_battery_interface()
{
	track_length 				= 101.8;
	
	track_width					= 63.0;

	track_depth					= 13.9;
	track_depth_inner_offset	= 5.0;
	track_inner_depth_major 	= 7.8; 
	track_inner_depth_minor		= 6.6;
	track_outer_depth_major		= track_depth - track_inner_depth_minor;
	track_outer_depth_minor		= track_depth - track_inner_depth_major;
	
	translate([0, 0, 0])
	difference()
	{
		/* Main body */
		cube([track_length, track_width, track_depth]);
		
		/* First cutout */
		translate([-1, track_width - track_depth_inner_offset, -1])
		cube([track_length + 2, track_depth_inner_offset + 1, track_inner_depth_minor + 1]);
		
		/* Second cutout */
		translate([-1, -1, -1])
		cube([track_length + 2, track_depth_inner_offset + 1, track_inner_depth_minor + 1]);
	}
}