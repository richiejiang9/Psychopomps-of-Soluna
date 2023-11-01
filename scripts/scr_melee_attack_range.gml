//argument0 = Character sued

character = argument0;

actions = character.actions;

if(character.strike)
{
    range = character.move * character.actions;
}
else
{
    range = character.move;
}


with(obj_character)
{
    if(side != other.character.side)
    {
        tempX = abs(gridX - other.character.gridX);
        tempY = abs(gridY - other.character.gridY);
        
        if(tempX <= 1 && tempY <= 1)
        {
            map[gridX, gridY].atkNode = true;
            map[gridX, gridY].color = c_red;
        
        }
        else
        {
            if(other.actions > 1)
            {
                node = map[gridX, gridY];
                
                for(ii = 0; ii < ds_list_size(node.neighbors); ii += 1)
                {
                    neighbor = ds_list_find_value(node.neighbors, ii);
                    
                    if(neighbor.G > 0 && neighbor.G <= other.range)
                    {
                        map[gridX, gridY].atkNode = true;
                        map[gridX, gridY].color = c_red;
                    
                    }
                    
                }
                
            }
            
        }
        
    }
}
