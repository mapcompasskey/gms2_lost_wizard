/// @descr scr_hud_step()

player_health = global.PLAYER_HEALTH;
player_max_health = global.PLAYER_MAX_HEALTH;

var perc = round(player_health / player_max_health * 100);
player_health_text = string(perc) + "%";
