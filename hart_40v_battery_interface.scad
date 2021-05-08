
/* Examples for viewing */
hart_mower_battery_interface();

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