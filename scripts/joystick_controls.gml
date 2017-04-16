dvc = argument0;

jump_released=0


if gamepad_axis_value(dvc,gp_axislh)<-0.75 {
    left_held=1
    joy_in_use=1
}
else {
    left_held=0
}

if gamepad_axis_value(dvc,gp_axislh)>0.75 {
    right_held=1
    joy_in_use=1
}
else {
    right_held=0
}
    
if gamepad_axis_value(dvc,gp_axislv)<-0.75 {
    up_held=1
    joy_in_use=1
}
else {
    up_held=0
}
    
if gamepad_axis_value(dvc,gp_axislv)>0.75 {
    down_held=1
    joy_in_use=1
}
else {
    down_held=0
}
    
    
if gamepad_button_check(dvc,gp_face1) {
    if ((jump_pressed=0)and(jump_held=0)) {
        jump_pressed=1
        joy_in_use=1
    }
    else {
        jump_pressed=0
        jump_held=1
        joy_in_use=1
    }
}
else {
    jump_pressed=0
    jump_released=1
    jump_held=0
}

