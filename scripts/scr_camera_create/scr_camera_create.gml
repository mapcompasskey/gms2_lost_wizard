/// @desc scr_camera_create()


// this object must be persistent
if ( ! persistent)
{
    persistent = true;
}

// update globals
global.CAMERA = id;

// instance variables
setup_camera = false;
target_x = 0;
target_y = 0;
lerp_rate = 0.5;
sanp_to = false;
reposition = false;
            
camera = noone;
camera_width = 0;
camera_height = 0;
camera_width_half = 0;
camera_height_half = 0;

position_min_x = 0;
position_min_y = 0;
position_max_x = (room_width - camera_width);
position_max_y = (room_height - camera_height);
    
distance_min = 1;
distance_max = point_distance(0, 0, camera_width_half, camera_height_half);