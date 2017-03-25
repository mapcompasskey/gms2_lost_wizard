/// @desc scr_camera_room_end()


// destroy the camera when leaving a room (*prevents memory leaks)
if (camera != noone)
{
    camera_destroy(camera);
}
