//arguement0 -- origin node. Pathfind this node
//argument1 -- Unit's movement range
//argument2 -- unit's remaining actions

//Reset ALL node data.
scr_wipe_nodes();

var open, closed;
var start, current, neighbor;
var tempG, range, costMod;
    
//Declare variables needed from arguments
start = argument0;
range = argument1 * argument2;

//Create data structures
open = ds_priority_create();
closed = ds_list_create();

//Add starting node to the open list
ds_priority_add(open, start, start.G);

//While the open queue is not empty, repeat till all nodes have been looked at
while(ds_priority_size(open) > 0)
{
    //Remove node with lowest G
    current = ds_priority_delete_min(open);
    
    //Add node with lowest G to the closed list.
    ds_list_add(closed, current);
    
    //Step through all current neighbors
    for(ii = 0; ii < ds_list_size(current.neighbors); ii += 1)
    {
        //Store the current neighbor in the neighbor var
        neighbor = ds_list_find_value(current.neighbors, ii);
        
        //Add neighbors that are:
        //passable, no occupant, G is less than the movement range,
        //if neighbor isn't already in the closed list
        
        if(ds_list_find_index(closed, neighbor) < 0 && neighbor.passable && neighbor.occupant == noone && neighbor.cost + current.G <= range)
        {
            //New G if not already calculated
            if(ds_priority_find_priority(open, neighbor) == 0 || ds_priority_find_priority(open, neighbor) == undefined)
            {
                costMod = 1;
                
                //Give neighbor the appropriate parent
                neighbor.parent = current;
                
                //If node is diagonal, create costMod
                if(neighbor.gridX != current.gridX && neighbor.gridY != current.gridY)
                {
                costMod = 1.5;
                }
                
                //Calc G of neighbor, with costMod in place
                neighbor.G = current.G + (neighbor.cost * costMod);
                
                //Add neighbor to the open list
                ds_priority_add(open, neighbor, neighbor.G);
                
            } 
            else
            {
                //Find if neighbor's score would be lower if found from current node
                 costMod = 1;
                
                //Diagonal node
                if(neighbor.gridX != current.gridX && neighbor.gridY != current.gridY)
                {
                 costMod = 1.5;
                }
                tempG = current.G + (neighbor.cost * costMod);
                
                //check if G is lower
                if(tempG < neighbor.G)
                {
                    neighbor.parent = current;
                    neighbor.G = tempG;
                    ds_priority_change_priority(open, neighbor, neighbor.G);
                }
            }
        }
    }
}

//Round down G for movement calcs.
with(obj_node)
{
    G = floor(G);
}

//Destroy open
ds_priority_destroy(open)

//Color all move nodes then destroy the closed list.
for(ii = 0; ii < ds_list_size(closed); ii += 1)
{
    current = ds_list_find_value(closed, ii);
    current.moveNode = true;
    
    scr_color_move_node(current, argument1, argument2);
}

//Destroy closed list
ds_list_destroy(closed);

start.moveNode = false;

scr_create_buttons(start.occupant);
