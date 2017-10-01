/// @desc scr_room_initialize_created()


//
// Add the Game Object
//

// *doesn't matter what layer its on - it'll be reassigned when the room changes
var background_layer_id = layer_get_id(BACKGROUND_LAYER_NAME);
instance_create_layer(0, 0, background_layer_id, obj_game);


//
// Add the Camera Object
//

//if (global.CAMERA == noone)
//{
//    instance_create_layer(0, 0, background_layer_id, obj_camera);
//}


//
// Add the Debug Object
//

if (global.DEBUG_MODE)
{
    instance_create_layer(0, 0, background_layer_id, obj_debug);
}


//
// Goto the Next Room
//

room_goto_next();
