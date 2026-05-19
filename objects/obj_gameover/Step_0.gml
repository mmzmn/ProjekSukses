if (global.game_over)
{
    if (mouse_check_button_pressed(mb_left))
    {
        global.game_over = false;
        global.game_win = false;
        global.score = 0;
        global.phase = 1;
		audio_stop_all();
        room_restart();
    }
}

if (global.game_win)
{
    if (mouse_check_button_pressed(mb_left))
    {
        global.game_over = false;
        global.game_win = false;
        global.score = 0;
        global.phase = 1;
		audio_stop_all();
        room_restart();
    }
}