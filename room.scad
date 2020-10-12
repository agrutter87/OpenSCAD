use <wall_frame.scad>

//square_room(3.5, 5, 5, 5);
custom_room(3.5, 8, [[0,0],[0,5],[5,5],[5,10],[10,10],[10,0]]);

module square_room(w_in, x_ft, y_ft, h_ft)
{
    ft2in = 12;
    
    translate([0, w_in, 0])
    {
        wall_frame(w_in, x_ft, h_ft);
    }

    translate([(y_ft*ft2in - w_in), w_in, 0])
    {
        wall_frame(w_in, x_ft, h_ft);
    }

    translate([0, w_in, 0])
    {
        rotate(270, [0,0,1])
        {
            wall_frame(w_in, y_ft, h_ft);
        }
    }

    translate([0, ((x_ft*ft2in)+(2 * w_in)), 0])
    {
        rotate(270, [0,0,1])
        {
            wall_frame(w_in, y_ft, h_ft);
        }
    }
}

module custom_room(width, height, point_vector)
{
    num_walls = len(point_vector) - 1;
    
    for(wall = [0:num_walls])
    {
        if(wall == (num_walls))
        {
            echo("A:Wall frame with point1=", point_vector[wall], " and point2=", point_vector[0]);
            wall_frame_positioned(width, height, point_vector[wall], point_vector[0]);
        }
        else
        {
            echo("B:Wall frame with point1=", point_vector[wall], " and point2=", point_vector[wall+1]);
            wall_frame_positioned(width, height, point_vector[wall], point_vector[wall+1]);
        }
    }
}