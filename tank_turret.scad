use <raspberry_pi_assembly.scad>
use <tank_gun.scad>

tank_turret(100, 180, 80, 0, 0, 0, 0);

module tank_turret(width, length, height, camera_pan, camera_tilt, turret_pan, tank_gun_tilt)
{
    tank_turret_thickness = 3;
    tank_turret_alpha = 0.5;
    
    raspberry_pi_assembly_width_offset = 0;
    raspberry_pi_assembly_length_offset = -40;
    raspberry_pi_assembly_height_offset = 20;
    
    tank_gun_length = 8.5 * 25.4;
    tank_gun_width_offset = 0;
    tank_gun_length_offset = 40;
    tank_gun_height_offset = -20;
    
    translate([0, 0,(height / 2)])
    {
        rotate([0, 0, turret_pan])
        union()
        {
            /* Raspberry Pi and attachments */
            translate([raspberry_pi_assembly_width_offset, raspberry_pi_assembly_length_offset, raspberry_pi_assembly_height_offset])
            raspberry_pi_assembly(2, camera_pan, camera_tilt);
            
            /* Tank gun */
            rotate([tank_gun_tilt, 0, 0])
            translate([tank_gun_width_offset, tank_gun_length_offset, tank_gun_height_offset])
            tank_gun(tank_gun_length);

            /* Turret body */
            color(alpha = tank_turret_alpha)
            difference()
            {
                cube([width, length, height], center = true);
                translate([0, 0, -tank_turret_thickness])
                cube([width - (tank_turret_thickness * 2), length - (tank_turret_thickness * 2), height - (tank_turret_thickness * 2)], center = true);
            }
        }
    }    
}
