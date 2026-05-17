if (global.game_over)
{
    if (mouse_check_button_pressed(mb_left))
    {
        global.game_over = false;
        global.score = 0;
        room_restart();
    }
}