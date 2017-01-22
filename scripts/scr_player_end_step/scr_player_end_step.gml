/// @descr scr_player_end_step()

if ( ! dying)
{
	event_inherited();
}

// move towards the player
scr_camera_update(x, y, false);
//scr_camera_update(x, (y + sprite_bbox_top), false);
