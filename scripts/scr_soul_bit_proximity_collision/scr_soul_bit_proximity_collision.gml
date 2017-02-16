/// @descr scr_soul_bit_proximity_collision()


//
// Soul Bit Proximity Collision Tests
//

// update the number of player souls
scr_update_globals_player_souls(points);

// kill the instance
dying = true;
instance_destroy();
