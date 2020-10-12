use <fillets2d.scad>

baseplate(1 * 25.4, 3, 6, 3, 3, 3, 6.75 * 25.4, 2 * 25.4, 0, 0);

module baseplate(offset, thickness, mounting_od, mounting_id, mounting_offset_w, mounting_offset_l, width, length, number_of_v_slots, number_of_h_slots)
{
    $fn = 36;
    difference()
    {
        union()
        {
            translate([0, 0, offset - thickness])
            {
                linear_extrude(height = thickness)
                {
                    rounding2d(mounting_od / 2)
                    square([width, length]);
                }
            }
            translate([mounting_offset_w, mounting_offset_l, 0])
            {
                cylinder(h = (offset - thickness), d = mounting_od);
            }
            translate([width - mounting_offset_w, mounting_offset_l, 0])
            {
                cylinder(h = (offset - thickness), d = mounting_od);
            }
            translate([width - mounting_offset_w, length - mounting_offset_l, 0])
            {
                cylinder(h = (offset - thickness), d = mounting_od);
            }
            translate([mounting_offset_w, length - mounting_offset_l, 0])
            {
                cylinder(h = (offset - thickness), d = mounting_od);
            }
        }
        union()
        {
            translate([mounting_offset_w, mounting_offset_l, 0])
            {
                cylinder(h = offset, d = mounting_id);
            }
            translate([width - mounting_offset_w, mounting_offset_l, 0])
            {
                cylinder(h = offset, d = mounting_id);
            }
            translate([width - mounting_offset_w, length - mounting_offset_l, 0])
            {
                cylinder(h = offset, d = mounting_id);
            }
            translate([mounting_offset_w, length - mounting_offset_l, 0])
            {
                cylinder(h = offset, d = mounting_id);
            }
        }
        union()
        {
            start_point = thickness;
            end_point = width - thickness - mounting_id;
            safe_zone_1_start = mounting_offset_w - (mounting_id / 2) - thickness;
            safe_zone_1_end = mounting_offset_w + (mounting_id / 2) + thickness;
            safe_zone_2_start = width - safe_zone_1_end;
            safe_zone_2_end = width - safe_zone_1_start;
            
            for(incr_offset = [start_point : (end_point - start_point) / (number_of_v_slots - 1) : end_point])
            {
                safe_zone = false;
    
                if(incr_offset + mounting_id >= safe_zone_1_start && incr_offset <= safe_zone_1_end)
                {
                    translate([incr_offset, mounting_offset_l * 2, offset - mounting_id])
                    {
                        linear_extrude(height = mounting_id)
                        {
                            rounding2d(mounting_id / 2 - 0.1)
                            square([mounting_id, length - (mounting_offset_l * 4)]);
                        }
                    }
                }
                else if(incr_offset + mounting_id >= safe_zone_2_start && incr_offset <= safe_zone_2_end)
                {
                    translate([incr_offset, mounting_offset_l * 2, offset - mounting_id])
                    {
                        linear_extrude(height = mounting_id)
                        {
                            rounding2d(mounting_id / 2 - 0.1)
                            square([mounting_id, length - (mounting_offset_l * 4)]);
                        }
                    }
                }
                else
                {
                    translate([incr_offset, thickness * 2, offset - mounting_id])
                    {
                        linear_extrude(height = mounting_id)
                        {
                            rounding2d(mounting_id / 2 - 0.1)
                            square([mounting_id, length - (thickness * 4)]);
                        }
                    }
                }
            }
        }
        
        union()
        {
            start_point = thickness;
            end_point = length - thickness - mounting_id;
            safe_zone_1_start = mounting_offset_l - (mounting_id / 2) - thickness;
            safe_zone_1_end = mounting_offset_l + (mounting_id / 2) + thickness;
            safe_zone_2_start = length - safe_zone_1_end;
            safe_zone_2_end = length - safe_zone_1_start;

            for(incr_offset = [start_point : (end_point - start_point) / (number_of_h_slots - 1) : end_point])
            {
                if(incr_offset + mounting_id >= safe_zone_1_start && incr_offset <= safe_zone_1_end)
                {
                    translate([mounting_offset_w * 2, incr_offset, offset - mounting_id])
                    {
                        linear_extrude(height = mounting_id)
                        {
                            rounding2d(mounting_id / 2 - 0.1)
                            square([width - (mounting_offset_w * 4), mounting_id]);
                        }
                    }
                }
                else if(incr_offset + mounting_id >= safe_zone_2_start && incr_offset <= safe_zone_2_end)
                {
                    translate([mounting_offset_w * 2, incr_offset, offset - mounting_id])
                    {
                        linear_extrude(height = mounting_id)
                        {
                            rounding2d(mounting_id / 2 - 0.1)
                            square([width - (mounting_offset_w * 4), mounting_id]);
                        }
                    }
                }
                else
                {
                    translate([thickness * 2, incr_offset, offset - mounting_id])
                    {
                        linear_extrude(height = mounting_id)
                        {
                            rounding2d(mounting_id / 2 - 0.1)
                            square([width - (thickness * 4), mounting_id]);
                        }
                    }
                }
                
            }
        }
    }
};