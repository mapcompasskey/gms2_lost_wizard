/// @desc scr_update_camera_position(target_x, target_y, snap_to)
/// @param {number} target_x The x position to move the camera to.
/// @param {number} target_y The y position to move the camera to.
/// @param {bool} snap_to Whether to instantly move to the target or to transition towards it.


//
// Update the Camera's Position
//
if (global.CAMERA != noone)
{
    global.CAMERA.target_x = argument0;
    global.CAMERA.target_y = argument1;
    global.CAMERA.snap_to = argument2;
    global.CAMERA.reposition = true;
}
