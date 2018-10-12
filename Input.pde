public class Input{
  boolean formerMousePressed; //前fpsにマウスが押されていたか
  boolean formerKeyPressed; //前fpsにキーが押されていたか
  char useKey[]=new char[2];

  Input(int gamemode) {
    this.formerMousePressed=false;
    this.formerKeyPressed=false;
    switch(gamemode){
    case 1:
      this.useKey[0]='z';
      this.useKey[1]='x';
      break;
    }
  }
}
