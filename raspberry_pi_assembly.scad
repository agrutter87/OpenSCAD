use <raspberry_pi.scad>
use <maker_focus_pan_tilt_hat.scad>
use <raspberry_pi_pan_tilt.scad>

raspberry_pi_assembly(2, 0, 0);

module raspberry_pi_assembly(model, pan, tilt)
{
    hat_mounting_width_offset = -0.3;
    hat_mounting_length_offset = model==1?0:model==2?-10:-10;
    hat_mounting_height_offset = 8.5;
    
    pan_tilt_bottom_mount_offset = 6.5;
    pan_tilt_mounting_width_offset = 0;
    pan_tilt_mounting_length_offset = (pan_tilt_bottom_mount_offset / 2) + (model==1?0:model==2?-10:-10);
    pan_tilt_mounting_height_offset = hat_mounting_height_offset + 1.5;
    
    raspberry_pi(model);

    translate([hat_mounting_width_offset, hat_mounting_length_offset, hat_mounting_height_offset])
    maker_focus_pan_tilt_hat();
    
    translate([pan_tilt_mounting_width_offset, pan_tilt_mounting_length_offset, pan_tilt_mounting_height_offset])
    raspberry_pi_pan_tilt(pan_tilt_bottom_mount_offset, pan, tilt);
}
