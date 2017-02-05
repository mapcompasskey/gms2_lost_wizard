/// @descr scr_hud_draw_gui()

// display the player health
draw_set_color(c_white);
draw_set_halign(fa_left);
draw_set_valign(fa_top);
draw_text(10, 10, player_health_text);


// draw the player health markers
var pos_x = 10;
var pos_y = 40;

for (var i = 0; i < number_of_health_markers; i++)
{
    draw_sprite_ext(health_marker_sprite, marker_subimage[i], pos_x, pos_y, 1, 1, 0, c_white, 1);
    pos_x = (pos_x + health_marker_draw[4] + health_marker_draw[1]);
}