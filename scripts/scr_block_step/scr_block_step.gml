/// @descr scr_block_step()


if (is_active != previous_is_active)
{
    // if active, add a collision mask
    if (is_active)
    {
        image_index = 1;
        mask_index = draw_sprite_index;
    }
    // else, remove the collision mask
    else
    {
        image_index = 0;
        mask_index = noone;
    }
    
    previous_is_active = is_active;
}
