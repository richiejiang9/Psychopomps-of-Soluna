//argument0 - id of character making attack.
//argument1 - id of target.

character = argument0;
target = argument1;
roll = character.atkRoll;
status = "miss";

if(target.celestialArrow)
{
    roll = max(roll, irandom_range(1, 20));
    
    target.celestialArrow = false;

}

if(character.atkRoll == 20)
{
    status = "crit";
}
else
{
    if(character.encourage > 0)
    {
        roll += irandom_range(1, 4);
    }
    if(roll + character.dmgBonus >= target.armorClass)
    {
        status = "hit";
    }
    else
    {
        status = "miss";
    }
}

return status;
