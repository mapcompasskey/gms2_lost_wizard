/// @descr scr_game_draw_gui()

// display the score
var txt = "Score: 0";// + scr_string_thousands(global.SCORE);
draw_set_color(c_white);
draw_set_halign(fa_left);
draw_set_valign(fa_top);
draw_text(10, 10, txt);
