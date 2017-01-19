/// @descr scr_room_initialize_created()

// add the Game Start object
instance_create_layer(0, 0, "Controllers", obj_game_start);

// goto the next Room
room_goto_next();
