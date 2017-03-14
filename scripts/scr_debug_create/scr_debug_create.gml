/// @desc scr_debug_create()


// this object must be persistent
if ( ! persistent)
{
    persistent = true;
}

// instance variables
aspect_ratio = global.GAME_ASPECT_RATIO;
camera_offset_x = camera_get_view_x(view_camera[0]);
camera_offset_y = camera_get_view_y(view_camera[0]);
rectangle_list = ds_list_create();
