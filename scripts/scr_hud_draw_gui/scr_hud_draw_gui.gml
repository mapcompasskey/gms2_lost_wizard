/// @descr scr_hud_draw_gui()


//
// Display the Player's Health
//

// display the player's health text
draw_set_color(c_white);
draw_set_halign(fa_left);
draw_set_valign(fa_top);
draw_text(10, 10, player_health_text);

// draw the player health markers
var subimage = 0;
var pos_x = 10;
var pos_y = 40;
for (var i = 0; i < ds_list_size(health_marker_subimages); i++)
{
    subimage = ds_list_find_value(health_marker_subimages, i);
    draw_sprite_ext(health_marker_sprite, subimage, pos_x, pos_y, scale_sprites, scale_sprites, 0, c_white, 1);
    pos_x = (pos_x + health_marker_draw[1]);
}


//
// Display the Number of Player Souls
//
draw_set_color(c_white);
draw_set_halign(fa_left);
draw_set_valign(fa_top);
draw_text(150, 10, player_souls_text);

