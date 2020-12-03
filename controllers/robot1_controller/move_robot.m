function [new_RM_pos,new_LM_pos]= move_robot(distance,speed,acceleration,RM_pos,LM_pos)

left_motor = wb_robot_get_device('left_motor');
right_motor = wb_robot_get_device('right_motor');


wheel_radius = 0.02625;
turns = distance/(2*wheel_radius*pi);
rotate_R = (turns * 6.283)+RM_pos;
rotate_L = (turns * 6.283)+LM_pos;
wb_motor_set_velocity(left_motor, speed);
wb_motor_set_velocity(right_motor, speed);
wb_motor_set_acceleration(left_motor, acceleration);
wb_motor_set_acceleration(right_motor, acceleration);
wb_motor_set_position(left_motor,rotate_L);
wb_motor_set_position(right_motor,rotate_R);
new_RM_pos = rotate_R;
new_LM_pos = rotate_L;

end