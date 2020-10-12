use <tank_wheel.scad>

tank_track(10, 10, 100, 1, 1);

module tank_track(wheel_width, wheel_diameter, track_length, track_thickness, track_inset)
{
    segments = $fn>3 ? $fn : 3;
    
    outer_points = [[-wheel_diameter,-(track_length / 2)],
                    [-wheel_diameter,(track_length / 2)], 
                    for (theta = [90 : -(180/segments) : -90]) 
                        [-wheel_diameter + (wheel_diameter / 2) + (sin(theta) * (wheel_diameter / 2)), (track_length / 2) + cos(theta) * (wheel_diameter / 2)], 
                    [0, (track_length / 2)], 
                    [0, -(track_length / 2)], 
                    for (theta = [-90 : -(180/segments) : -270]) 
                        [-wheel_diameter + (wheel_diameter / 2) + (sin(theta) * (wheel_diameter / 2)), -(track_length / 2) + cos(theta) * (wheel_diameter / 2)]];

    inner_points = [[-wheel_diameter + track_thickness,-(track_length / 2)],
                    [-wheel_diameter + track_thickness,(track_length / 2)], 
                    for (theta = [90 : -(180/segments) : -90]) 
                        [-wheel_diameter + (wheel_diameter / 2) + (sin(theta) * ((wheel_diameter / 2) -track_thickness)), (track_length / 2) + cos(theta) * ((wheel_diameter / 2) -track_thickness)], 
                    [0 - track_thickness, (track_length / 2)], 
                    [0 - track_thickness, -(track_length / 2)], 
                    for (theta = [-90 : -(180/segments) : -270]) 
                        [-wheel_diameter + (wheel_diameter / 2) + (sin(theta) * ((wheel_diameter / 2) -track_thickness)), -(track_length / 2) + cos(theta) * ((wheel_diameter / 2) - track_thickness)]];

    color("black", 1.0)
    translate([-(wheel_width/2) + track_inset, 0, 0])
    rotate([0,90,0])
    linear_extrude(wheel_width - (2 * track_inset), scale = 1.0)
    difference()
    {
        polygon(outer_points);
        polygon(inner_points);
    }
//    polygon(points, paths);
}