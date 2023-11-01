//argument0 - Character for the list
//argument1 - Level of the character
//argument2 - Class of the character
character = argument0;
level = argument1;
class = argument2;

for(ii = 1; ii <= level; ii += 1)
{
    switch(class)
    {
        case "Guardian":
            switch(ii)
            {
                case 1:
                    ds_list_add(character.firstLevelSkillList, "Celestial Arrow");
                    ds_list_add(character.firstLevelSkillList, "Encourage");
                    ds_list_add(character.firstLevelSkillList, "Recover");
                    
                    break;
            }
            break;
            
        case "Lich":
            switch(ii)
            {
                case 1:
                    ds_list_add(character.firstLevelSkillList, "Hell Grasp");
                    ds_list_add(character.firstLevelSkillList, "Necro Barrage");
                    ds_list_add(character.firstLevelSkillList, "Toxic Sphere");
                    
                    
                    break;
            }
            break;
    
    }

}
