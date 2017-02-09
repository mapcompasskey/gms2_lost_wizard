/// @descr scr_hud_step()

// update the factor the game is scaled by
var a = application_get_position();
scale_factor = ((a[2] - a[0]) / view_get_wport(0));//view_wview[0]);
scale_text = max(1, floor(scale_factor * 0.4));
scale_sprites = max(1, floor(scale_factor * 0.75));

// get the player's health
player_health = global.PLAYER_HEALTH;
player_max_health = global.PLAYER_MAX_HEALTH;

var perc = round(player_health / player_max_health * 100);
player_health_text = string(perc) + "%, " + string(player_health) + " / " + string(player_max_health);

// update health marker draw settings
// array(padding, width, height)
health_marker_draw[0] = (health_marker_data[0] * scale_sprites);
health_marker_draw[1] = (health_marker_data[1] * scale_sprites);
health_marker_draw[2] = (health_marker_data[2] * scale_sprites);

// if the player's health has changed
if (player_health != player_previous_health)
{
    // update the marker subimages list
    health_marker_subimages = ds_list_create();

    var subimage = 0;
    var lgnth = ceil(player_max_health / 2);
    for (var i = 1; i <= lgnth; i++)
    {
        subimage = 0;
        if (player_health >= (i * 2))
        {
            subimage = 2;
        }
        else if (player_health >= (i * 2 - 1))
        {
            subimage = 1;
        }
    
        ds_list_add(health_marker_subimages, subimage);
    }
    
    // update previous health;
    player_previous_health = player_health;
}

