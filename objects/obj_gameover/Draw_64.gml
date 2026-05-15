draw_set_halign(fa_left);
draw_set_valign(fa_top);

draw_set_font(-1);

draw_text(
    room_width - 180,
    20,
    "SCORE: " + string(floor(global.score))
);


if (global.game_over)
{
    draw_set_halign(fa_center);
    draw_set_valign(fa_middle);


    draw_text(room_width / 2, room_height / 2 - 40, "GAME OVER");

    draw_set_font(-1);

    draw_text(
        room_width / 2,
        room_height / 2 + 20,
        "Final Score: " + string(floor(global.score))
    );
}