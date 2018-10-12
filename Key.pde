class Key{
  char letter;
  boolean formerPressed;
  
  Key(char letter){
    this.letter=letter;
    this.formerPressed=false;
    
  }
  
  boolean isPressed(){
    boolean nowPressed=false;
    
    if(key==this.letter){
      if(keyPressed==true){
        if(formerPressed==false){
          this.formerPressed=true;
          nowPressed=true;
        }else{
          nowPressed=false;
        }
      }else{
        this.formerPressed=false;
        nowPressed=false;
      }
    }
    
    return nowPressed;
  }
  
}
