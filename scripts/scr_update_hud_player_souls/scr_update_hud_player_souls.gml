/// @descr scr_update_hud_player_souls()


//
// Update the Number of Player Souls in the HUD
//
if (instance_exists(global.HUD))
{
    with (global.HUD)
    {
        player_souls = global.PLAYER_SOULS;
        player_souls_updated = true;
    }
}

