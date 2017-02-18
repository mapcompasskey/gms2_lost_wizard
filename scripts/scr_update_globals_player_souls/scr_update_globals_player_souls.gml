/// @desc scr_update_globals_player_souls(points)
/// @param {number} points The number of points to add (or subtract if a negative number)


//
// Update the Number of Player Souls
//
global.PLAYER_SOULS += argument0;

// update the number of player souls in the HUD
scr_update_hud_player_souls();
