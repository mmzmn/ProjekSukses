// =====================================
// PHASE INTRO SCREEN
// =====================================
if (instance_exists(obj_spawner))
{
    if (obj_spawner.phase_showing)
    {
        draw_set_halign(fa_center);
        draw_set_valign(fa_middle);
        draw_set_color(c_white);
        draw_set_font(-1);
        draw_text(room_width / 2, room_height / 2 - 40,
            "STAGE " + string(global.phase));
        draw_text(room_width / 2, room_height / 2 + 20,
            "GET READY!");
        draw_set_color(c_white);
    }
}

// =====================================
// HUD
// =====================================
draw_set_halign(fa_left);
draw_set_valign(fa_top);
draw_set_font(-1);
draw_set_color(c_white);
draw_text(room_width - 180, 20, "SCORE: " + string(floor(global.score)));
draw_text(room_width - 180, 50, "STAGE: " + string(global.phase));

var buff_y = 20;

if (instance_exists(obj_player))
{
    var p = instance_find(obj_player, 0);
    if (p != noone)
    {
        if (p.speed_timer > 0)
        {
            draw_set_color(c_yellow);
            draw_text(20, buff_y,
                "SPEED +" +
                string(round((p.speed_multiplier - 1) * 100)) +
                "% | " +
                string(ceil(p.speed_timer / room_speed)) +
                "s"
            );
            buff_y += 30;
        }
        if (p.timestop_timer > 0)
        {
            draw_set_color(c_lime);
            draw_text(20, buff_y,
                "FREEZE BLACK HOLE | " +
                string(ceil(p.timestop_timer / room_speed)) +
                "s"
            );
            buff_y += 30;
        }
        if (p.slowenemy_timer > 0)
        {
            draw_set_color(c_aqua);
            draw_text(20, buff_y,
                "SLOW ENEMY | " +
                string(ceil(p.slowenemy_timer / room_speed)) +
                "s"
            );
            buff_y += 30;
        }
        draw_set_color(c_white);
    }
}

// =====================================
// GAME OVER
// =====================================
if (global.game_over)
{
    draw_set_halign(fa_center);
    draw_set_valign(fa_middle);
    draw_set_color(c_white);
    draw_text(room_width / 2, room_height / 2 - 60, "GAME OVER");
    draw_text(room_width / 2, room_height / 2,
        "Stage: " + string(global.phase));
    draw_text(room_width / 2, room_height / 2 + 40,
        "Final Score: " + string(floor(global.score)));
    draw_text(room_width / 2, room_height / 2 + 80, "Click to Restart");
}