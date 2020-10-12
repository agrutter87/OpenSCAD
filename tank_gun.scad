tank_gun(8.5*25.4);

module tank_gun(length)
{
    outer_diameter = 9;
    inner_diameter = 4.5;
    
    receiver_width = 20;
    receiver_length = 40;
    receiver_height = length;
    receiver_width_offset = -(receiver_width / 2);
    receiver_length_offset = -(receiver_length / 1.5);
    receiver_height_offset = 0;
    
    grip_width = receiver_width;
    grip_length = 100;
    grip_height = 80;
    grip_width_offset = -(grip_width / 2);
    grip_length_offset = -grip_length + receiver_width_offset;
    grip_height_offset = 0;
    
    assembly_width_offset = 0;
    assembly_length_offset = 0;
    assembly_height_offset = -50;    
    
    rotate([90, 180, 0])
    difference()
    {
        translate([assembly_width_offset, assembly_length_offset, assembly_height_offset])
        union()
        {
            color("black", 1.0)
            translate([receiver_width_offset, receiver_length_offset, receiver_height_offset])
            cube([receiver_width, receiver_length, receiver_height], false);

            color("black", 1.0)
            translate([grip_width_offset, grip_length_offset, grip_height_offset])
            cube([grip_width, grip_length, grip_height], false);

            color("beige", 1.0)
            cylinder(length, d = outer_diameter, true);
        }
        cylinder(length, d = inner_diameter, true);
    }
}