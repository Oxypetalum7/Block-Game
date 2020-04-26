class Block { //ブロックを管理
  final float block_width = 30;
  final int max_pitch = 100;
  final int min_pitch = 37;
  final int top_bottom_margin = 150; //上下の余白
  final float block_height = (height - top_bottom_margin * 2) / (max_pitch - min_pitch + 1);
  float block_x;
  float block_y;
  int channel;
  int count = 1;

  Block(int pitch, int channel) { //sendからArraList経由のデータをもとにパラメータを設定
    this.block_x = width;
    this.block_y = (max_pitch - pitch) * block_height+top_bottom_margin;
    this.channel = channel;
  }

  void show() { //描画
    block_x = block_x - 8; //左に動く
    fill( channel*16-1, 192, 255 ); //チャンネル(パート)毎に色が変わる
    noStroke();
    if (count == 1) {
      rect(block_x, block_y, block_width, block_height);
    }
  }

  boolean hitcheck() { //当たり判定
    if ( block_x < ( ball.x + 5 ) && ( ball.x - 5 ) < ( block_x + block_width ) && (( block_y - 5) < ball.y ) && ball.y < ( block_y + block_height + 5 )) {
      count = 0;
      return true;
    }
    return false;
  }
}
