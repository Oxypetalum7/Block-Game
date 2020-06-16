//オブジェクトの作成
Scene scene = new Scene();
Midiload music = new Midiload();
Ball ball = new Ball();
State state = new State(); 
ArrayList < Block > blocks = new ArrayList< Block > ();

//基本情報の設定
void setup() {
  size(800,600);
  colorMode(HSB);
}


//描画
void draw() {
  background(0);
  //場面をswitchで管理
  switch(scene.Mode) {
  case 0: //タイトル
    scene.title();
    break;

  case 1: //ゲーム画面
    scene.play();
    break;

  case 2: //ゲームオーバー
    scene.gameOver();
    break;

  case 3: //ゲームクリア
    scene.gameClear();
    break;
  }
}
