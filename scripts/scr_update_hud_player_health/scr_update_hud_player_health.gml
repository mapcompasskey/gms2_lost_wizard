/// @desc scr_update_hud_player_health()


//
// Update the Player Health in the HUD
//
if (instance_exists(global.HUD))
{
    with (global.HUD)
    {
        player_health = global.PLAYER_HEALTH;
        player_max_health = global.PLAYER_MAX_HEALTH;
        player_health_updated = true;
    }
}
