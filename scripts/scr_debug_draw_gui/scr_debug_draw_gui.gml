/// @desc scr_debug_draw_gui()


// set local variables
var lists;
var x1, y1;
var x2, y2;

// draw rectangles
draw_set_color(c_red);
for (var i = 0; i < ds_list_size(rectangle_list); i++)
{
    lists = ds_list_find_value(rectangle_list, i);
    x1 = ds_list_find_value(lists, 0);
    y1 = ds_list_find_value(lists, 1);
    x2 = ds_list_find_value(lists, 2);
    y2 = ds_list_find_value(lists, 3);
    draw_rectangle(x1, y1, x2, y2, true);
}
