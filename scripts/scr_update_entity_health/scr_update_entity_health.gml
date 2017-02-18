/// @desc scr_update_entity_health(instance_id, points)
/// @param {real} instance_id The id of the instance to update
/// @param {number} points The number of points to add (or subtract if a negative number)


var inst = argument0;
var points = argument1;
if (instance_exists(inst))
{
    // check if this instance is a child of obj_entity
    if (object_is_ancestor(inst.object_index, obj_entity))
    {
        with (inst)
        {
            // update instance
            health_updated = true;
            health_updated_points += points;
            
            return true;
        }
    }
}
                
return false;
