/// @descr scr_hud_create()


// update globals
global.HUD = id;

// the amount to scale text and images
scale_factor = global.GAME_ASPECT_RATIO;;
scale_factor_updated = true;
scale_text = 1;
scale_sprites = 1;

// the player's health
player_health = global.PLAYER_HEALTH;
player_max_health = global.PLAYER_MAX_HEALTH;
player_health_updated = true;
player_health_text = "";

// player health marker
health_marker_sprite = spr_player_health_marker;

// track the marker subimages to draw
health_marker_subimages = ds_list_create();

// player health marker image data
// array(padding, width, height)
health_marker_data[0] = 2;
health_marker_data[1] = sprite_get_width(health_marker_sprite);
health_marker_data[2] = sprite_get_height(health_marker_sprite);

// player health marker drawing values
// array(padding, width, height)
health_marker_draw[0] = (health_marker_data[0] * scale_sprites);
health_marker_draw[1] = (health_marker_data[1] * scale_sprites);
health_marker_draw[2] = (health_marker_data[2] * scale_sprites);
