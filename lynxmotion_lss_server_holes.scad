use <posts.scad>

/* Examples for viewing */
lynxmotion_lss_servo_holes();

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
