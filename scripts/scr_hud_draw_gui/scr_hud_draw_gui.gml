/// @descr scr_hud_draw_gui()

// display the player health
draw_set_color(c_white);
draw_set_halign(fa_left);
draw_set_valign(fa_top);
draw_text(10, 10, player_health_text);
