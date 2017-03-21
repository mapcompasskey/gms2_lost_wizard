/// @desc scr_room_stage_created()


//
// Set the Background Layer's Color
//
var layer_id = layer_get_id(global.ROOM_LAYER_BACKGROUND);
var layer_background_id = layer_background_get_id(layer_id);
layer_background_blend(layer_background_id, global.BG_COLOR);


//
// Hide the Collision Tilemap Layer
//
var layer_id = layer_get_id(global.ROOM_LAYER_COLLISION_TILEMAP);
layer_set_visible(layer_id, false);


//
// Create the Camera
//

// enable the use of views
view_enabled = true;

// make view 0 visible
view_set_visible(0, true);

// set the port bounds of view 0
view_set_wport(0, global.VIEW_WIDTH);
view_set_hport(0, global.VIEW_HEIGHT);

// build a camera
var camera_width = view_get_wport(0);
var camera_height = view_get_hport(0);
var camera_border_x = (camera_width / 2);
var camera_border_y = (camera_height / 2);
var camera = camera_create_view(0, 0, camera_width, camera_height, 0, -1, -1, -1, camera_border_x, camera_border_y);

// assign the camera to view 0
view_set_camera(0, camera);

// set target 
//camera_set_view_target(camera, obj_player);

/*
// basic camera set up
camera_set_view_pos(view_camera[0], 0, 0);
camera_set_view_size(view_camera[0], camera_width, camera_height);
camera_set_view_target(view_camera[0], obj_player);
camera_set_view_speed(view_camera[0], -1, -1);
camera_set_view_border(view_camera[0], camera_border_x, camera_border_y);
*/


//
// Create the HUD
//
instance_create_layer(0, 0, "Controllers", obj_hud);

