/// @descr scr_soul_proximity_collision()


//
// Soul Proximity Collision Tests
//

// update the number of player souls
scr_update_globals_player_souls(points);

// kill the instance
dying = true;
instance_destroy();
