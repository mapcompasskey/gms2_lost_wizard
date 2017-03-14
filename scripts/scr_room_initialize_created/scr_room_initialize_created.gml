/// @desc scr_room_initialize_created()

// add the Game object
instance_create_layer(0, 0, "Controllers", obj_game);

// if debug mode
if (global.DEBUG_MODE)
{
    instance_create_layer(0, 0, "Controllers", obj_debug);
}

// goto the next Room
room_goto_next();
