/// @desc scr_room_stage_created()


//
// Get the Layer IDs
//

global.BACKGROUND_LAYER_ID = layer_get_id(BACKGROUND_LAYER_NAME);
global.COLLISION_TILEMAP_LAYER_ID = layer_get_id(COLLISION_TILEMAP_LAYER_NAME);
global.TILES_LAYER_ID = layer_get_id(TILES_LAYER_NAME);
global.INSTANCES_LAYER_ID = layer_get_id(INSTANCES_LAYER_NAME);
global.PLAYER_LAYER_ID = layer_get_id(PLAYER_LAYER_NAME);
global.CONTROLLERS_LAYER_ID = layer_get_id(CONTROLLERS_LAYER_NAME);


//
// Set the Background Layer's Color
//

var layer_background_id = layer_background_get_id(global.BACKGROUND_LAYER_ID);
layer_background_blend(layer_background_id, global.BG_COLOR);


//
// Hide the Collision Tilemap Layer
//

layer_set_visible(global.COLLISION_TILEMAP_LAYER_ID, false);


//
// Create the Stage Camera
//

instance_create_layer(0, 0, global.CONTROLLERS_LAYER_ID, obj_stage_camera);


//
// Create the HUD
//

instance_create_layer(0, 0, global.CONTROLLERS_LAYER_ID, obj_hud);

