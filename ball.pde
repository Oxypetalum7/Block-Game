class Ball { //ボールを管理
  float x;
  float y;
  float dy;
  float g;

  Ball() {
    this.y = 10; //座標
    this.dy = 2; //加速度
    this.g = 0.20; //重力加速度
  }
  void show() {
    this.x = mouseX;
    fill(255);
    circle(x, y, 20);
  }

  void move() {
    dy = dy + g; //鉛直投げ上げ的な挙動
    y = y + dy;
    fill(255);
    for (Block block : blocks) {
      if (block.hitcheck()) {
        dy = -10; //跳ねる
      }
    }
  }
}
