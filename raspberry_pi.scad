raspberry_pi(2);

module raspberry_pi(model)
{
    board_width = 56;
    board_length = model==1?65:model==2?85:85;
    board_height = 1.6;
    
    mounting_pad_diameter = 6;
    mounting_hole_diameter = 2.75;
    mounting_hole_width_offset = 3.5;
    mounting_hole_length_offset_1 = 3.5;
    mounting_hole_length_offset_2 = mounting_hole_length_offset_1 + 58; 
    
    usb_height_variation = model==1?7:model==2?16:16;
    usb_width_offset_variation = model==1?31.5:model==2?29:29;
    
    usb_width = 14;
    usb_length = 16;
    usb_height = usb_height_variation - board_height;
    usb_length_offset = board_length - usb_length;
    usb_1_width_offset = board_width - usb_width_offset_variation - (usb_width / 2);
    usb_2_width_offset = board_width - 47 - (usb_width / 2);
    
    eth_width = 15;
    eth_length = 20;
    eth_height = 13.5 - board_height;
    eth_width_offset = board_width - 10.25 - (eth_width / 2);
    eth_length_offset = board_length - eth_length;
    
    usb_power_width = 6;
    usb_power_length = 7;
    usb_power_height = 2;
    usb_power_length_offset = 10.6 - (usb_power_length / 2);
    usb_power_width_overhang = 1;
    usb_power_width_offset = board_width - usb_power_width + usb_power_width_overhang;

    hdmi_width = 13;
    hdmi_length = 16;
    hdmi_height = 6.5 - board_height;
    hdmi_overhang = 2;
    hdmi_length_offset = 32 - (hdmi_length / 2);
    hdmi_width_offset = board_width - hdmi_width + hdmi_overhang;
    
    header_width = 6;
    header_length = 50;
    header_height = 8.5 - board_height;
    header_length_offset = mounting_hole_length_offset_1 + 29 - (header_length / 2);
    header_width_offset = mounting_hole_width_offset - (header_width / 2);;

    camera_width = 23;
    camera_length = 3;
    camera_height = 5.5 - board_height;
    camera_length_offset = 32 + 13 - (camera_length / 2);
    camera_width_offset = board_width - 11.5 - (camera_width / 2);
    
    display_width = 23;
    display_length = 3;
    display_height = 5.5 - board_height;
    display_length_offset = mounting_hole_width_offset - (camera_length / 2);
    display_width_offset = board_width - 28 - (camera_width / 2);
    
    audio_width = 16;
    audio_length = 8;
    audio_height = 6 - board_height;
    audio_overhang = 3;
    audio_length_offset = 53.5 - (audio_length / 2);
    audio_width_offset = board_width - audio_width + audio_overhang;
    
    translate([-(board_width / 2), -(board_length / 2), 0])
    union()
    {
        difference()
        {
            union()
            {
                difference()
                {
                    color("green", 1.0)
                    cube([board_width, board_length, board_height]);

                    translate([mounting_hole_width_offset, mounting_hole_length_offset_1, 0])
                    cylinder(board_height * 2, d = mounting_pad_diameter, true);

                    translate([board_width - mounting_hole_width_offset, mounting_hole_length_offset_1, 0])
                    cylinder(board_height * 2, d = mounting_pad_diameter, true);

                    translate([mounting_hole_width_offset, mounting_hole_length_offset_2, 0])
                    cylinder(board_height * 2, d = mounting_pad_diameter, true);

                    translate([board_width - mounting_hole_width_offset, mounting_hole_length_offset_2, 0])
                    cylinder(board_height * 2, d = mounting_pad_diameter, true);
                }
                color("gold", 1.0)
                {
                    translate([mounting_hole_width_offset, mounting_hole_length_offset_1, 0])
                    cylinder(board_height, d = mounting_pad_diameter, true);

                    translate([board_width - mounting_hole_width_offset, mounting_hole_length_offset_1, 0])
                    cylinder(board_height, d = mounting_pad_diameter, true);

                    translate([mounting_hole_width_offset, mounting_hole_length_offset_2, 0])
                    cylinder(board_height, d = mounting_pad_diameter, true);

                    translate([board_width - mounting_hole_width_offset, mounting_hole_length_offset_2, 0])
                    cylinder(board_height, d = mounting_pad_diameter, true);
                }
            }
            translate([mounting_hole_width_offset, mounting_hole_length_offset_1, 0])
            cylinder(board_height * 2, d = mounting_hole_diameter, true);

            translate([board_width - mounting_hole_width_offset, mounting_hole_length_offset_1, 0])
            cylinder(board_height * 2, d = mounting_hole_diameter, true);

            translate([mounting_hole_width_offset, mounting_hole_length_offset_2, 0])
            cylinder(board_height * 2, d = mounting_hole_diameter, true);

            translate([board_width - mounting_hole_width_offset, mounting_hole_length_offset_2, 0])
            cylinder(board_height * 2, d = mounting_hole_diameter, true);
        }
        
        if(model == 2)
        {
            color("silver", 1.0)
            translate([eth_width_offset, eth_length_offset, board_height])
            cube([eth_width, eth_length, eth_height]);

            color("silver", 1.0)
            translate([usb_2_width_offset, usb_length_offset, board_height])
            cube([usb_width, usb_length, usb_height]);
        }

        color("silver", 1.0)
        translate([usb_1_width_offset, usb_length_offset, board_height])
        cube([usb_width, usb_length, usb_height]);

        color("silver", 1.0)
        translate([usb_power_width_offset, usb_power_length_offset, board_height])
        cube([usb_power_width, usb_power_length, usb_power_height]);

        color("silver", 1.0)
        translate([hdmi_width_offset, hdmi_length_offset, board_height])
        cube([hdmi_width, hdmi_length, hdmi_height]);

        color("gold", 1.0)
        translate([header_width_offset, header_length_offset, board_height])
        cube([header_width, header_length, header_height]);
        
        color("black", 1.0)
        translate([camera_width_offset, camera_length_offset, board_height])
        cube([camera_width, camera_length, camera_height]);
        
        color("black", 1.0)
        translate([display_width_offset, display_length_offset, board_height])
        cube([display_width, display_length, display_height]);

        color("black", 1.0)
        translate([audio_width_offset, audio_length_offset, board_height])
        cube([audio_width, audio_length, audio_height]);
    }
}