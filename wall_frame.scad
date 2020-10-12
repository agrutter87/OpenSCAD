use <wood.scad>

//wall_frame(3.5, 8, 8);
wall_frame_positioned(3.5, 8, [0,0], [0,10]);
//wall_frame_positioned(3.5, 8, [0,0], [0,-5]);
//wall_frame_positioned(3.5, 8, [0,0], [5,0]);
//wall_frame_positioned(3.5, 8, [0,0], [-5,0]);

module wall_frame(w_in, l_ft, h_ft)
{
    w1 = 1.75;
    ft2in = 12;
    spacing = 18;
    
    /* Create a list of positions to put each 2x4 along the length of the wall. 
     * This string also moves the final 2x4 closer to the previous one in order 
     * to fill up the entire length of the wall. */
    list = [ for (l_in = [0 : spacing : ((l_ft * ft2in) + spacing)]) if (l_in < ((l_ft * ft2in) + spacing)) l_in>((l_ft*ft2in)-w1) ? (l_ft*ft2in - w1) : l_in];
    for(var = list)
    {
        translate([0, var, w1])
        {
            wood(w_in, w1, ((h_ft * ft2in) - (2 * w1)));
        }
    }
    
    /* Create the base 2x4 */
    translate([0, (l_ft * ft2in), 0])
    {
        rotate(90, [1,0,0])
        {
            wood(w_in, w1, (l_ft * ft2in));
        }
    }   
    
    /* Create the upper 2x4 */
    translate([0, (l_ft * ft2in), ((h_ft * ft2in) - w1)])
    {
        rotate(90, [1,0,0])
        {
            wood(w_in, w1, (l_ft * ft2in));
        }
    }     
}

module wall_frame_positioned(width, height, start, end)
{
    ft2in = 12;

    w_in = width;
    h_ft = height;
    l_ft = sqrt(((end[0] - start[0]) ^ 2) + ((end[1] - start[1]) ^ 2));

    translate([-start[1]*ft2in, start[0]*ft2in, 0])
    {
        rotate(atan2((end[1] - start[1]),(end[0] - start[0])), [0,0,1])
        {
            translate([-(width/2),-(width/2),0])
            {
                wall_frame(w_in, l_ft, h_ft);
            }
        }
    }
}