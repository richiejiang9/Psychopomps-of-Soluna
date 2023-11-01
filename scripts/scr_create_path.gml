//argument0 = The character we're creating the path for
//argument1 = Destination node

selectedCharacter = argument0;
current = argument1;

//Priority queue
 path = ds_priority_create();
 
 //add current node to queue
 ds_priority_add(path, current, current.G);
 
 //Step through nodes till done
 while(current.parent != noone)
 {
     ds_priority_add(path, current.parent, current.parent.G);
     
     current = current.parent;
 }
 
 do{
     current = ds_priority_delete_min(path);
     
     path_add_point(selectedCharacter.movementPath, current.x, current.y, 100);
 
 }until(ds_priority_empty(path));
 
 
 //Clean queue
 ds_priority_destroy(path);
