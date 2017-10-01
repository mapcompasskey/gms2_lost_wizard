/// @desc scr_game_step()


//
// Track the Time between Steps
//

// convert the amount of microseconds that have passed since the last step to seconds
var dt = (1/1000000 * delta_time);

// limit TICK to 8fps: (1 / 1,000,000) * (1,000,000 / 8) = 0.125
global.TICK = min(0.125, dt);

    
//
// If the Game's Aspect Ratio has Changed
//
var a = application_get_position();
var ratio = ((a[2] - a[0]) / view_get_wport(0));
if (ratio != aspect_ratio)
{
    // update aspect ratio
    aspect_ratio = ratio;
    global.GAME_ASPECT_RATIO = ratio;
    
    // update scale factor in the HUD
    scr_update_hud_scale_factor();
}


//
// For Testing
//

// restart the room to test how instances react with updated globals
if (keyboard_check_pressed(ord("R")))
{
    room_restart();
}

// kill/create the player to test how instances react to it disappearing
if (keyboard_check_pressed(ord("T")))
{
    if (instance_exists(global.PLAYER))
    {
        with (global.PLAYER)
        {
            instance_destroy();
        }
    }
    else
    {
        instance_create_layer(0, 0, global.PLAYER_LAYER_ID, obj_player);
    }
}
