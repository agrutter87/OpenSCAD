/* Developed by Alex Grutter */

use <fillets2d.scad>
use <posts.scad>
use <plates.scad>

$fn = 36;

//display_carrier_SYG_70CP_EXP1();
display_carrier2_SYG_70CP_EXP1();

INCHES_TO_MM = 25.4;
MILS_TO_MM = 0.0254;

/******************************************************************************
* Display development baseplate (Parameters set for SYG-70CP w/ EXP1)
******************************************************************************/
module display_carrier_SYG_70CP_EXP1(){
	plate_thickness				= ((1/8) * INCHES_TO_MM);
	plate_outer_length 			= (6700 * MILS_TO_MM);
	plate_outer_width  			= (5200 * MILS_TO_MM);
	plate_inner_length 			= (5600 * MILS_TO_MM); // This length is centered
	plate_inner_offset_width_1 	= (1100 * MILS_TO_MM);
	plate_inner_offset_width_2  = (2000 * MILS_TO_MM);
	
	syg_feet_post_max_height	= ((1/1) * INCHES_TO_MM);
	syg_feet_post_min_height	= ((1/4) * INCHES_TO_MM);
	syg_feet_post_outer_d		= ((1/4) * INCHES_TO_MM);
	syg_feet_post_inner_d		= ((1/8) * INCHES_TO_MM);
	syg_feet_post_spacing_l		= (6250 * MILS_TO_MM);
	syg_feet_post_spacing_w		= (4750 * MILS_TO_MM);
	syg_feet_post_offset_l		= ((plate_outer_length - syg_feet_post_spacing_l - syg_feet_post_outer_d) / 2);
	syg_feet_post_offset_w		= (plate_outer_width - syg_feet_post_spacing_w - syg_feet_post_outer_d) / 2;
	syg_feet_post_offset_h		= plate_thickness;
	syg_feet_post_angle			= atan2((syg_feet_post_max_height - syg_feet_post_min_height), (syg_feet_post_spacing_w + (2 * syg_feet_post_outer_d)));
	syg_feet_post_support_diameter	= syg_feet_post_outer_d + 5;
	syg_feet_post_support_count		= 4;
	syg_feet_post_start_angles		= [0, 0, 0, 0];
	syg_feet_post_support_thickness	= 1;
		
	syg_mount_post_height		= ((1/4) * INCHES_TO_MM);
	syg_mount_post_outer_d		= ((1/4) * INCHES_TO_MM);
	syg_mount_post_inner_d		= ((1/8) * INCHES_TO_MM);
	syg_mount_post_spacing_l	= (6250 * MILS_TO_MM);
	syg_mount_post_spacing_w	= (4750 * MILS_TO_MM);
	syg_mount_post_offset_l		= ((plate_outer_length - syg_feet_post_spacing_l - syg_feet_post_outer_d) / 2);
	syg_mount_post_offset_w		= (plate_outer_width - syg_feet_post_spacing_w - syg_feet_post_outer_d) / 2;
	syg_mount_post_offset_h		= -syg_mount_post_height;
	syg_mount_post_support_diameter	= syg_mount_post_outer_d + 5;
	syg_mount_post_support_count	= 4;
	syg_mount_post_start_angles		= [0, 0, 0, 0];
	syg_mount_post_support_thickness = 1;
	
	exp1_mount_post_height		= ((1/8) * INCHES_TO_MM) + plate_thickness;
	exp1_mount_post_outer_d		= ((1/4) * INCHES_TO_MM);
	exp1_mount_post_inner_d		= ((1/8) * INCHES_TO_MM);
	exp1_mount_post_spacing_l	= (4380 * MILS_TO_MM);
	exp1_mount_post_spacing_w	= 0;
	exp1_mount_post_edge_offset = ((1/2) * INCHES_TO_MM); // Offset from center of hole to edge on width_1 side
	exp1_mount_post_offset_l	= ((plate_outer_length - exp1_mount_post_spacing_l - exp1_mount_post_outer_d) / 2);
	exp1_mount_post_offset_w	= (plate_outer_width - (exp1_mount_post_outer_d / 2) - plate_inner_offset_width_1 - exp1_mount_post_edge_offset);
	exp1_mount_post_offset_h	= 0;
	exp1_mount_post_support_diameter	= exp1_mount_post_outer_d + 19;
	exp1_mount_post_support_count	= 4;
	exp1_mount_post_start_angles	= [0, 0, 0, 0];
	exp1_mount_post_support_thickness = 1;
	
	exp1_mount_hole_offset_l	= ((plate_outer_length - exp1_mount_post_spacing_l - exp1_mount_post_inner_d) / 2);
	exp1_mount_hole_offset_w	= (plate_outer_width - (exp1_mount_post_inner_d / 2) - plate_inner_offset_width_1 - exp1_mount_post_edge_offset);
	
	difference()
	{
		/* All solid objects */
		union()
		{
			/* Main plate assembly */
			H_shaped_plate(plate_thickness, plate_outer_length, plate_outer_width, plate_inner_length, plate_inner_offset_width_1, plate_inner_offset_width_2);
			
			/* These are the feet which will touch the table */
			translate([syg_feet_post_offset_l, syg_feet_post_offset_w, syg_feet_post_offset_h])
			four_posts_with_supports(syg_feet_post_max_height, syg_feet_post_outer_d, syg_feet_post_inner_d, syg_feet_post_spacing_l, syg_feet_post_spacing_w, syg_feet_post_support_diameter, syg_feet_post_support_count, syg_feet_post_start_angles, syg_feet_post_support_thickness, false);
			
			translate([syg_mount_post_offset_l, syg_mount_post_offset_w, syg_mount_post_offset_h])
			four_posts_with_supports(syg_mount_post_height, syg_mount_post_outer_d, syg_mount_post_inner_d, syg_mount_post_spacing_l, syg_mount_post_spacing_w, syg_mount_post_support_diameter, syg_mount_post_support_count, syg_mount_post_start_angles, syg_mount_post_support_thickness, true);
			
			/* These are the mounts to which an EXP1 would mount */
			translate([exp1_mount_post_offset_l, exp1_mount_post_offset_w, exp1_mount_post_offset_h])
			four_posts_with_supports(exp1_mount_post_height, exp1_mount_post_outer_d, exp1_mount_post_inner_d, exp1_mount_post_spacing_l, exp1_mount_post_spacing_w, exp1_mount_post_support_diameter, exp1_mount_post_support_count, exp1_mount_post_start_angles, exp1_mount_post_support_thickness, false);
		}
		
		/* Giant cube used for angling the post ends */
		translate([0,0,plate_thickness+syg_feet_post_min_height])
		rotate([syg_feet_post_angle,0,0])
		cube([plate_outer_length, sqrt(((syg_feet_post_max_height - syg_feet_post_min_height)^2)+(plate_outer_width^2)),syg_feet_post_max_height]);
		
		/* Extra holes to allow for EXP1 screws to go through */
		translate([exp1_mount_hole_offset_l, exp1_mount_hole_offset_w, exp1_mount_post_offset_h])
		four_posts(exp1_mount_post_height, exp1_mount_post_inner_d, 0, exp1_mount_post_spacing_l, exp1_mount_post_spacing_w);
	}
}

module display_carrier2_SYG_70CP_EXP1(){
	plate_thickness				= ((1/8) * INCHES_TO_MM);
	plate_outer_length 			= (6700 * MILS_TO_MM);
	plate_outer_width  			= (5200 * MILS_TO_MM);
	plate_inner_length 			= (5600 * MILS_TO_MM); // This length is centered
	plate_inner_offset_width_1 	= (1100 * MILS_TO_MM);
	plate_inner_offset_width_2  = (2000 * MILS_TO_MM);
	
	syg_feet_post_max_height	= ((1/1) * INCHES_TO_MM);
	syg_feet_post_min_height	= ((1/4) * INCHES_TO_MM);
	syg_feet_post_outer_d		= ((1/4) * INCHES_TO_MM);
	syg_feet_post_inner_d		= ((1/8) * INCHES_TO_MM);
	syg_feet_post_spacing_l		= (6250 * MILS_TO_MM);
	syg_feet_post_spacing_w		= (4750 * MILS_TO_MM);
	syg_feet_post_offset_l		= ((plate_outer_length - syg_feet_post_spacing_l - syg_feet_post_outer_d) / 2);
	syg_feet_post_offset_w		= (plate_outer_width - syg_feet_post_spacing_w - syg_feet_post_outer_d) / 2;
	syg_feet_post_offset_h		= plate_thickness;
	syg_feet_post_angle			= atan2((syg_feet_post_max_height - syg_feet_post_min_height), (syg_feet_post_spacing_w + (2 * syg_feet_post_outer_d)));
	syg_feet_post_support_diameter	= syg_feet_post_outer_d + 5;
	syg_feet_post_support_count		= 4;
	syg_feet_post_start_angles		= [0, 0, 0, 0];
	syg_feet_post_support_thickness	= 1;
		
	syg_mount_post_height		= ((1/4) * INCHES_TO_MM);
	syg_mount_post_outer_d		= ((1/4) * INCHES_TO_MM);
	syg_mount_post_inner_d		= ((1/8) * INCHES_TO_MM);
	syg_mount_post_spacing_l	= (6250 * MILS_TO_MM);
	syg_mount_post_spacing_w	= (4750 * MILS_TO_MM);
	syg_mount_post_offset_l		= ((plate_outer_length - syg_feet_post_spacing_l - syg_feet_post_outer_d) / 2);
	syg_mount_post_offset_w		= (plate_outer_width - syg_feet_post_spacing_w - syg_feet_post_outer_d) / 2;
	syg_mount_post_offset_h		= -syg_mount_post_height;
	syg_mount_post_support_diameter	= syg_mount_post_outer_d + 5;
	syg_mount_post_support_count	= 4;
	syg_mount_post_start_angles		= [0, 0, 0, 0];
	syg_mount_post_support_thickness = 1;
	
	exp1_mount_post_height		= ((1/8) * INCHES_TO_MM) + plate_thickness;
	exp1_mount_post_outer_d		= ((1/4) * INCHES_TO_MM);
	exp1_mount_post_inner_d		= ((1/8) * INCHES_TO_MM);
	exp1_mount_post_spacing_l	= (4380 * MILS_TO_MM);
	exp1_mount_post_spacing_w	= -28;
	exp1_mount_post_edge_offset = ((1/2) * INCHES_TO_MM); // Offset from center of hole to edge on width_1 side
	exp1_mount_post_offset_l	= ((plate_outer_length - exp1_mount_post_spacing_l - exp1_mount_post_outer_d) / 2);
	exp1_mount_post_offset_w	= (plate_outer_width - (exp1_mount_post_outer_d / 2) - plate_inner_offset_width_1 - exp1_mount_post_edge_offset);
	exp1_mount_post_offset_h	= 0;
	exp1_mount_post_support_diameter	= exp1_mount_post_outer_d + 19;
	exp1_mount_post_support_count	= 4;
	exp1_mount_post_start_angles	= [0, 0, 0, 0];
	exp1_mount_post_support_thickness = 1;
	
	exp1_mount_hole_offset_l	= ((plate_outer_length - exp1_mount_post_spacing_l - exp1_mount_post_inner_d) / 2);
	exp1_mount_hole_offset_w	= (plate_outer_width - (exp1_mount_post_inner_d / 2) - plate_inner_offset_width_1 - exp1_mount_post_edge_offset);
	
	difference()
	{
		/* All solid objects */
		union()
		{
			/* Main plate assembly */
			H_shaped_plate(plate_thickness, plate_outer_length, plate_outer_width, plate_inner_length, plate_inner_offset_width_1, plate_inner_offset_width_2);
			
			/* These are the feet which will touch the table */
			//translate([syg_feet_post_offset_l, syg_feet_post_offset_w, syg_feet_post_offset_h])
			//four_posts_with_supports(syg_feet_post_max_height, syg_feet_post_outer_d, syg_feet_post_inner_d, syg_feet_post_spacing_l, syg_feet_post_spacing_w, syg_feet_post_support_diameter, syg_feet_post_support_count, syg_feet_post_start_angles, syg_feet_post_support_thickness, false);
			
			/* These are triangles used as support */
			translate([((plate_outer_length - plate_inner_length) / 2),0,plate_thickness])
			triangle_side_plate(plate_outer_width, (plate_outer_width / 2), 60, ((plate_outer_length - plate_inner_length) / 2));
			translate([plate_outer_length, 0 ,plate_thickness])
			triangle_side_plate(plate_outer_width, (plate_outer_width / 2), 60, ((plate_outer_length - plate_inner_length) / 2));
			
			translate([syg_mount_post_offset_l, syg_mount_post_offset_w, syg_mount_post_offset_h])
			four_posts_with_supports(syg_mount_post_height, syg_mount_post_outer_d, syg_mount_post_inner_d, syg_mount_post_spacing_l, syg_mount_post_spacing_w, syg_mount_post_support_diameter, syg_mount_post_support_count, syg_mount_post_start_angles, syg_mount_post_support_thickness, true);
			
			/* These are the mounts to which an EXP1 would mount */
			translate([exp1_mount_post_offset_l, exp1_mount_post_offset_w, exp1_mount_post_offset_h])
			four_posts_with_supports(exp1_mount_post_height, exp1_mount_post_outer_d, exp1_mount_post_inner_d, exp1_mount_post_spacing_l, exp1_mount_post_spacing_w, exp1_mount_post_support_diameter, exp1_mount_post_support_count, exp1_mount_post_start_angles, exp1_mount_post_support_thickness, false);
		}
		
		/* Giant cube used for angling the post ends */
		//translate([0,0,plate_thickness+syg_feet_post_min_height])
		//rotate([syg_feet_post_angle,0,0])
		//cube([plate_outer_length, sqrt(((syg_feet_post_max_height - syg_feet_post_min_height)^2)+(plate_outer_width^2)),syg_feet_post_max_height]);
		
		/* Extra holes to allow for EXP1 screws to go through */
		translate([exp1_mount_hole_offset_l, exp1_mount_hole_offset_w, exp1_mount_post_offset_h])
		four_posts(exp1_mount_post_height, exp1_mount_post_inner_d, 0, exp1_mount_post_spacing_l, exp1_mount_post_spacing_w);
	}
}

