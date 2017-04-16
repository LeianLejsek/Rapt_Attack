
    


            if ground=1
            {
            if jump_timer>0
                {
                jump+=1
                if jump>2{jump=2}
                if jump=2{if abs(phy_speed_x)<3{jump=1}}
                }
                
            if jump=0
                {
                phy_speed_y=-6
                audio_play_sound(snd_jump1,1,0)
                }
                
            if jump=1
                {
                phy_speed_y=-7
                flip=0.3
                flip_mode=1
                audio_play_sound(snd_jump2,1,0)
                
                }
                
            if jump=2
                {
                phy_speed_y=-9
                flip=0.3
                flip_mode=2
                audio_play_sound(snd_jump3,1,0)
                }
            }
        else
            {
            if grab_joint>0
                {
                grab_timer=10
                physics_joint_delete(grab_joint)
                grab_joint=0
                grab_target=0
                phy_speed_y=-6
                audio_play_sound(snd_jump1,1,0)
                }
            }
            
            if slide=1 
                {
                phy_speed_y=-6 
                phy_speed_x=-(4*face) 
                face=-face
                flip=0
    
                }
                
        
        if ((grab_joint=0)and(grab_timer=0))
            {
            
            if instance_exists(obj_grabable)
                {
                grab_target=instance_nearest(x,y,obj_grabable)
                if grab_target>0
                    {
                    if point_distance(phy_position_x,phy_position_y,grab_target.phy_position_x,grab_target.phy_position_y)<16
                        {
                        grab_x=grab_target.phy_position_x
                        grab_y=grab_target.phy_position_y
                        phy_position_x=grab_target.phy_position_x
                        phy_position_y=grab_target.phy_position_y
                        audio_play_sound(snd_grab1,1,0)
                        dir=point_direction(phy_position_x,phy_position_y,grab_target.phy_position_x,grab_target.phy_position_y)
                        dis=point_distance(phy_position_x,phy_position_y,grab_target.phy_position_x,grab_target.phy_position_y)
                        //grab_joint=physics_joint_prismatic_create(self,grab_target,grab_target.phy_position_x,grab_target.phy_position_y,lengthdir_x(1,dir),lengthdir_y(1,dir),-dis,0,true,10000,-10,true,false)
                        //grab_joint=physics_joint_weld_create(self,grab_target,grab_target.phy_position_x,grab_target.phy_position_y,90,10,1,0)
                        grab_joint=physics_joint_distance_create(self,grab_target,phy_position_x,phy_position_y,grab_target.phy_position_x,grab_target.phy_position_y,0)
                        }
                    else
                        {
                        grab_target=0
                        }
                    }
                }
                
            }

        
    
    

