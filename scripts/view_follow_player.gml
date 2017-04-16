//For some reason calls to the player who has just died
miau!

for( var i = 0; i < obj_game_controls.players; i++ ) {
    if( obj_game_controls.player_alive[ i ] == true ) {
        var player_to_follow = obj_game_controls.player[ i ];
        x = player_to_follow.x;
        y = player_to_follow.y;
        exit;
    }
}
