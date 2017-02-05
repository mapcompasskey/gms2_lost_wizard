/// @descr scr_hud_step()

player_health = global.PLAYER_HEALTH;
player_max_health = global.PLAYER_MAX_HEALTH;

var perc = round(player_health / player_max_health * 100);
player_health_text = string(perc) + "%, " + string(player_health) + " / " + string(player_max_health);

// update health marker draw settings
// array(padding, gutter, xoffset, yoffset, width, height)
health_marker_draw[0] = (health_marker_data[0] * scale_sprites);
health_marker_draw[1] = (health_marker_data[1] * scale_sprites);
health_marker_draw[2] = (health_marker_data[2] * scale_sprites);
health_marker_draw[3] = (health_marker_data[3] * scale_sprites);
health_marker_draw[4] = (health_marker_data[4] * scale_sprites);
health_marker_draw[5] = (health_marker_data[5] * scale_sprites);


// if the player's health has changed
if (player_health != player_previous_health)
{
    var step_size = (player_max_health / number_of_health_markers);
    
    // update the sub-image array for each marker
    for (var i = 0; i < number_of_health_markers; i++)
    {
        var idx = 0;
        for (var j = 0; j < health_marker_subimages; j++)
        {
            if (player_health >= (step_size * i) + j)
            {
                idx = j;
            }
        }
        marker_subimage[i] = idx;
    }
    
    // update previous health;
    player_previous_health = player_health;
}

