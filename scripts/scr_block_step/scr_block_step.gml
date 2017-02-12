/// @descr scr_block_step()


if (is_active != previous_is_active)
{
    // update the image
    if (is_active)
    {
        image_index = 1;
        mask_index = spr_block_mask;
    }
    else
    {
        image_index = 0;
        mask_index = noone;
    }
    
    previous_is_active = is_active;
}
