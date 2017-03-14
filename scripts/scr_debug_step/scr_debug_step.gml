/// @desc scr_debug_step()


// set local variables
var lists;
var x1, y1;
var x2, y2;

// reset instance variables
aspect_ratio = global.GAME_ASPECT_RATIO;
camera_offset_x = camera_get_view_x(view_camera[0]);
camera_offset_y = camera_get_view_y(view_camera[0]);
rectangle_list = ds_list_create();

// add player objects
with (obj_player)
{
    x1 = other.aspect_ratio * (x + sprite_bbox_left - other.camera_offset_x);
    y1 = other.aspect_ratio * (y + sprite_bbox_top - other.camera_offset_y);
    x2 = other.aspect_ratio * (x + sprite_bbox_right - other.camera_offset_x + 1);
    y2 = other.aspect_ratio * (y + sprite_bbox_bottom - other.camera_offset_y + 1);
    lists = ds_list_create();
    ds_list_add(lists, x1, y1, x2, y2);
    ds_list_add(other.rectangle_list, lists);
}

// add enemy objects
with (obj_enemy)
{
    x1 = other.aspect_ratio * (x + sprite_bbox_left - other.camera_offset_x);
    y1 = other.aspect_ratio * (y + sprite_bbox_top - other.camera_offset_y);
    x2 = other.aspect_ratio * (x + sprite_bbox_right - other.camera_offset_x + 1);
    y2 = other.aspect_ratio * (y + sprite_bbox_bottom - other.camera_offset_y + 1);
    lists = ds_list_create();
    ds_list_add(lists, x1, y1, x2, y2);
    ds_list_add(other.rectangle_list, lists);
}

// add projectile objects
with (obj_projectile)
{
    x1 = other.aspect_ratio * (x + sprite_bbox_left - other.camera_offset_x);
    y1 = other.aspect_ratio * (y + sprite_bbox_top - other.camera_offset_y);
    x2 = other.aspect_ratio * (x + sprite_bbox_right - other.camera_offset_x + 1);
    y2 = other.aspect_ratio * (y + sprite_bbox_bottom - other.camera_offset_y + 1);
    lists = ds_list_create();
    ds_list_add(lists, x1, y1, x2, y2);
    ds_list_add(other.rectangle_list, lists);
}
