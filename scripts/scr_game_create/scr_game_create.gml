/// @descr scr_game_create()


// this object must be persistent
if ( ! persistent)
{
    persistent = true;
}


//
// Set Constants
//
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


//
// Set Globals
//

// instances
global.HUD = noone;
global.PLAYER = noone;

// parameters
global.GRAV = 500;
global.TICK = 0;
global.BLOCKS_ACTIVE = false;
global.BLOCK_1_ACTIVE = false;
global.BLOCK_2_ACTIVE = false;
global.GAME_ASPECT_RATIO = 1;

// game size and scaling
global.VIEW_SCALE = 3;
global.WINDOW_WIDTH = window_get_width();
global.WINDOW_HEIGHT = window_get_height();
global.VIEW_WIDTH = (global.WINDOW_WIDTH / global.VIEW_SCALE);
global.VIEW_HEIGHT = (global.WINDOW_HEIGHT / global.VIEW_SCALE);
global.BG_COLOR = make_color_rgb(24, 23, 76); // dark purple

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


//
// Set Instance Variables
//
aspect_ratio = 1;


