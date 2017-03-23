/// @desc scr_camera_create()

/*
//Grab the window width/height from the viewport in the set-up room
global.window_width = view_get_wport(0);
global.window_height = view_get_hport(0);

//Set up dimensions for camera view and surface (divide by a higher number to zoom in further)
global.game_width = global.window_width / 2;
global.game_height = global.window_height / 2;

//Initialise the camera with nothing
camera = noone;

//Create the surface
surf = surface_create(global.game_width, global.game_height);

//Now go to the main game room: This will skip the first room_start event (in the set-up room)
room = rmDungeonReborn;
*/

// this object must be persistent
if ( ! persistent)
{
    persistent = true;
}

// update globals
global.CAMERA = id;

// instance variables
camera = noone;
