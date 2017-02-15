/// @descr scr_update_globals_player_bits(bits)
/// @param {number} bits The number of bits to add (or subtract with a negative number)


//
// Update the Number of Player Bits
//
global.PLAYER_BITS += argument0;

// update the Number of Player Bits in the HUD
scr_update_hud_player_bits();
