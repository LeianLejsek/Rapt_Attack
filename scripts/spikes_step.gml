//called by "step"
if( spikes_movement = 1 ) {
    spikes_speed--;
    y+=spikes_speed;
    if( y <= initial_ypos - sprite_height) {
        y = initial_ypos - sprite_height;
        extended_spikes_timer++;
    }
    if( extended_spikes_timer = 10 ) {
        spikes_movement = -1;
        extended_spikes_timer = 0;
        spikes_speed = 0;
    }
}
if( spikes_movement = -1 ) {
    spikes_speed++;
    y+= spikes_speed;
    if( y >= initial_ypos) {
        y = initial_ypos;
        spikes_movement = 0;
        spikes_speed = 0;
        alarm[0] = spikes_timer;
    }  
}
