use <room.scad>

x_values = [12, 4, 15];
y_values = [15, 20, 12];

house(x_values, y_values);

module house(x, y)
{
    ft2in = 12;
    
    translate([0, -((y[0] * ft2in) + (2 * 3.5)), 0])
    {
        square_room(3.5, y[0], x[0], 8);
    
        translate([((x[0] * ft2in) - (1 * 3.5)), 0, 0])
        {
            square_room(3.5, y[0], x[1], 8);
        }

        translate([(((x[1] + x[0]) * ft2in) - (2 * 3.5)), 0, 0])
        {
            square_room(3.5, y[0], x[2], 8);
        }
    }
    
    translate([0, -(((y[1] + y[0]) * ft2in) + (3 * 3.5)), 0])
    {
        square_room(3.5, y[1], x[0], 8);
    
        translate([((x[0] * ft2in) - (1 * 3.5)), 0, 0])
        {
            square_room(3.5, y[1], x[1], 8);
        }

        translate([(((x[1] + x[0]) * ft2in) - (2 * 3.5)), 0, 0])
        {
            square_room(3.5, y[1], x[2], 8);
        }
    }
    
    translate([0, -(((y[2] + y[1] + y[0]) * ft2in) + (4 * 3.5)), 0])
    {
        square_room(3.5, y[2], x[0], 8);
    
        translate([((x[0] * ft2in) - (1 * 3.5)), 0, 0])
        {
            square_room(3.5, y[2], x[1], 8);
        }

        translate([(((x[1] + x[0]) * ft2in) - (2 * 3.5)), 0, 0])
        {
            square_room(3.5, y[2], x[2], 8);
        }
    }
}