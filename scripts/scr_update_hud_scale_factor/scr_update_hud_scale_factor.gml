/// @desc scr_update_hud_scale_factor()


//
// Update the Scale Factor in the HUD
//
if (instance_exists(global.HUD))
{
    with (global.HUD)
    {
        scale_factor = global.GAME_ASPECT_RATIO;
        scale_factor_updated = true;
    }
}
