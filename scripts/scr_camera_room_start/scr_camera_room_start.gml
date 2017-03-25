/// @desc scr_camera_room_start()


// if the camera needs setup in this room
if (setup_camera)
{
    // enable the use of views
    view_enabled = true;

    // make view[0] visible
    view_set_visible(0, true);

    // set the port bounds of view[0]
    view_set_wport(0, global.VIEW_WIDTH);
    view_set_hport(0, global.VIEW_HEIGHT);

    // build a camera
    camera_width = view_get_wport(0);
    camera_height = view_get_hport(0);
    camera_width_half = (camera_width / 2);
    camera_height_half = (camera_height / 2);
    camera = camera_create_view(0, 0, camera_width, camera_height, 0, -1, -1, -1, camera_width_half, camera_height_half);
    
    // update the maximum position bounds
    position_max_x = (room_width - camera_width);
    position_max_y = (room_height - camera_height);
    
    // update the maximum transition distance
    distance_max = point_distance(0, 0, camera_width_half, camera_height_half);

    // assign the camera to view[0]
    view_set_camera(0, camera);
    
    // reset instance var
    setup_camera = false;
}

/*
// basic camera set up
camera_set_view_pos(view_camera[0], 0, 0);
camera_set_view_size(view_camera[0], camera_width, camera_height);
camera_set_view_target(view_camera[0], obj_player);
camera_set_view_speed(view_camera[0], -1, -1);
camera_set_view_border(view_camera[0], camera_border_x, camera_border_y);
*/