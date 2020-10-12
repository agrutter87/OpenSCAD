use <fillets3d.scad>

wood(1.75, 3.5, 8*12);

module wood(h_in, l_in, w_in)
{
    translate([h_in, 0, 0])
    {
        rotate(270, [0,1,0])
        {
            color("wheat", 1.0)
            {
                topBottomFillet(b = 0, t = h_in, r = 0.25, s = 20)
                //cube(size = [w_in, l_in, h_in], center = false);
                cube(size = [w_in, l_in, h_in], center = false);
            }
        }
    }
};

