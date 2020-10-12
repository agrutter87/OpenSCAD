servo_sg90();

module servo_sg90()
{
    width = 22.5;
    length = 11.8;
    height = 22.7;
    
    mounting_width = width + (2 * 4.7);
    mounting_length = length;
    mounting_height = 2.5;
    mounting_width_offset = -4.7;
    mounting_height_offset = 18.4 - mounting_height;
    
    mounting_hole_diameter = 2;
    mounting_hole_width_offset = 2.3;
    mounting_hole_length_offset = 5.9;
    
    mounting_notch_width = mounting_hole_width_offset;
    mounting_notch_length = 1.3;
    mounting_notch_width_offset = mounting_notch_width / 2;
    
    mount_point_height = 4;
    mount_point_diameter = 11.8;
    mount_point_width_offset = 5.9;
    mount_point_length_offset = length / 2;
    mount_point_height_offset = height;
    
    gear_height = 3.2;
    gear_diameter = 4.6;
    gear_width_offset = mount_point_width_offset;
    gear_length_offset = mount_point_length_offset;
    gear_height_offset = mount_point_height_offset + mount_point_height;
    
    rotate([0, 180, 0])
    translate([-(gear_width_offset), -(gear_length_offset), -(height + mount_point_height)])
    union()
    {
        color("blue", 1.0)
        cube([width, length, height], false);
        
        color("blue", 1.0)
        translate([mounting_width_offset, 0, mounting_height_offset])
        difference()
        {
            cube([mounting_width, mounting_length, mounting_height], false);
            
            translate([mounting_hole_width_offset, mounting_hole_length_offset, 0])
            cylinder(height, d = mounting_hole_diameter);
            
            translate([mounting_width - mounting_hole_width_offset, mounting_hole_length_offset, 0])
            cylinder(height, d = mounting_hole_diameter);
            
            translate([mounting_notch_width_offset, mounting_hole_length_offset, 0])
            cube([mounting_notch_width, mounting_notch_length, height], true);

            translate([mounting_width - mounting_notch_width_offset, mounting_hole_length_offset, 0])
            cube([mounting_notch_width, mounting_notch_length, height], true);
        }
        
        color("blue", 1.0)
        translate([mount_point_width_offset, mount_point_length_offset, mount_point_height_offset])
        cylinder(mount_point_height, d = mount_point_diameter);
        
        color("white", 1.0)
        translate([gear_width_offset, gear_length_offset, gear_height_offset])
        cylinder(gear_height, d = gear_diameter);
    }
}