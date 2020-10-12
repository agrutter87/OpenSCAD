/* Handle length in inches */
handle_length_inches = 6.75;

/* Handle depth is the distance from the blade end to the opposite side, in inches */
handle_depth_inches = 1 + (15/16);
handle_depth_inches = 1 + (13/16);

/* Handle width is the distance from one flat side of the blade to the opposite side, in inches */
handle_width_inches = 1;
handle_width_inches = 12/16;

/* Blade depth is the distance from the blade end to the opposite side, in inches */
blade_depth_inches = 1 + (6/16);
blade_depth_inches = 1 + (7/16);

/* Blade width is the distance from one flat side of the blade to the opposite side, in inches */
blade_width_inches = 1/16;

blade_handle_offset = 2/16 * 25.4;

/* This is the outer hole that has to be big enough to fit the head of a screw/bolt */
mounting_hole_outer_diameter_inches = 0.375;

/* This is the inner hole that has to be big enough to fit the threaded part of a screw/bolt, but small enough to catch the head */
mounting_hole_inner_diameter_inches = 0.1875;

/* This is the depth from the furthest point out to the surface which catches the head of the bolt */
mounting_hole_depth_inches = 0.150;

color("grey")
sword_handle(handle_length_inches, 
             handle_depth_inches, 
             handle_width_inches, 
             blade_depth_inches, 
             blade_width_inches, 
             mounting_hole_outer_diameter_inches, 
             mounting_hole_inner_diameter_inches,
             mounting_hole_depth_inches);

/*********************************************************************************************
* MODULE 	sword_handle
*********************************************************************************************/
module sword_handle(handle_length_inches, 
                    handle_depth_inches, 
                    handle_width_inches, 
                    blade_depth_inches, 
                    blade_width_inches,
                    mounting_hole_outer_diameter_inches,
                    mounting_hole_inner_diameter_inches,
                    mounting_hole_depth_inches)
{
    $fn = 36;
    
    handle_length = handle_length_inches * 25.4;
    handle_depth = handle_depth_inches * 25.4;
    handle_width = handle_width_inches * 25.4;
    
    blade_depth = blade_depth_inches * 25.4;
    blade_width = blade_width_inches * 25.4;
	
	/* Complex shape using multiple points. Referenced paper graph */
	o = [blade_depth,				handle_length + 1				];
	a = [blade_depth, 				(3/4) * 25.4					];
	b = [blade_depth, 				(2/4) * 25.4					];
	c = [blade_depth,				(1/4) * 25.4					];
	d = [blade_depth - (3/32)*25.4, (-1)		 					];
	e = [0,							(-1)		 					];
	e = [-((1/16)*25.4),			(-1)		 					];
	f = [(1/32)*25.4, 				(1/4) * 25.4					];
	f = [-(1/16)*25.4, 				(1/4) * 25.4					];
	g = [(2/32)*25.4, 				((2/4) - (1/16)) * 25.4			];
	g = [-(1/16)*25.4, 				((2/4) - (2/16)) * 25.4			];
	h = [0, 						((2/4) + (1/16)) * 25.4			];
	h = [-(1/16)*25.4,				((2/4) + (1/16)) * 25.4			];
	i = [-(1/16)*25.4, 				((2/4) + (3/16)) * 25.4			];
	i = [-(1/16)*25.4,				((2/4) + (3/16)) * 25.4			];
	j = [(3/16)*25.4,				(4/4) * 25.4					];
	k = [(4/16)*25.4,				(5/4) * 25.4					];
	l = [(4/16)*25.4,				handle_length - (1/4) * 25.4	];
	m = [(1/16)*25.4,				handle_length + 1				];
	
	blade_shape = [o, a, b, c, d, e, f, g, h, i, j, k, l, m, o];
    	
    mounting_hole_outer_diameter = mounting_hole_outer_diameter_inches * 25.4;
    mounting_hole_inner_diameter = mounting_hole_inner_diameter_inches * 25.4;
    mounting_hole_depth = mounting_hole_depth_inches * 25.4;
	
	//mounting_hole_1_length_offset = (mounting_hole_outer_diameter / 2);
	mounting_hole_1_length_offset = (5/8) * 25.4;
	mounting_hole_1_width_offset  = (1/16) * 25.4;
	mounting_hole_2_length_offset = ((5/8) + (3 + (11/16))) * 25.4 ;
	
	difference()
	{
		union()
		{
			/* This is the first half of the handle, minus other features */
			difference()
			{
				/* This is the actual handle. Its a cylinder scaled on one axis to make an oval cylinder */
				scale([(handle_width / handle_depth), 1, 1])
				cylinder(handle_length, d = handle_depth, false);
				
				/* This is the hole where the blade handle goes */
				translate([(blade_width / 2), -(blade_depth / 2) - blade_handle_offset, 0])
				rotate([90,0,90])
				linear_extrude(height = blade_width + 1, center = true, convexity = 0, twist = 0, slices = 1, scale = 1.0)
				polygon(points = blade_shape, convexity = 1);
				//cube([blade_width, blade_depth, handle_length + 2], false);
				
				/* This is the first mounting hole */
				translate([0, -mounting_hole_1_width_offset, mounting_hole_1_length_offset])
				sword_handle_mounting_hole(handle_width, mounting_hole_depth, mounting_hole_outer_diameter, mounting_hole_inner_diameter);

				/* This is the second mounting hole */
				translate([0, 0, mounting_hole_2_length_offset])
				sword_handle_mounting_hole(handle_width, mounting_hole_depth, mounting_hole_outer_diameter, mounting_hole_inner_diameter);
				
				/* This cuts it cross-sectionally to remove half */
				translate([-(handle_width / 2), -(handle_depth / 2), -1])
				cube([handle_width / 2, handle_depth, handle_length + 2], false);
			}

			// /* This is the first half of the handle, minus other features */
			rotate([0,0,180])
			translate([0,handle_depth + 2,0])
			difference()
			{
				/* This is the actual handle. Its a cylinder scaled on one axis to make an oval cylinder */
				scale([(handle_width / handle_depth), 1, 1])
				cylinder(handle_length, d=handle_depth, false);
				
				/* This is the hole where the blade handle goes */
				translate([-(blade_width / 2), -(blade_depth / 2) - blade_handle_offset, 0])
				rotate([90,0,90])
				linear_extrude(height = blade_width + 1, center = true, convexity = 0, twist = 0, slices = 1, scale = 1.0)
				polygon(points = blade_shape, convexity = 1);
				//square([blade_depth, handle_length + 2]);
				//cube([blade_width, blade_depth, handle_length + 2], false);

				/* This is the first mounting hole */
				translate([0, -mounting_hole_1_width_offset,mounting_hole_1_length_offset])
				sword_handle_mounting_hole(handle_width, mounting_hole_depth, mounting_hole_outer_diameter, mounting_hole_inner_diameter);

				/* This is the second mounting hole */
				translate([0, 0, mounting_hole_2_length_offset])
				sword_handle_mounting_hole(handle_width, mounting_hole_depth, mounting_hole_outer_diameter, mounting_hole_inner_diameter);
				
				/* This is the hole where the blade handle goes */
				translate([0, -(handle_depth / 2), -1])
				cube([handle_width / 2, handle_depth, handle_length + 2], false);
			}

			// // /* This is the first half of the handle, minus other features */
			// rotate([0,0,180])
			// translate([0,(2 * (handle_depth + 2)),0])
			// difference()
			// {
				// /* This is the actual handle. Its a cylinder scaled on one axis to make an oval cylinder */
				// scale([(handle_width / handle_depth), 1, 1])
				// //cylinder(handle_length, d=handle_depth, false);
				// polyhedron();
				
				// /* This is the hole where the blade handle goes */
				// translate([-(blade_width / 2), -(blade_depth / 2), 0])
				// rotate([90,0,90])
				// linear_extrude(height = blade_width + 1, center = true, convexity = 0, twist = 0, slices = 1, scale = 1.0)
				// polygon(points = blade_shape, convexity = 1);
				// //square([blade_depth, handle_length + 2]);
				// //cube([blade_width, blade_depth, handle_length + 2], false);

				// /* This is the first mounting hole */
				// translate([0, -mounting_hole_1_width_offset *50, mounting_hole_1_length_offset])
				// sword_handle_mounting_hole(handle_width, mounting_hole_depth, mounting_hole_outer_diameter, mounting_hole_inner_diameter);

				// /* This is the second mounting hole */
				// translate([0, 0, mounting_hole_2_length_offset])
				// sword_handle_mounting_hole(handle_width, mounting_hole_depth, mounting_hole_outer_diameter, mounting_hole_inner_diameter);
				
				// /* This is the hole where the blade handle goes */
				// translate([0, -(handle_depth / 2), -1])
				// cube([handle_width / 2, handle_depth, handle_length + 2], false);
			// }
		}		
		
		sword_handle_finger_grips(handle_width);
	}
};

/*********************************************************************************************
* MODULE 	sword_handle_mounting_hole
*********************************************************************************************/
module sword_handle_mounting_hole(handle_width,
							      mounting_hole_depth, 
								  mounting_hole_outer_diameter, 
								  mounting_hole_inner_diameter)
{
	/* This is the first mounting hole, left side */
	translate([(handle_width / 2), 0, 0])
	{
		rotate([90, 0, -90])
		{
			cylinder(mounting_hole_depth, d=mounting_hole_outer_diameter, false);
		}
		
		rotate([90, 0, -90])
		{
			cylinder((handle_width / 2), d=mounting_hole_inner_diameter, false);
		}
	}
	
	/* This is the first mounting hole, right side */
	translate([-(handle_width / 2), 0, 0])
	{
		rotate([90, 0, 90])
		{
			cylinder(mounting_hole_depth, d=mounting_hole_outer_diameter, false);
		}
		
		rotate([90, 0, 90])
		{
			cylinder((handle_width / 2), d=mounting_hole_inner_diameter, false);
		}
	}
}


module sword_handle_finger_grips(handle_width, frequency)
{
	for (angle=[0:10:360])
	{
		echo(sin(angle));
	}
}

function select(vector,indices) = [ for (index = indices) vector[index] ];
