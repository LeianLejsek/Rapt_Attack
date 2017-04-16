if abs(phy_speed_x)<1{sprite_index=spr_stand} // we are standing

if abs(phy_speed_x)>1{sprite_index=spr_walk} // walking now

if abs(phy_speed_x)>4{sprite_index=spr_run}// OMG WE CAN RUN!?!?!?

if ground=0 // jump spries
    {
    sprite_index=spr_jump image_single=1
    if phy_speed_y<-4{image_single=0}
    if phy_speed_y>-2{image_single=1}
    if phy_speed_y>2{image_single=2}
    }
else
    {
    image_single=-1
    }
    
if walk=0 // standing sprites 
    {
    animate_speed=0.2
    image_speed=0.2
    }
else
    {
    animate_speed=0.75
    image_speed=0.75
    }
    
    
if flip>0 // double jump sprites
{
    flip+=0.2
    
    if flip_mode=1
        {
        if flip>6{flip=0 flip_mode=0}
        sprite_index=spr_flip2
        flip+=0.3
        image_single=flip
        }
        
    if flip_mode=2
        {
        if flip>3{flip=0 flip_mode=0 jump=0}
        sprite_index=spr_flip1
        image_single=flip
        }

    
}
    
slide=0

if ground=0 // wall slides
    {
    if face=1
        {   
        if physics_test_overlap(x+1,y-4,0,obj_wall)
            {
            if physics_test_overlap(x-1,y-4,0,obj_wall)=false
                {
                sprite_index=spr_slide 
                image_single=1
                slide=1
                }
            }
        }
        
    if face=-1
        {   
        if physics_test_overlap(x-1,y-4,0,obj_wall)
            {
            if physics_test_overlap(x+1,y-4,0,obj_wall)=false
                {
                sprite_index=spr_slide 
                image_single=1
                slide=1
                }
            }
        }
    }
    
if slide=1
    {
    if phy_speed_y>0.5{phy_speed_y=0.5} // y drag while sliding
    }
    

if grab_joint>0
    {
    sprite_index=spr_hang // hanging sprites 
    }



image_xscale=face

if sprite_index=spr_walk{step_sound_timer-=2}
if sprite_index=spr_run{step_sound_timer-=3}
