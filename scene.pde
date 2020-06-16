class Scene {
  int Mode = 0;
  boolean fcflag = true;
  void title() {
    textSize(30);
    text("BLO_MIDI", width/2, height/2);
    text("Press ENTER key to start", width/2, height/2+100);
    if (getFile != null) {
      //ファイルを取り込む
      fileLoader();
    } 
    if (keyPressed == true) {
      if ( key == ENTER ) {
        if (fcflag) {
          getFile = getFileName();
          fcflag = false;
          keyPressed = false;
        }
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
      textSize(30);
      text("GAMEOVER", width/2, height/2);
      textSize(15);
      text("Press ENTER key to return to title", width/2, height/2+100);
      if (keyPressed == true) {
        if ( key == ENTER ) {
          Mode = 0;
          fcflag = true;
          keyPressed = false;
        }
      }
    }
  }

  void gameClear() {

    fill(255);
    textSize(30);
    text("CLEAR!", width/2, height/2);
    textSize(15);
    text("Press ENTER key to return to title", width/2, height/2+100);
    if (keyPressed == true) {
      if ( key == ENTER ) {
        Mode = 0;
        fcflag = true;
        keyPressed = false;
      }
    }
  }
}
