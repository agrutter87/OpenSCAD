/* Developed by Alex Grutter */

$fn = 36;

four_posts_with_supports(10, 3, 2, 25, 50, 5, 1, [0,0,0,0], 1, true);

module four_posts(post_height, post_outer_diameter, post_inner_diameter, post_spacing_width, post_spacing_length){
    difference()
    {
		/* Outer part */
		union()
		{
            translate([0, 0, 0])
            {
                cylinder(h = post_height, d = post_outer_diameter);
            }
            translate([0, post_spacing_length + 0, 0])
            {
                cylinder(h = post_height, d = post_outer_diameter);
            }
            translate([post_spacing_width + 0, 0, 0])
            {
                cylinder(h = post_height, d = post_outer_diameter);
            }
            translate([post_spacing_width + 0, post_spacing_length + 0, 0])
            {
                cylinder(h = post_height, d = post_outer_diameter);
            }
		}
		/* Inner hole */
        union()
        {
            translate([0, 0, -1])
            {
                cylinder(h = post_height+2, d = post_inner_diameter);
            }
            translate([0, post_spacing_length + 0, -1])
            {
                cylinder(h = post_height+2, d = post_inner_diameter);
            }
            translate([post_spacing_width + 0, 0, -1])
            {
                cylinder(h = post_height+2, d = post_inner_diameter);
            }
            translate([post_spacing_width + 0, post_spacing_length + 0, -1])
            {
                cylinder(h = post_height+2, d = post_inner_diameter);
            }
        }
	}
};

module four_posts_with_supports(post_height, post_outer_diameter, post_inner_diameter, post_spacing_width, post_spacing_length, support_diameter, support_count, support_start_angle, support_thickness, flip){
    difference()
    {
		/* Outer part */
		union()
		{
            translate([0, 0, 0])
            {
                cylinder(h = post_height, d = post_outer_diameter);
				for(support = [0 : support_count])
				{
					if(flip)
					{
						translate([0, 0, post_height])
						rotate([support_start_angle[0] + ( support * (360 / support_count)),90,0])
						translate([0, 0, -(support_thickness / 2)])
						linear_extrude(support_thickness)
						polygon([[post_height, (post_inner_diameter / 2)],[0, (post_inner_diameter / 2)],[0,(support_diameter / 2)]], [[0,1,2]]);
					}
					else
					{
						rotate([support_start_angle[0] + ( support * (360 / support_count)),-90,0])
						translate([0, 0, -(support_thickness / 2)])
						linear_extrude(support_thickness)
						polygon([[post_height, (post_inner_diameter / 2)],[0, (post_inner_diameter / 2)],[0, (support_diameter / 2)]], [[0,1,2]]);
					}
				}
            }
            translate([0, post_spacing_length + 0, 0])
            {
                cylinder(h = post_height, d = post_outer_diameter);
				for(support = [0 : support_count])
				{
					if(flip)
					{
						translate([0, 0, post_height])
						rotate([support_start_angle[1] + ( support * (360 / support_count)),90,0])
						translate([0, 0, -(support_thickness / 2)])
						linear_extrude(support_thickness)
						polygon([[post_height, (post_inner_diameter / 2)],[0, (post_inner_diameter / 2)],[0,(support_diameter / 2)]], [[0,1,2]]);
					}
					else
					{
						rotate([support_start_angle[1] + ( support * (360 / support_count)),-90,0])
						translate([0, 0, -(support_thickness / 2)])
						linear_extrude(support_thickness)
						polygon([[post_height, (post_inner_diameter / 2)],[0, (post_inner_diameter / 2)],[0,(support_diameter / 2)]], [[0,1,2]]);
					}
				}
            }
            translate([post_spacing_width + 0, 0, 0])
            {
                cylinder(h = post_height, d = post_outer_diameter);
				for(support = [0 : support_count])
				{
					if(flip)
					{
						translate([0, 0, post_height])
						rotate([support_start_angle[2] + ( support * (360 / support_count)),90,0])
						translate([0, 0, -(support_thickness / 2)])
						linear_extrude(support_thickness)
						polygon([[post_height, (post_inner_diameter / 2)],[0, (post_inner_diameter / 2)],[0,(support_diameter / 2)]], [[0,1,2]]);
					}
					else
					{
						rotate([support_start_angle[2] + ( support * (360 / support_count)),-90,0])
						translate([0, 0, -(support_thickness / 2)])
						linear_extrude(support_thickness)
						polygon([[post_height, (post_inner_diameter / 2)],[0, (post_inner_diameter / 2)],[0,(support_diameter / 2)]], [[0,1,2]]);
					}
				}
            }
            translate([post_spacing_width + 0, post_spacing_length + 0, 0])
            {
                cylinder(h = post_height, d = post_outer_diameter);
				for(support = [0 : support_count])
				{
					if(flip)
					{
						translate([0, 0, post_height])
						rotate([support_start_angle[3] + ( support * (360 / support_count)),90,0])
						translate([0, 0, -(support_thickness / 2)])
						linear_extrude(support_thickness)
						polygon([[post_height, (post_inner_diameter / 2)],[0, (post_inner_diameter / 2)],[0,(support_diameter / 2)]], [[0,1,2]]);
					}
					else
					{
						rotate([support_start_angle[3] + ( support * (360 / support_count)),-90,0])
						translate([0, 0, -(support_thickness / 2)])
						linear_extrude(support_thickness)
						polygon([[post_height, (post_inner_diameter / 2)],[0, (post_inner_diameter / 2)],[0,(support_diameter / 2)]], [[0,1,2]]);
					}
				}
            }
		}
        
		/* Inner hole */
        union()
        {
            translate([0, 0, -1])
            {
                cylinder(h = post_height+2, d = post_inner_diameter);
            }
            translate([0, post_spacing_length + 0, -1])
            {
                cylinder(h = post_height+2, d = post_inner_diameter);
            }
            translate([post_spacing_width + 0, 0, -1])
            {
                cylinder(h = post_height+2, d = post_inner_diameter);
            }
            translate([post_spacing_width + 0, post_spacing_length + 0, -1])
            {
                cylinder(h = post_height+2, d = post_inner_diameter);
            }
        }
	}
};