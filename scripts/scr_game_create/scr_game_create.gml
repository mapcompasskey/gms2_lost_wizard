/// @descr scr_game_create()

// this object must be persistent
if ( ! persistent)
{
    persistent = true;
}

// constants
#macro RIGHT 1
#macro LEFT -1

#macro DEGREES_RIGHT 0
#macro DEGREES_LEFT 180

#macro TILE_SIZE 8
#macro NOT_TILE_SIZE 7
#macro TILE_SOLID 1
#macro TILE_SOLID_TOP 2
#macro TILE_SOLID_BOTTOM 3
#macro TILE_SOLID_RIGHT 4
#macro TILE_SOLID_LEFT 5

// global instances
global.HUD = noone;
global.PLAYER = noone;
global.PLAYER_HEALTH = 0;
global.PLAYER_MAX_HEALTH = 0;

// global parameters
global.GRAV = 500;
global.TICK = 0;
//global.SCORE = 0;

// room layer names
global.ROOM_LAYER_CONTROLLERS = "Controllers";
global.ROOM_LAYER_PLAYER = "Player";

// input keys to listen for
// *set as globals so they can be remapped
//global.KEY_LEFT = ord("A"); //vk_left;
//global.KEY_RIGHT = ord("D"); //vk_right;
//global.KEY_UP = ord("W"); //vk_up;
//global.KEY_DOWN = ord("S"); //vk_down;
//global.KEY_ESCAPE = vk_escape;
//global.KEY_ENTER = vk_enter;


// local variables
aspect_ratio = 1;


//
// Update Every Room's Dimensions
//
// This is an easy way to dynamically update all the rooms to match when the final
// game's width and height is undetermined.
//

/*
var scale_factor = 2;
var window_width = window_get_width();
var window_height = window_get_height();
var view_width = (window_width / scale_factor);
var view_height = (window_height / scale_factor);

var more_rooms = true;
var rm = room_next(room);
while (more_rooms)
{
    room_set_view_enabled(rm, true);
    room_set_viewport(rm, 0, true, 0, 0, view_width, view_height);
    if (rm == room_last)
    {
        more_rooms = false;
    }
    else
    {
        rm = room_next(rm);
    }
}
*/

global.VIEW_SCALE = 3;
global.BG_COLOR = make_color_rgb(24, 23, 76); // dark purple
global.WINDOW_WIDTH = window_get_width();
global.WINDOW_HEIGHT = window_get_height();
global.VIEW_WIDTH = (global.WINDOW_WIDTH / global.VIEW_SCALE);
global.VIEW_HEIGHT = (global.WINDOW_HEIGHT / global.VIEW_SCALE);

