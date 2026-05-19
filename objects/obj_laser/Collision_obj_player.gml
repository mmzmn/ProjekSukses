audio_stop_all();
global.game_over = true;
instance_destroy(other); // hancurkan player
instance_destroy();      // hancurkan laser