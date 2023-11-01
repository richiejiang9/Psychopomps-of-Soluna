//argument0 - Character performing action
//argument1 - Action being performed

character = argument0;
action = argument1;

switch(action)
{
    //Default Actions_____________________________________________________________________
    case "END TURN":
        character.state = "end turn";
        character.actionTimer = 20;
        break;
        
    //Guardian Skills_____________________________________________________________________
    case "Celestial Arrow":
        target = obj_cursor.hoverNode.occupant;
        atkRoll = irandom_range(1, 20);
        atkStatus = scr_atk_roll(character, target);
        dmgType = "radiant";
        tempDmg = 0;

        for(ii = 0; ii <4; ii += 1)
        {
            tempDmg += irandom_range(1, 6);
        }
        
        atkDir = point_direction(character.x + 16, character.y + 16, target.x + 16, target.y + 16);
        
        with(instance_create(character.x + 16, character.y + 16, obj_celestialArrow))
        {
            audio_play_sound(snd_arrow, 1, false);
            target = other.target;
            status = other.atkStatus;
            
            dmg = other.tempDmg;
            path_add_point(movementPath, other.character.x + 16, other.character.y + 16, 100);
            
            if(status != "false")
            {
                path_add_point(movementPath, target.x + 16, target.y + 16, 100);            
            }
            else
            {
                path_add_point(movementPath, target.x + 16 + (irandom_range(30, 50) * choose(-1, 1)), target.y + 16 + (irandom_range(30, 50) * choose(-1, 1)), 100);
            }
            
            path_start(movementPath, speed, true, true);
        
        }
        
        character.firstLevelSlot -= 1;
        character.canAct = false;
        character.actions -= 1;
        character.state = "end action";
        character.actionTimer = 30;
        
        break;
        
    case "Encourage":
        targets = ds_list_create();
        audio_play_sound(snd_encourage, 1, false);
        
        with(obj_node)
        {
            if(actionNode)
            {
                ds_list_add(other.targets, id);
            }
        }
        
        for(ii = 0; ii < ds_list_size(targets); ii += 1)
        {
            target = ds_list_find_value(targets, ii).occupant;
            target.encourage = obj_control.roundCounter + 5;
            with(instance_create(target.x, target.y, obj_encourage))
            {
                target = other.target;
            
            }
        }
        ds_list_destroy(targets);
       
        character.firstLevelSlot -= 1; 
        character.canAct =false;
        character.actions -= 1;
        character.state = "end action";
        character.actionTimer = 45;
    
        break;
        
    case "Recover":
        target = obj_cursor.hoverNode.occupant;
        audio_play_sound(snd_encourage, 1, false);
        
        heal = irandom_range(1, 8) + character.mag;
        
        heal = min(heal, target.maxHP - target.hitPoints);
        
        target.hitPoints += heal;
        
        with(instance_create(target.x + 28, target.y + 4, obj_dmgText))
        {
            ground = y;
            text = "+" + string(other.heal);
            color = c_aqua;
        }
        character.firstLevelSlot -= 1;
        character.canAct = false;
        character.actions -= 1;
        character.state = "end action";
        character.actionTimer = 45;
        
        break;
    
    //Lich Skills_________________________________________________________________________
    case "Hell Grasp":
        audio_play_sound(snd_explosion, 1, false);
        targets = ds_list_create();
        dmg = 0;
        for(ii = 0; ii < 4; ii += 1)
        {
            dmg += irandom_range(1, 6);
        }
        
        with(obj_node)
        {
            if(actionNode)
            {
                ds_list_add(other.targets, id);
            }
        }
        
        for(ii = 0; ii < ds_list_size(targets); ii += 1)
        {
            node = ds_list_find_value(targets, ii);
            
            with(instance_create(node.x + 16, node.y + 16, obj_flameEmitter))
            {
                target = other.node.occupant;
                saveDC = other.character.skillSaveDC;
                dmg = other.dmg;
            
            }
        }
        ds_list_destroy(targets);
        character.firstLevelSlot -= 1;
        character.canAct = false;
        character.actions -= 1;
        character.state = "end action";
        character.actionTimer = 30;
        
        
        break;
        
    case "Necro Barrage":
        targets = ds_list_create();
        
        with(obj_node)
        {
            if(actionNode)
            {
                ds_list_add(other.targets, id);
            }
        }
        for(ii = 0; ii < ds_list_size(targets); ii += 1)
        {
            target = ds_list_find_value(targets, ii).occupant;
            with(instance_create(character.x + 16, character.y + 16, obj_swordBeam))
            {
                audio_play_sound(snd_explosion, 1, false);
                target = other.target;
                status = "hit";
                dmg = irandom_range(1, 4) + 1;
                dmgType = "force";
                
                path_add_point(movementPath, other.character.x + 16, other.character.y + 16, 100);
                path_add_point(movementPath, other.target.x + 16, other.target.y + 16, 100);
                path_start(movementPath, speed, true, true);
            
            }
        }
        
        ds_list_destroy(targets);
        character.firstLevelSlot -= 1;
        character.canAct = false;
        character.actions -= 1;
        character.state = "end action";
        character.actionTimer = 30;
        
        break;
        
    case "Toxic Sphere":
        audio_play_sound(snd_explosion, 1, false);
        target = obj_cursor.hoverNode.occupant;
        atkRoll = irandom_range(1, 20);
        atkStatus = scr_atk_roll(character, target);
        dmgType = "acid";
        tempDmg = 0;
        
        for(ii = 0; ii <3; ii += 1)
        {
            tempDmg += irandom_range(1, 10);
        }
        
        atkDir = point_direction(character.x + 16, character.y + 16, target.x + 16, target.y + 16);
        
        with(instance_create(character.x + 16, character.y + 16, obj_toxicSphere))
        {
            target = other.target;
            status = other.atkStatus;
            
            dmg = other.tempDmg;
            path_add_point(movementPath, other.character.x + 16, other.character.y + 16, 100);
            
            if(status != "false")
            {
                path_add_point(movementPath, target.x + 16, target.y + 16, 100);            
            }
            else
            {
                path_add_point(movementPath, target.x + 16 + (irandom_range(30, 50) * choose(-1, 1)), target.y + 16 + (irandom_range(30, 50) * choose(-1, 1)), 100);
            }
            
            path_start(movementPath, speed, true, true);
        
        }
        
        character.firstLevelSlot -= 1;
        character.canAct = false;
        character.actions -= 1;
        character.state = "end action";
        character.actionTimer = 30;
    
        break;
}

