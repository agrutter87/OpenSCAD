use <tank_body.scad>
use <tank_turret.scad>
use <tank_track_assembly.scad>

tank();

module tank()
{
    $fn = 40;

    /* Configure tank body */
    tank_body_width = 200;
    tank_body_depth = 500;
    tank_body_height = 100;
    tank_body_clearance = 50;
    
    /* Configure tank turret */
    tank_turret_width = tank_body_width;
    tank_turret_depth = 200;
    tank_turret_height = 80;
    tank_turret_depth_offset = 300;
    
    /* Configure tank wheels */
    tank_wheel_width = 80;
    tank_wheel_diameter = tank_body_height + tank_body_clearance;
    
    /* Configure tank track assemblies */
    tank_track_length = tank_body_depth - tank_wheel_diameter;
    tank_track_thickness = 10;
    tank_track_inset = 10;
    
    /* Create tank body */
    translate([0, 0, tank_body_clearance])
    tank_body(tank_body_width, tank_body_depth, tank_body_height);

    /* Create tank turret */
    translate([0, tank_turret_depth_offset, tank_body_height + tank_body_clearance])
    if($t < 0.5)
    {
        tank_turret(tank_turret_width, tank_turret_depth, tank_turret_height, -90 + ($t * 360), -90 + ($t * 360), -45 + ($t * 180), ($t * -10));
    }
    else
    {
        tank_turret(tank_turret_width, tank_turret_depth, tank_turret_height, -90 + ((1 - $t) * 360), -90 + ((1 - $t) * 360), -45 + ((1 - $t) * 180), ((1 - $t) * -10));
    }
    
    /* Create left tank track */
    translate([(tank_body_width / 2) + (tank_wheel_width / 2), tank_body_depth / 2, 0])
    tank_track_assembly(tank_wheel_width, tank_wheel_diameter, tank_track_length, tank_track_thickness, tank_track_inset);
    
    /* Create right tank track */
    translate([-((tank_body_width / 2) + (tank_wheel_width / 2)), tank_body_depth / 2, 0])
    tank_track_assembly(tank_wheel_width, tank_wheel_diameter, tank_track_length, tank_track_thickness, tank_track_inset);
}