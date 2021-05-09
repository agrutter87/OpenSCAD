
/* Examples for viewing */
hart_40v_battery_interface_inner();
//hart_40v_battery_interface_outer();

track_length 				= 101.8;

track_width					= 63.0;

track_depth					= 13.9;
track_depth_inner_offset	= 5.0;
track_inner_depth_major 	= 7.8; 
track_inner_depth_minor		= 6.6;
track_outer_depth_major		= track_depth - track_inner_depth_minor;
track_outer_depth_minor		= track_depth - track_inner_depth_major;

module hart_40v_battery_interface_inner()
{
	/* TODO: Remove, for testing inner sizes for fit */
	track_length = 5;

	color("blue")
	translate([0, 0, 0])
	difference()
	{
		/* Main body */
		cube([track_length, track_width, track_depth]);
		
		/* First cutout */
		translate([0, track_width + 1, -1])
		rotate([90,0,0])
		linear_extrude(track_depth_inner_offset + 1)
		polygon(points = [ [0,0], [0,track_inner_depth_minor + 2], [track_length + 2,track_inner_depth_minor + 3.5], [track_length + 2,0], [0,0] ]);

		/* Second cutout */
		translate([0, track_depth_inner_offset, -1])
		rotate([90,0,0])
		linear_extrude(track_depth_inner_offset + 1)
		polygon(points = [ [0,0], [0,track_inner_depth_minor + 2], [track_length + 2,track_inner_depth_minor + 3.5], [track_length + 2,0], [0,0] ]);

	}
}

module hart_40v_battery_interface_outer()
{
	/* TODO: Remove, for testing inner sizes for fit */
	track_length = 5;

	color("red")
	translate([0, 0, 0])
	difference()
	{
		/* Main body */
		translate([1, 0, 1])
		cube([track_length - 2, (track_width * 1.2), track_depth + 5]);
		
		/* First cutout */
		color("blue")
		translate([0, (track_width * 0.1), 0])
		difference()
		{
			/* Main body */
			translate([0, -1, 0])
			cube([track_length, track_width + 2, track_depth]);
			
			/* First cutout */
			translate([-1, track_width - track_depth_inner_offset + 1, -1])
			cube([track_length + 2, track_depth_inner_offset, track_inner_depth_minor + 1]);
			
			/* Second cutout */
			translate([-1, -1, -1])
			cube([track_length + 2, track_depth_inner_offset, track_inner_depth_minor + 1]);
		}
	}
}