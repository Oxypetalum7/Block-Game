class Scene {
  int Mode = 0;
  void title() {
    textSize(30);
    text("BLO_MIDI", width/2, height/2);
    text("Press ENTER key to start", width/2, height/2+100);
    if (keyPressed == true) {
      if ( key == ENTER ) {
        Mode = 1;
      }
    }
  }

  void play() {
    music.start();
    //get midi notes
    for (ShortMessage sm : music.getShortMessages()) {
      blocks.add(new Block(sm.getData1(), sm.getChannel()));
    }

    //draw
    background(0);
    state.ball_run();
    for (Block block : blocks) {
      block.show();
    }
    if (ball.y > height) {
      Mode = 2;
    }

  }

  void gameOver() {
    if (ball.y>height) {
      music.stop();
      fill(255);
      text("GAMEOVER", width/2, height/2);
    }
  }

  void gameClear() {
    
    fill(255);
    text("CLEAR!", width/2, height/2);
  }
}
