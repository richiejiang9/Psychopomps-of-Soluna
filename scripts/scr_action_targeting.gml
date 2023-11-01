//argument0 - The character
//argument1 - Targeting type
//argument2 - Targeting range

character = argument0;
targetingType = argument1;
range = argument2;

switch(targetingType)
{
    case "cone":
        originX = character.x + 16;
        originY = character.y + 16;
        if(obj_cursor.hoverNode != noone)
        {
            dir = point_direction(originX, originY, obj_cursor.hoverNode.x + 16, obj_cursor.hoverNode.y + 16);
        }
        else
        { 
            dir = point_direction(originX, originY, 16, 16); 
        }
        
        originX += lengthdir_x(31, dir);
        originY += lengthdir_y(31, dir);/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
        dist = range - 16;/////////////////////////////////////////////////////////////////
        
        for(ii = -30; ii <= 30; ii += 15)
        {
            for(jj = 0; jj <= dist; jj += 8)
            {
                tempX = originX + lengthdir_x(jj, dir + ii);
                tempY = originY + lengthdir_y(jj, dir + ii);
                
                if(!collision_line(originX, originY, tempX, tempY, obj_wall, false, false))
                {
                    if(instance_position(tempX, tempY, obj_node))
                    {
                        node = instance_position(tempX, tempY, obj_node);
                        
                        if(node.type != "wall")
                        {
                            node.actionNode = true;
                            node.color = c_purple;
                        }
                    
                    }
                }
            
            }
        }
        
        break;
        
    case "visible allies":
        with(obj_character)
        {
            if(side == other.character.side)
            {
                if(!collision_line(x, y, other.character.x, other.character.y, obj_wall, false, false))
                {
                    node = map[gridX, gridY];
                    
                    node.actionNode = true;
                    node.color = c_purple;
                
                }
            }
        }
        break;
        
    case "visible enemies":
        with(obj_character)
        {
            if(side != other.character.side)
            {
                if(!collision_line(x, y, other.character.x, other.character.y, obj_wall, false, false))
                {
                    node = map[gridX, gridY];
                    
                    node.actionNode = true;
                    node.color = c_purple;
                
                }
            }
        }
        break;
}
