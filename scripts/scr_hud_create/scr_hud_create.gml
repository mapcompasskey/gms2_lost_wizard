/// @descr scr_hud_create()

scale_factor = 1;
scale_text = 1;
scale_sprites = 1;

player_health = 0;
player_max_health = 0;
player_previous_health = 0;
player_health_text = "";

// player health marker
health_marker_sprite = spr_player_health_marker;

// track the marker subimages to draw
health_marker_subimages = ds_list_create();

// player health marker image data
// array(padding, gutter, xoffset, yoffset, width, height)
health_marker_data[5] = sprite_get_height(health_marker_sprite);
health_marker_data[4] = sprite_get_width(health_marker_sprite);
health_marker_data[3] = sprite_get_yoffset(health_marker_sprite);
health_marker_data[2] = sprite_get_xoffset(health_marker_sprite);
health_marker_data[1] = 2;
health_marker_data[0] = 2;

// player health marker drawing values
// array(padding, gutter, xoffset, yoffset, width, height)
health_marker_draw[5] = 0;
health_marker_draw[4] = 0;
health_marker_draw[3] = 0;
health_marker_draw[2] = 0;
health_marker_draw[1] = 0;
health_marker_draw[0] = 0;

