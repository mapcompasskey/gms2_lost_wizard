/// @desc scr_camera_step()


//
// If the Camera needs Repositioned
//
if (camera != noone)
{
    if (reposition)
    {
        var camera_x = 0;
        var camera_y = 0;
        
        // if the camera should transition towards the target
        if ( ! snap_to)
        {
            // get the camera's current position
            var pos_x = camera_get_view_x(camera);
            var pos_y = camera_get_view_y(camera);
            
            // find the distance between the camera and the target
            var target_distance = point_distance(pos_x, pos_y, (target_x - camera_width_half), (target_y - camera_height_half));
            
            // if the distance is outside the bounds
            if (target_distance < distance_min || target_distance > distance_max)
            {
                snap_to = true;
            }
            else
            {
                // interpolate the view position to the new, relative position
                camera_x = lerp(pos_x, (target_x - camera_width_half), lerp_rate);
                camera_y = lerp(pos_y, (target_y - camera_height_half), lerp_rate);
            }
        }
        
        // if the camera should instantly move to the target
        if (snap_to)
        {
            camera_x = (target_x - camera_width_half);
            camera_y = (target_y - camera_height_half);
        }
        
        // bind the values within range
        camera_x = clamp(camera_x, position_min_x, position_max_x);
        camera_y = clamp(camera_y, position_min_y, position_max_y);
        
        // update the view position
        //camera_set_view_pos(camera, camera_x, camera_y); *causes the tiles to glitch
        camera_set_view_pos(camera, round(camera_x), round(camera_y));
        
        // reset values
        target_x = 0;
        target_y = 0;
        snap_to = false;
        reposition = false;
    }
    
}
