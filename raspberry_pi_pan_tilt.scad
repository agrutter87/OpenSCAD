use <servo_sg90.scad>

raspberry_pi_pan_tilt_base__base_height = 3;
raspberry_pi_pan_tilt_base__bottom_servo_mount_height = 7;

raspberry_pi_pan_tilt(6.5, 0, 0);

module raspberry_pi_pan_tilt(bottom_mount_offset, pan_angle, tilt_angle)
{
    bottom_servo_height_offset = 10;
    
    bottom_servo_housing_width = 26.7;
    bottom_servo_housing_length = 30;
    bottom_servo_housing_height = 10;
    bottom_servo_housing_mount_height = 40;
    bottom_servo_housing_length_offset = -5.2;
    bottom_servo_housing_height_offset = bottom_servo_height_offset + 10.8;
    
    top_servo_width_offset = -(26.7 / 2);//-15;
    top_servo_length_offset = -25;
    top_servo_height_offset = 55;

    top_servo_housing_width = 40;
    top_servo_housing_length = 3;
    top_servo_housing_height = 26.7;
    top_servo_housing_width_offset = -5.2;
    top_servo_housing_length_offset = -5.9 - (top_servo_housing_length / 2);
    top_servo_housing_height_offset = 0;
    
    raspberry_pi_pan_tilt_base(bottom_mount_offset);

    rotate([0, 0, pan_angle])
    union()
    {
        rotate([0, 0, 90])
        translate([0, 0, bottom_servo_height_offset])
        servo_sg90();
        
        translate([0, bottom_servo_housing_length_offset, bottom_servo_housing_height_offset])
        raspberry_pi_pan_tilt_bottom_servo_housing(bottom_servo_housing_width, bottom_servo_housing_length, bottom_servo_housing_height, bottom_servo_housing_mount_height);

        rotate([90, 90, 90])
        translate([-top_servo_height_offset, top_servo_length_offset, top_servo_width_offset])
        rotate([0, 0, tilt_angle])
        union()
        {
            servo_sg90();
            
            translate([top_servo_housing_width_offset, top_servo_housing_length_offset, top_servo_housing_height_offset])
            raspberry_pi_pan_tilt_top_servo_housing(top_servo_housing_width, top_servo_housing_length, top_servo_housing_height);
        }
    }
}

module raspberry_pi_pan_tilt_base(bottom_mount_offset)
{
    base_width = 33;
    base_length = 37;
    base_height = 3;
    
    mounting_hole_width = 26;
    mounting_hole_length = 30;
    
    mounting_hole_diameter = 2.75;
    mounting_hole_width_offset = (base_width - mounting_hole_width) / 2;
    mounting_hole_length_offset = (base_length - mounting_hole_length) / 2;
    
    bottom_servo_mount_height = 7;
    bottom_servo_mount_outer_diameter = 20;
    bottom_servo_mount_inner_diameter = 11.8;
    
    bottom_servo_mount_width_offset = base_width / 2;
    bottom_servo_mount_length_offset = bottom_mount_offset + (base_width / 2);
    bottom_servo_mount_height_offset = base_height;

    translate([-(bottom_servo_mount_width_offset), -(bottom_servo_mount_length_offset), 0])
    color("black", 1.0)
    union()
    {
        difference()
        {
            cube([base_width, base_length, base_height], false);
            
            translate([mounting_hole_width_offset, mounting_hole_length_offset, 0])
            cylinder(base_height * 2, d = mounting_hole_diameter, true);

            translate([base_width - mounting_hole_width_offset, mounting_hole_length_offset, 0])
            cylinder(base_height * 2, d = mounting_hole_diameter, true);

            translate([mounting_hole_width_offset, base_length - mounting_hole_length_offset, 0])
            cylinder(base_height * 2, d = mounting_hole_diameter, true);

            translate([base_width - mounting_hole_width_offset, base_length - mounting_hole_length_offset, 0])
            cylinder(base_height * 2, d = mounting_hole_diameter, true);
        }
        
        translate([bottom_servo_mount_width_offset, bottom_servo_mount_length_offset, bottom_servo_mount_height_offset])
        difference()
        {
            cylinder(bottom_servo_mount_height, d = bottom_servo_mount_outer_diameter);
            cylinder(bottom_servo_mount_height, d = bottom_servo_mount_inner_diameter);
        }
    }
}

module raspberry_pi_pan_tilt_bottom_servo_housing(housing_width, housing_length, housing_height, mount_height)
{
    thickness = 3.2;
    
    color("black", 1.0)
    translate([-(housing_width / 2), -(housing_length / 2), 0])
    union()
    {
        cube([housing_width, housing_length, housing_height], false);
        
        translate([-thickness, 0, 0])
        cube([thickness, housing_length, mount_height]);

        translate([housing_width, 0, 0])
        cube([thickness, housing_length, mount_height]);
    }
}

module raspberry_pi_pan_tilt_top_servo_housing(housing_width, housing_length, housing_height)
{
    color("black", 1.0)
    translate([-(housing_width / 2), -(housing_length / 2), 0])
    cube([housing_width, housing_length, housing_height], false);
}