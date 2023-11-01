//argument0 - Character whose buttons will be created

character = argument0;

buttonList = ds_list_create();

if(character.canAct)
{
    if(character.firstLevelSlot > 0)
    {
        for(ii = 0; ii < ds_list_size(character.firstLevelSkillList); ii += 1)
        {
            ds_list_add(buttonList, ds_list_find_value(character.firstLevelSkillList, ii));
        }
     }
}

for(ii = 0; ii < ds_list_size(character.defaultActions); ii += 1)
{
    ds_list_add(buttonList, ds_list_find_value(character.defaultActions, ii));

}

buttonY = room_height - 48;

//Offsets for more than one button
buttonX = room_width/2 - ((ds_list_size(buttonList) -1) * 48);

for(ii = 0; ii < ds_list_size(buttonList); ii += 1)
{
    button = ds_list_find_value(buttonList, ii);
    
    switch(button)
    {
        //Default actions_________________________________________________________________
        case "end turn":
            with(instance_create(buttonX + (ii * 96), buttonY, obj_button))
            {
                title = "END TURN";
                
                sprite_index = spr_endTurnButton;
                text = "Would you like to end the turn? #Press ESC to go back.";
                
                hotkey = "X";
            }
            break;
            
        //Guardian Skils__________________________________________________________________
        
        case "Celestial Arrow":
            with(instance_create(buttonX + (ii * 96), buttonY, obj_button))
            {
                title = "CELESTIAL ARROW";

                text = "Press " + string(other.ii + 1) + " or Left-click to select, ESC to de-select. #Right-click on an allie to fire a radiant arrow. #4d6 dmg and a bonus on next attack against target.";
                
                hotkey = string(other.ii + 1);
                
                skill = true;
                skillSlot = string(other.character.firstLevelSlot);
            }
            break;
                
         case "Encourage":
            with(instance_create(buttonX + (ii * 96), buttonY, obj_button))
            {
                title = "ENCOURAGE";

                text = "Press " + string(other.ii + 1) + " or Left-click to select, ESC to de-select. #Give all Pyschopmps a small attack bonus. #1d4 bonus for 5 rounds";
                
                hotkey = string(other.ii + 1);
                
                skill = true;
                skillSlot = string(other.character.firstLevelSlot);
            }
            break;
            
        case "Recover":
            with(instance_create(buttonX + (ii * 96), buttonY, obj_button))
            {
                title = "RECOVER";

                text = "Press " + string(other.ii + 1) + " or Left-click to select, ESC to de-select. #Right-click on an allie to heal them for #1d8 + " + string(other.character.mag) + " hitpoints.";
                
                hotkey = string(other.ii + 1);
                
                skill = true;
                skillSlot = string(other.character.firstLevelSlot);
            }
            break;
            
        //Lich Skills_____________________________________________________________________
            
        case "Hell Grasp":
            with(instance_create(buttonX + (ii * 96), buttonY, obj_button))///////////////////////////40:09
            {
                title = "HELL GRASP";
                
                text = "Press " + string(other.ii + 1) + " or Left-click to select, ESC to de-select. #Right-click a square in range to summon a cone of hell-fire. #4d6 dmg(AOE).";
                
                hotkey = string(other.ii + 1);
                
                skill = true;
                skillSlot = string(other.character.firstLevelSlot);
            }
            break;
            
        case "Necro Barrage":
            with(instance_create(buttonX + (ii * 96), buttonY, obj_button))///////////////////////////40:09
            {
                title = "NECRO BARRAGE";
                
                text = "Press " + string(other.ii + 1) + " or Left-click to select, ESC to de-select. #Right-click to file deathly missiles towards all visible enemies. #1d4 + 1 dmg(cannot miss).";
                
                hotkey = string(other.ii + 1);
                
                skill = true;
                skillSlot = string(other.character.firstLevelSlot);
            }
            break;
            
        case "Toxic Sphere":
            with(instance_create(buttonX + (ii * 96), buttonY, obj_button))///////////////////////////40:09
            {
                title = "TOXIC SPHERE";
                
                text = "Press " + string(other.ii + 1) + " or Left-click to select, ESC to de-select. #Right-click an enemy to blast poison at them. #3d10 dmg + 3 turns of poison burn.";
                
                hotkey = string(other.ii + 1);
                
                skill = true;
                skillSlot = string(other.character.firstLevelSlot);
            }
            break;
            
    }

}

ds_list_destroy(buttonList);

