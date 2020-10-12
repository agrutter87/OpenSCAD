/* Developed by Alex Grutter */

$fn = 36;

//triangle_side_plate(10, 10, 30, 10);

MILS_TO_MM = 0.0254;


eli156_iphw_length = 14.41 + 101.57 + 215.138 + (8470 * MILS_TO_MM) + 47.6 + 14.41;
eli156_iphw_width  = 13.95 + 19.22 + (4540 * MILS_TO_MM) + 81.65 + 20;

J_channel_plate(3, eli156_iphw_length, eli156_iphw_width, 20, 20);

/******************************************************************************
* J-shaped Plate
******************************************************************************/
module J_channel_plate(thickness, length, width, j_channel_width, j_channel_depth)
{
	point_ax = 0;
	point_ay = 0;
	point_bx = 0;
	point_by = width;
	point_cx = j_channel_width + (2 * thickness);
	point_cy = width;
	point_dx = j_channel_width + (2 * thickness);
	point_dy = width - j_channel_depth - thickness;
	point_ex = j_channel_width + thickness;
	point_ey = width - j_channel_depth - thickness;
	point_fx = j_channel_width + thickness;
	point_fy = width - thickness;
	point_gx = thickness;
	point_gy = width - thickness;
	point_hx = thickness;
	point_hy = 0;

	//translate([0,-(length / 2),width])
	//rotate([-90,0,0])
	linear_extrude(height = length)
	polygon([[point_ax, point_ay], [point_bx, point_by], [point_cx, point_cy], [point_dx, point_dy], [point_ex, point_ey], [point_fx, point_fy], [point_gx, point_gy], [point_hx, point_hy]]);
}

/******************************************************************************
* H-shaped Plate
******************************************************************************/
module H_shaped_plate(thickness, outer_length, outer_width, inner_length, inner_offset_width_1, inner_offset_width_2)
{
	length_offset  = 	(outer_length - inner_length) / 2;
	width_offset_1 =	(outer_width - inner_offset_width_1);
	width_offset_2 =	0;
	linear_extrude(height = thickness)
	
	difference()
	{
		square([outer_length, outer_width]);
		
		translate([length_offset,width_offset_1,0])
		square([inner_length, inner_offset_width_1]);

		translate([length_offset,0,0])
		square([inner_length, inner_offset_width_2]);
	}
}

/******************************************************************************
* Triangular Side Plate
******************************************************************************/
module triangle_side_plate(length, width, angle, thickness, hole)
{	
	/* Use right triangle trig to find values */
	h = width * sin(angle);
	l1 = sqrt((width ^ 2)-(h ^ 2));
	l2 = length - l1;
	w2 = sqrt((l2 ^ 2) + (h ^ 2));

	/* Find the other angles */
	b = asin(h / w2);
	a1 = 90 - angle;
	a2 = 90 - b;
	a3 = (a2 - a1) / 2;
	a = a1 + a2;
	
	outer_point1_x = 0;
	outer_point1_y = 0;
	outer_point2_x = 0;
	outer_point2_y = length;
	outer_point3_x = width * sin(angle);
	outer_point3_y = width * cos(angle);
	
	inner_point1_x = outer_point1_x + thickness;
	inner_point1_y = outer_point1_y + thickness / tan(angle / 2);
	inner_point2_x = outer_point2_x + thickness;
	inner_point2_y = outer_point2_y - (thickness / tan(b / 2));
	inner_point3_x = outer_point3_x - ((thickness / sin(a / 2)) * cos(a3));
	inner_point3_y = outer_point3_y + ((thickness / sin(a / 2)) * sin(a3));
	
	/*
	echo(outer_point1_x - inner_point1_x);
	echo(outer_point2_x - inner_point2_x);
	echo(outer_point3_x - inner_point3_x);
	
	echo(outer_point1_y - inner_point1_y);
	echo(outer_point2_y - inner_point2_y);
	echo(outer_point3_y - inner_point3_y);
	*/
	
	rotate([0,-90,0])
	linear_extrude(height = thickness)
	difference()
	{
		polygon([[outer_point1_x, outer_point1_y], [outer_point2_x, outer_point2_y], [outer_point3_x, outer_point3_y]]);
		
		/* Only cut out center if there is room */
		if(hole && (inner_point3_x > inner_point2_x))
		{
			polygon([[inner_point1_x, inner_point1_y], [inner_point2_x, inner_point2_y], [inner_point3_x, inner_point3_y]]);
		}
	}
}

/******************************************************************************
* V-shaped Side Plate
******************************************************************************/
module v_side_plate(length, width, angle, thickness, hole)
{	
	/* Use right triangle trig to find values */
	h = width * sin(angle);
	l1 = sqrt((width ^ 2)-(h ^ 2));
	l2 = length - l1;
	w2 = sqrt((l2 ^ 2) + (h ^ 2));

	/* Find the other angles */
	b = asin(h / w2);
	a1 = 90 - angle;
	a2 = 90 - b;
	a3 = (a2 - a1) / 2;
	a = a1 + a2;
	
	outer_point1_x = 0;
	outer_point1_y = 0;
	outer_point2_x = 0;
	outer_point2_y = length;
	outer_point3_x = width * sin(angle);
	outer_point3_y = width * cos(angle);
	
	inner_point1_x = outer_point1_x + thickness;
	inner_point1_y = outer_point1_y + thickness / tan(angle / 2);
	inner_point2_x = outer_point2_x + thickness;
	inner_point2_y = outer_point2_y - (thickness / tan(b / 2));
	inner_point3_x = outer_point3_x - ((thickness / sin(a / 2)) * cos(a3));
	inner_point3_y = outer_point3_y + ((thickness / sin(a / 2)) * sin(a3));
	
	/*
	echo(outer_point1_x - inner_point1_x);
	echo(outer_point2_x - inner_point2_x);
	echo(outer_point3_x - inner_point3_x);
	
	echo(outer_point1_y - inner_point1_y);
	echo(outer_point2_y - inner_point2_y);
	echo(outer_point3_y - inner_point3_y);
	*/
	
	rotate([0,-90,0])
	linear_extrude(height = thickness)
	difference()
	{
		polygon([[outer_point1_x, outer_point1_y], [outer_point2_x, outer_point2_y], [outer_point3_x, outer_point3_y]]);
		
		/* Only cut out center if there is room */
		if(hole && (inner_point3_x > inner_point2_x))
		{
			polygon([[inner_point1_x, inner_point1_y], [inner_point2_x, inner_point2_y], [inner_point3_x, inner_point3_y]]);
		}
	}
}