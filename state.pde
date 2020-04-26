class State { //ボールを任意のタイミングで離せるようにする
  boolean state_ball = false;
  boolean state_block = false;
  int count = 0;
  void ball_run() {
    ball.show();
    if (state_ball == false) {
      if (mousePressed) { //マウスを押すと落下
        state_ball = true; //一回きり
      }
    } else if (state_ball) {
      ball.move();
    }
  }
}
