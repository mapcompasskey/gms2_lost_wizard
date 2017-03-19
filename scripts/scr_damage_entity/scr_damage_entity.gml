/// @desc scr_damage_entity(victim_id, attacker_id, points)
/// @param {real} victim_id The victim's instance id
/// @param {real} attacker_id The attacker's instance id
/// @param {number} points The number of points to add (or subtract if a negative number)


var inst = argument0;
var inst2 = argument1;
var points = argument2;
if (instance_exists(inst))
{
    // check if the victim instance is a child of obj_entity
    if (object_is_ancestor(inst.object_index, obj_entity))
    {
        with (inst)
        {
            // if the victim entity can be damaged
            if (can_be_attacked && attacker_id == noone)
            {
                // update victim instance with attacker information
                attacker_id = inst2;
                attacker_x = inst2.x;
                attacker_y = inst2.y;
                
                // update victim entity's health
                scr_update_entity_health(inst, points);
                
                return true;
            }
        }
    }
}
                
return false;
