maker_focus_pan_tilt_hat();

module maker_focus_pan_tilt_hat()
{
    board_width = 56.6;
    board_length = 65;
    board_height = 1.6;
    
    mounting_pad_diameter = 6;
    mounting_hole_diameter = 2.75;
    mounting_hole_width_offset_1 = 4.1;
    mounting_hole_width_offset_2 = 3.5;
    mounting_hole_length_offset_1 = 3.5;
    mounting_hole_length_offset_2 = mounting_hole_length_offset_1 + 58; 
    
    header_width = 6;
    header_length = 50;
    header_height = 8.5 - board_height;
    header_length_offset = mounting_hole_length_offset_1 + 29 - (header_length / 2);
    header_width_offset = mounting_hole_width_offset_1 - (header_width / 2);;

    translate([-(board_width / 2), -(board_length / 2), 0])
    union()
    {
        difference()
        {
            union()
            {
                difference()
                {
                    color("blue", 1.0)
                    cube([board_width, board_length, board_height]);

                    translate([mounting_hole_width_offset_1, mounting_hole_length_offset_1, 0])
                    cylinder(board_height * 2, d = mounting_pad_diameter, true);

                    translate([board_width - mounting_hole_width_offset_2, mounting_hole_length_offset_1, 0])
                    cylinder(board_height * 2, d = mounting_pad_diameter, true);

                    translate([mounting_hole_width_offset_1, mounting_hole_length_offset_2, 0])
                    cylinder(board_height * 2, d = mounting_pad_diameter, true);

                    translate([board_width - mounting_hole_width_offset_2, mounting_hole_length_offset_2, 0])
                    cylinder(board_height * 2, d = mounting_pad_diameter, true);
                }
                color("gold", 1.0)
                {
                    translate([mounting_hole_width_offset_1, mounting_hole_length_offset_1, 0])
                    cylinder(board_height, d = mounting_pad_diameter, true);

                    translate([board_width - mounting_hole_width_offset_2, mounting_hole_length_offset_1, 0])
                    cylinder(board_height, d = mounting_pad_diameter, true);

                    translate([mounting_hole_width_offset_1, mounting_hole_length_offset_2, 0])
                    cylinder(board_height, d = mounting_pad_diameter, true);

                    translate([board_width - mounting_hole_width_offset_2, mounting_hole_length_offset_2, 0])
                    cylinder(board_height, d = mounting_pad_diameter, true);
                }
            }
            translate([mounting_hole_width_offset_1, mounting_hole_length_offset_1, 0])
            cylinder(board_height * 2, d = mounting_hole_diameter, true);

            translate([board_width - mounting_hole_width_offset_2, mounting_hole_length_offset_1, 0])
            cylinder(board_height * 2, d = mounting_hole_diameter, true);

            translate([mounting_hole_width_offset_1, mounting_hole_length_offset_2, 0])
            cylinder(board_height * 2, d = mounting_hole_diameter, true);

            translate([board_width - mounting_hole_width_offset_2, mounting_hole_length_offset_2, 0])
            cylinder(board_height * 2, d = mounting_hole_diameter, true);
        }
        
        color("gold", 1.0)
        translate([header_width_offset, header_length_offset, board_height])
        cube([header_width, header_length, header_height]);
    }
}