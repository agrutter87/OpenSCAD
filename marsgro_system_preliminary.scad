INCHES = 25.4;
FEET = 304.8;

base_thickness = (23/32)*INCHES; // 3/4" Plywood
base_outer_x = 3*FEET;
base_outer_y = 2*FEET;
base_outer_z = 2*FEET;
base_inner_x = base_outer_x - (2*base_thickness);
base_inner_y = base_outer_y - (2*base_thickness);
base_inner_z = base_outer_z - (2*base_thickness);

glass_thickness = (1/8)*INCHES;
glass_outer_x = base_inner_x + base_thickness + glass_thickness;
glass_outer_y = base_inner_y + base_thickness + glass_thickness;
glass_outer_z = 1200;
glass_inner_x = glass_outer_x - (2*glass_thickness);
glass_inner_y = glass_outer_y - (2*glass_thickness);
glass_inner_z = glass_outer_z - (2*glass_thickness);

side_outer_y = base_outer_y/3;
side_inner_y = side_outer_y - base_thickness;

/* Wood */
color("SaddleBrown", 1)
{
    difference()
    {
        /* Outer Shapes of Objects */
        union() {
            /* Main Box */
            cube([base_outer_x, base_outer_y, base_outer_z], true);
            
            /* Side Box */
            translate([0, (base_outer_y-side_outer_y), 0])
            {
                difference()
                {
                    cube([base_outer_x, side_outer_y, base_outer_z], true);
                    translate([0, -(base_thickness/2), base_thickness])
                    {
                        cube([base_inner_x, side_inner_y, base_inner_z], true);
                    }
                }
            }
        }
        /* Void Spaces of Objects */
        
        translate([0, 0, base_thickness])
        {
            cube([base_inner_x, base_inner_y, base_outer_z], true);
        }
    }
}
/* Glass */
color("LightCyan", 0.5)
{
    translate([0,0,base_outer_z])
    {
        difference()
        {
            cube([glass_outer_x, glass_outer_y, glass_outer_z], true);
            cube([glass_inner_x, glass_inner_y, glass_outer_z], true);
        }
    }
}
