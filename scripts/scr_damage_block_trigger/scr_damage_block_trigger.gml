/// @desc scr_damage_block_trigger(victim_id, attacker_id)
/// @param {real} victim_id The victim's instance id
/// @param {real} attacker_id The attacker's instance id


var inst = argument0;
var inst2 = argument1;
if (instance_exists(inst))
{
    // check if this instance is a child of obj_block_trigger
    if object_is_ancestor(inst.object_index, obj_block_trigger)
    {
        with (inst)
        {
            // if the block trigger can be damaged
            if (can_be_attacked && attacker_id == noone)
            {
                // update instance
                attacker_id = inst2;
                
                return true;
            }
        }
    }
}
                
return false;