/// @desc scr_health_bit_proximity_collision()


//
// Health Bit Proximity Collision Tests
//

// update the entity's health
scr_update_entity_health(following_id, points);

// kill the instance
dying = true;
instance_destroy();
