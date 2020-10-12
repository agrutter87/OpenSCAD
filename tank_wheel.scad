tank_wheel(10, 10, 2, 1);

module tank_wheel(wheel_width, wheel_diameter, track_thickness, track_inset)
{
    translate([-(wheel_width/2), 0 ,wheel_diameter/2])
    rotate([0,90,0])
    {
        linear_extrude(height = track_inset, scale = 1.0)
        circle(d=wheel_diameter, false);
        
        translate([0, 0, track_inset])
        linear_extrude(height = wheel_width - (2 * track_inset), scale = 1.0)
        circle(d=wheel_diameter - track_thickness, false);
        
        translate([0, 0, wheel_width - track_inset])
        linear_extrude(height = track_inset, scale = 1.0)
        circle(d=wheel_diameter, false);
    }
}