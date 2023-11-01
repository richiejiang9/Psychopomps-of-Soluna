//Argument0 - character range checking.

character = argument0;

with(obj_character)
{   
    tempCharacter = other.character
    
    if(side != tempCharacter.side)
    {
        //checks the range
        if(point_distance(x + 16, y + 16, tempCharacter.x + 16, tempCharacter.y + 16) <= tempCharacter.atkRange)
        {
            if(!collision_line(x + 16, y + 16, tempCharacter.x + 16, tempCharacter.y + 16, obj_wall, false, false))
            {
                map[gridX, gridY].atkNode = true;
                map[gridX, gridY].color = c_red;
                
            }
        }
    }
}
