use <fillets2d.scad>
use <posts.scad>

$fn = 36;

/* This is for testing the cylinders which will stab down into the Noctua fan */
alignment_pin_height = (3/4) * 25.4;
//alignment_pin_height = 3;
alignment_pin_outer_diameter = 4;
//four_posts(alignment_pin_height, alignment_pin_outer_diameter, 0, 32, 32);

/* This has been tested the correct size for the Nano mounting holes */
post_height = 2 * 25.4;
//four_posts(post_height, 5, 2.5, 86, 58);

jetson_nano_housing();

module jetson_nano_housing()
{
	/* Adjustable items */
	top_plate_left_length_modifier 	= 12.5;				// Items to adjust
	top_plate_right_length_modifier = 12.5 - ((3/16) * 25.4);				// Items to adjust
	top_plate_front_width_modifier 	= (10/16) * 25.4;		// Items to adjust
	top_plate_rear_width_modifier 	= (4/16) * 25.4;				// Items to adjust
	
	/* Fixed/determined values */
	nano_board_thickness 			= (1/16) * 25.4;

	nano_hole_spacing_length 		= 86; 				// Won't change, tested
	nano_hole_spacing_width 		= 58; 				// Won't change, tested

	nano_fan_offset_length 			= (18/16) * 25.4; 	// Currently testing first estimate
	nano_fan_offset_width 			= 0;				// Currently testing first estimate

	fan_hole_spacing_length 		= 32;				// Won't change, tested
	fan_hole_spacing_width 			= 32;				// Won't change, tested
	
	top_post_height 				= (15/8) * 25.4;	// Currently testing first estimate
	top_post_outer_diameter 		= 5;				// Won't change, tested
	top_post_inner_diameter 		= 2.5;				// Won't change, tested

	bottom_post_height 				= (1/8) * 25.4;;		// Unknown, guessed low
	bottom_post_outer_diameter 		= 5;				// Won't change, tested
	bottom_post_inner_diameter 		= 2.5;				// Won't change, tested
	
	fan_alignment_pin_height 		= (3/4) * 25.4;		// Currently testing first estimate
	fan_alignment_pin_outer_diameter = 4;				// Won't change, tested

	top_plate_thickness 			= (1/8) * 25.4;
	bottom_plate_thickness			= (1/8) * 25.4;
	
	/* Calculated items */
	fan_hole_offset_length 			= nano_fan_offset_length + (fan_hole_spacing_length / 2 + (fan_alignment_pin_outer_diameter / 2)); // Currently testing first estimate
	fan_hole_offset_width 			= nano_fan_offset_width + (fan_hole_spacing_width / 2 + (fan_alignment_pin_outer_diameter / 2)); // Currently testing first estimate
	
	top_plate_length 				= nano_hole_spacing_length + top_post_outer_diameter + top_plate_left_length_modifier + top_plate_right_length_modifier;
	top_plate_width 				= nano_hole_spacing_width + top_post_outer_diameter + top_plate_front_width_modifier + top_plate_rear_width_modifier;
	top_plate_offset_height			= top_post_height;
	top_plate_offset_length 		= (top_plate_left_length_modifier);
	top_plate_offset_width 			= top_plate_rear_width_modifier;

	bottom_plate_length 			= nano_hole_spacing_length + top_post_outer_diameter + top_plate_left_length_modifier + top_plate_right_length_modifier;
	bottom_plate_width 				= nano_hole_spacing_width + top_post_outer_diameter + top_plate_front_width_modifier + top_plate_rear_width_modifier;
	bottom_plate_offset_height		= -nano_board_thickness - bottom_post_height - bottom_plate_thickness;
	bottom_plate_offset_length 		= (top_plate_left_length_modifier);
	bottom_plate_offset_width 		= top_plate_rear_width_modifier;

	front_plate_thickness 			= top_plate_thickness;
	front_plate_length 				= top_plate_length;
	front_plate_width 				= top_post_height;
	front_plate_offset_length 		= -top_plate_left_length_modifier;
	front_plate_offset_width 		= top_plate_width - top_plate_rear_width_modifier - front_plate_thickness;
	front_plate_offset_height 		= 0;
	
	rear_plate_thickness 			= top_plate_thickness;
	rear_plate_length 				= top_plate_length;
	rear_plate_width 				= top_post_height;
	rear_plate_offset_length 		= -top_plate_left_length_modifier;
	rear_plate_offset_width 		= -top_plate_rear_width_modifier;
	rear_plate_offset_height 		= 0;
	sd_card_hole_offset_length      = (rear_plate_length / 2) + (top_plate_left_length_modifier / 2) - (top_plate_right_length_modifier / 2);
	
	right_plate_thickness 			= top_plate_thickness;
	right_plate_length 				= top_post_height;
	right_plate_width 				= top_plate_width;
	right_plate_offset_length 		= -top_plate_left_length_modifier;
	right_plate_offset_width 		= -top_plate_rear_width_modifier;
	right_plate_offset_height 		= 0;
	
	left_plate_thickness 			= top_plate_thickness;
	left_plate_length 				= top_post_height;
	left_plate_width 				= right_plate_width;
	left_plate_offset_length 		= top_plate_length - top_plate_left_length_modifier - front_plate_thickness;
	left_plate_offset_width 		= -top_plate_rear_width_modifier;
	left_plate_offset_height 		= 0;
	
	/* This union represents the bottom assembly */
//	translate([0, 20, -bottom_plate_offset_height])
	union()
	{
		difference()
		{
			/* The bottom plate to which the bottom posts are connected */
			translate([-bottom_plate_offset_length, -bottom_plate_offset_width, bottom_plate_offset_height])
			bottom_plate(bottom_plate_length, bottom_plate_width, bottom_plate_thickness, bottom_post_height + nano_board_thickness);
							
			/* The hole inserts for the screw head */
			translate([0, 0, bottom_plate_offset_height - 1])
			four_posts((bottom_plate_thickness / 2) + 1, bottom_post_outer_diameter, 0, nano_hole_spacing_length, nano_hole_spacing_width);

			translate([(bottom_post_inner_diameter / 2), (bottom_post_inner_diameter / 2), bottom_plate_offset_height-1])
			four_posts(bottom_plate_thickness + 2, bottom_post_inner_diameter, 0, nano_hole_spacing_length, nano_hole_spacing_width);
		}
		/* The posts which go from the bottom of the Nano down */
		translate([0, 0, -nano_board_thickness-bottom_post_height])
		four_posts(bottom_post_height, bottom_post_outer_diameter, bottom_post_inner_diameter, nano_hole_spacing_length, nano_hole_spacing_width);
	}
	
	 /* This union represents the entire top assembly */
	 translate([0,0,top_post_height + top_plate_thickness])
	 rotate([180,0,0])
	 union()
	 {
		 difference()
		 {
			 /* All the solids */
			 union()
			 {
				 /* The top plate to which the top posts are connected */
				 translate([-top_plate_offset_length, -top_plate_offset_width, top_plate_offset_height])
				 top_plate(top_plate_length, top_plate_width, top_plate_thickness);

				 /* The posts which go from the top of the Nano up */
				 four_posts(top_post_height, top_post_outer_diameter, top_post_inner_diameter, nano_hole_spacing_length, nano_hole_spacing_width);


				
				 /* The posts which will hang down and align the cooling fan */
				 translate([nano_fan_offset_length, nano_fan_offset_width, (top_post_height - fan_alignment_pin_height)])
				 four_posts(fan_alignment_pin_height, fan_alignment_pin_outer_diameter, 0, fan_hole_spacing_length, fan_hole_spacing_width);



				 /* Front plate */
				 translate([front_plate_offset_length, front_plate_offset_width, front_plate_offset_height])
				 front_plate(front_plate_length, front_plate_width, front_plate_thickness);

				 /* Rear plate */
				 translate([rear_plate_offset_length, rear_plate_offset_width, rear_plate_offset_height])
				 rear_plate(rear_plate_length, rear_plate_width, rear_plate_thickness, sd_card_hole_offset_length);

				 /* Right side plate (40-pin ribbon cable) */
				 translate([right_plate_offset_length, right_plate_offset_width, right_plate_offset_height])
				 right_plate(right_plate_length, right_plate_width, right_plate_thickness);

				 /* Left side plate (Camera connector) */
				 translate([left_plate_offset_length, left_plate_offset_width, left_plate_offset_height])
				 left_plate(left_plate_length, left_plate_width, left_plate_thickness);
			 }
			 /* All the holes */
			 union()
			 {
				 fan_holes(fan_hole_offset_length, fan_hole_offset_width, top_post_height, top_plate_thickness);
			 }
		 }
	 }
}

module fan_holes(fan_offset_length, fan_offset_width, offset_height, thickness)
{
	fan_exhaust_diameter = 40;
	
	translate([fan_offset_length, fan_offset_width, -1 + offset_height])
	cylinder(h = thickness + 2, d = fan_exhaust_diameter);	
}

module top_plate(length, width, thickness)
{
	linear_extrude(height = thickness)
	square([length, width]);
}

module bottom_plate(length, width, thickness, edge_height)
{
	linear_extrude(height = thickness)
	square([length, width]);
	
	translate([0, 0, thickness])
	cube([length, thickness, edge_height]);

	//translate([0, width - thickness, thickness])
	//cube([length, thickness, edge_height]);

	translate([0, 0, thickness])
	cube([thickness, width, edge_height]);

	translate([length - thickness, 0, thickness])
	cube([thickness, width, edge_height]);
}

module front_plate(length, width, thickness)
{
	void_height = (14/16) * 25.4;

	difference()
	{
		cube([length,thickness,width]);
		
		translate([0,-1,-1])
		cube([length,(thickness + 2), void_height + 1]);
	}
}

module rear_plate(length, width, thickness, sd_card_hole_offset_length)
{
	void_length = (3/4) * 25.4;
	void_height = (0.5) * 25.4 - 2;
	void_offset_height = -0.1;
	void_offset_length_modifier = -(3/16) * 25.4;

	difference()
	{
		cube([length,thickness,width]);
		
		translate([sd_card_hole_offset_length + void_offset_length_modifier, -1, void_offset_height])
		cube([void_length,(thickness + 2), void_height + 1]);
	}
}

module right_plate(length, width, thickness)
{
	void_width = (2.25) * 25.4;
	void_height = (0.25) * 25.4;
	
	void_offset_width = 13;
	void_offset_height = (0.25) * 25.4;
	
	difference()
	{
		cube([thickness,width,length]);
		
		translate([-1,void_offset_width,void_offset_height])
		cube([(thickness + 2), void_width, void_height + 1]);
	}
}

module left_plate(length, width, thickness)
{
	void_width = (1.5) * 25.4;
	void_height = ((0.25) * 25.4) + 1;
	
	void_offset_width = 17;
	void_offset_height = (0.25) * 25.4;
	
	difference()
	{
		cube([thickness,width,length]);
		
		translate([-1,void_offset_width,void_offset_height])
		cube([(thickness + 2), void_width, void_height + 1]);
	}
}

