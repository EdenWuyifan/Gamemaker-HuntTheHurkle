/// @description Insert description here
// You can write your code in this editor

//setups
str_input = "";


//do not exceed 10 chars
if(string_length(str_input)>10){
	keyboard_string = 0;
}
str_input += keyboard_string;

//check input
if(keyboard_check_pressed(vk_enter)){
	if(keyboard_string=="r"){
		room_restart();
	}else{
		ds_list_add(try_list,keyboard_string);
		keyboard_string = "";
		str_output = "";
	
		guess = ds_list_find_value(try_list,ds_list_size(try_list)-1);
		//last guess
		str_step = "Your last guess: ";
		str_step += guess;
		str_step += "."
		
		guess_x = real(string_copy(guess,0,string_pos(",",guess)-1));
		guess_y = real(string_copy(guess,string_pos(",",guess)+1,string_length(guess)-1));
	
		if(try_times>10){
			str_output += "Sorry you have used all of ur chances! Enter 'r' to restart.";
		}else if(guess_x > 99 or guess_x < 0 || guess_y > 99 or guess_y < 0){
			str_output += "Your guess is out of range! (0 ~ 99)";
			try_times -= 1;
		}else if(guess_x == hurkle_x && guess_y == hurkle_y){
			str_output += "Hurkle: You've got me! Enter 'r' to restart.";
		}else if(guess_x == hurkle_x && guess_y > hurkle_y){
			str_output += "Go North.";
		}else if(guess_x == hurkle_x && guess_y < hurkle_y){
			str_output += "Go South.";
		}else if(guess_x > hurkle_x && guess_y == hurkle_y){
			str_output += "Go West.";
		}else if(guess_x < hurkle_x && guess_y == hurkle_y){
			str_output += "Go East.";
		}else if(hurkle_x > guess_x && hurkle_y > guess_y){
			str_output += "Go South East.";
		}else if(hurkle_x < guess_x && hurkle_y > guess_y){
			str_output += "Go South West.";
		}else if(hurkle_x > guess_x && hurkle_y < guess_y){
			str_output += "Go North East.";
		}else if(hurkle_x < guess_x && hurkle_y < guess_y){
			str_output += "Go North West.";
		}
		try_times += 1;
	}
	
}

//last guess



//display texts
draw_set_font(font_game_small);
draw_text(10,10,"Where is hurkle?");
draw_text(10,40," (x,y from 0 to 99, seperated by ',')")
draw_set_font(font_game);
draw_text(10,80,str_input);
draw_set_font(font_game_small);
draw_text(10,160,str_output);
draw_text(10,220,str_step);
draw_text(500,260,"Lifes: "+string(10-try_times));


