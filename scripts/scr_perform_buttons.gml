//argument0 - Character performing action
//argument1 - The button used

character = argument0;
button = argument1;

switch(button.title)
{
    case "END TURN":
        character.state = "begin action";
        character.readiedAction = "END TURN";
        character.targetingType = "none";
        
        with(instance_create(room_width/2, room_height, obj_confirmButton))
        {
            title = other.button.title;
            text = other.button.text;

            hotKey = other.button.hotkey;
            
        }
        
        scr_wipe_nodes();
        scr_wipe_buttons();
        
        break;
        
    //Guardian Skills_____________________________________________________________
 
       case "CELESTIAL ARROW":
        character.state = "begin action";
        character.readiedAction = "Celestial Arrow";
        character.targetingType = "visible enemies";
        character.actionRange = 640;
        
        with(instance_create(room_width/2, room_height, obj_confirmBox))
        {
            title = other.button.title;
            text = other.button.text;
        
        }
        scr_wipe_nodes();
        scr_wipe_buttons();
        
        break;
    
        case "ENCOURAGE":
        character.state = "begin action";
        character.readiedAction = "Encourage";
        character.targetingType = "visible allies";
        character.actionRange = 640;
        
        with(instance_create(room_width/2, room_height, obj_confirmButton))
        {
            title = other.button.title;
            text = other.button.text;
            
            hotkey = other.button.hotkey;
        
        }
        scr_wipe_nodes();
        scr_wipe_buttons();
        
        break;
        
    case "RECOVER":
        character.state = "begin action";
        character.readiedAction = "Recover";
        character.targetingType = "visible allies";
        character.actionRange = 640;
        
        with(instance_create(room_width/2, room_height, obj_confirmBox))
        {
            title = other.button.title;
            text = other.button.text;
        
        }
        scr_wipe_nodes();
        scr_wipe_buttons();
        
        break;
        
    //Lich Skills_________________________________________________________________
    
    case "HELL GRASP":
        character.state = "begin action";
        character.readiedAction = "Hell Grasp";
        character.targetingType = "cone";
        character.actionRange = 96;
        
        with(instance_create(room_width/2, room_height, obj_confirmBox))
        {
            title = other.button.title;
            text = other.button.text;
        
        }
        scr_wipe_nodes();
        scr_wipe_buttons();
        
        break;
        
    case "NECRO BARRAGE":
        character.state = "begin action";
        character.readiedAction = "Necro Barrage";
        character.targetingType = "visible enemies";
        character.actionRange = 640;
        
        with(instance_create(room_width/2, room_height, obj_confirmButton))
        {
            title = other.button.title;
            text = other.button.text;
            
            hotkey = other.button.hotkey;

        }
        scr_wipe_nodes();
        scr_wipe_buttons();
        
        break;
        
    case "TOXIC SPHERE":
        character.state = "begin action";
        character.readiedAction = "Toxic Sphere";
        character.targetingType = "visible enemies";
        character.actionRange = 640;
        
        with(instance_create(room_width/2, room_height, obj_confirmBox))
        {
            title = other.button.title;
            text = other.button.text;

        }
        scr_wipe_nodes();
        scr_wipe_buttons();
        
        break;

}
