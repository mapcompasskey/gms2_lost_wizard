/// @descr scr_check_point_on_tilemap(tilemap, x, y, tile 1, tile 2, ...)

var tilemap = argument[0];
var pos_x = argument[1];
var pos_y = argument[2];

var tile_index = tilemap_get_at_pixel(tilemap, pos_x, pos_y) & tile_index_mask;
for (i = 3; i < argument_count; i++)
{
	if (tile_index == argument[i])
	{
		return true;
	}
}

return false;
