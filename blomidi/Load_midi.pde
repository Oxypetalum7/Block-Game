import javax.sound.midi.*;
//JavaのMIDIライブラリを扱うためのクラス
class Midiload implements Receiver, MetaEventListener {
  
  Sequencer Mymidi;
  MetaEventListener listener;
  ArrayList<ShortMessage> short_message_buffer = new ArrayList<ShortMessage>();
  final private int END_OF_TRACK = 47;
  boolean alart_s = false;
  
  public void load(String path) { //MIDIファイル読み込みを試みる
    File midifile = new File(path);
    try {
      Mymidi = MidiSystem.getSequencer();
      Mymidi.addMetaEventListener(this);
      Mymidi.open();
      Transmitter transmitter = Mymidi.getTransmitter();
      transmitter.setReceiver(this);
    }  
    catch (MidiUnavailableException e) { //例外処理
      e.printStackTrace();
    }
    try {
      Sequence sequence = MidiSystem.getSequence(midifile); //MIDIファイルのデータ再生準備
      Mymidi.setSequence(sequence);
    }  
    catch (InvalidMidiDataException e) { //例外処理
      e.printStackTrace();
    }
    catch (IOException e) { //例外処理
      e.printStackTrace();
    }
  }

  public void start() { //再生
    Mymidi.start();
  }

  public void stop() { //停止
    Mymidi.stop();
  }

  @Override
    public void close() { //定義しないとエラーを吐く(空白可)
  }

  @Override
    public void send(MidiMessage message, long t) { //MIDIメッセージを取得する
    if (message instanceof ShortMessage) {
      ShortMessage sm = (ShortMessage) message;
      int cmd = sm.getCommand();
      if (cmd==ShortMessage.NOTE_ON) { //NOTE_ON(発音)に反応してArrayListにデータを送信
        short_message_buffer.add(sm);
      }
    }
  }
  @Override
    public void meta(MetaMessage message) { //END_OF_TRACKメッセージを監視する
    if (message.getType() == END_OF_TRACK) {
      scene.Mode = 3; //3 = CLEAR
    }
  }


  ArrayList<ShortMessage> getShortMessages() { //ShortMessage→Old_buffer→Blockに送る用の関数
    ArrayList<ShortMessage> old_buffer = short_message_buffer;
    short_message_buffer = new ArrayList<ShortMessage>();
    return old_buffer;
  }
}
