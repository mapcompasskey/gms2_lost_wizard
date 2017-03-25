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
// Setup the Camera
//
scr_update_camera_setup();


//
// Create the HUD
//
instance_create_layer(0, 0, "Controllers", obj_hud);

