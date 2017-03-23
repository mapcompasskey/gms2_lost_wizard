/// @desc scr_camera_room_start()

/*
//Turn on the use of views
view_enabled = true;
view_visible[0] = true;

//Create a camera and instruct it to follow the player
camera = camera_create_view(0, 0, global.game_width, global.game_height, 0, objPlayer, -1, -1, global.game_width, global.game_height);

//Set the view to use our new camera
view_set_camera(view_current, camera);

//Instruct the camera to render to the surface
view_set_surface_id(0, surf);
*/

// enable the use of views
view_enabled = true;

// make view[0] visible
view_set_visible(0, true);

// set the port bounds of view[0]
view_set_wport(0, global.VIEW_WIDTH);
view_set_hport(0, global.VIEW_HEIGHT);

// build a camera
var camera_width = view_get_wport(0);
var camera_height = view_get_hport(0);
var camera_border_x = (camera_width / 2);
var camera_border_y = (camera_height / 2);
camera = camera_create_view(0, 0, camera_width, camera_height, 0, -1, -1, -1, camera_border_x, camera_border_y);

// assign the camera to view[0]
view_set_camera(0, camera);
