/// @descr scr_update_hud_player_bits()


//
// Update the Number of Player Bits in the HUD
//
if (instance_exists(global.HUD))
{
    with (global.HUD)
    {
        player_bits = global.PLAYER_BITS;
        player_bits_updated = true;
    }
}

