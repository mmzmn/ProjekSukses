if (other.invincible_timer <= 0)
{
    global.game_over = true;
    instance_destroy(other);
}