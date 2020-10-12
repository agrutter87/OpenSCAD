use <tank_wheel.scad>
use <tank_track.scad>

tank_track_assembly(10, 10, 100, 1, 1);

module tank_track_assembly(wheel_width, wheel_diameter, track_length, track_thickness, track_inset)
{
    translate([0, -(track_length/2), 0])
    tank_wheel(wheel_width, wheel_diameter, track_thickness, track_inset);
    
    translate([0, track_length/2, 0])
    tank_wheel(wheel_width, wheel_diameter, track_thickness, track_inset);
    
    tank_track(wheel_width, wheel_diameter, track_length, track_thickness, track_inset);
}