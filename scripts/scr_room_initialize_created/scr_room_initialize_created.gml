/// @desc scr_room_initialize_created()


//
// Add the Game Object
//
instance_create_layer(0, 0, "Controllers", obj_game);


//
// Add the Camera Object
//
if (global.CAMERA == noone)
{
    instance_create_layer(0, 0, "Controllers", obj_camera);
}


//
// Add the Debug Object
//
if (global.DEBUG_MODE)
{
    instance_create_layer(0, 0, "Controllers", obj_debug);
}


//
// Goto the Next Room
//
room_goto_next();
