class OsuNote{
  
  int radius;
  int targetFlame;
  float flame;
  float circRate;
  float flameDist;
  int x,y; //円の中心x,y座標
  Key keyZ;
  Key keyX;//使用キー
  Key keys[];
  int keyNum;
  int score;
  int scoreFlame;
  int scoreFlameLimit;
  boolean isBeated;
  
  
  
  OsuNote(int difficulty){
    this.keyNum=2;
    this.flame=0;
    this.flameDist=-1;
    this.score=0;
    this.scoreFlame=0;
    this.scoreFlameLimit=40;
    this.isBeated=false;
    
    
    keyZ=new Key('z');
    keyX=new Key('x');
    
    keys=new Key[2];
    keys[0]=keyZ;
    keys[1]=keyX;
    
    
    switch(difficulty){
    case 1:
      this.radius=300;
      this.circRate=0.5;
      break;
    case 2:
      this.radius=200;
      this.circRate=0.9;
      break;
    case 3:
      this.radius=100;
      this.circRate=1.3;
      break;
    }
    this.x=(int)random(width-radius)+radius;
    
    this.y=(int)random(height-radius)+radius;
    if(this.y<height/2){
      this.y=(int)random(height-radius)+radius;
    }
    if(this.y<height/4){
      this.y=(int)random(height-radius)+radius;
    }
    this.targetFlame=59-radius/10;
    
  }
    
  void dispCircle()
  {
  
    
    if(targetFlame+1>=this.flame){
      if(this.isBeated==false){
        fill(255);
        ellipse(this.x, this.y,(59-this.flame)*10+3,(59-this.flame)*10+3);
        ellipse(this.x, this.y,(59-this.flame)*10+2,(59-this.flame)*10+2);
        ellipse(this.x, this.y,(59-this.flame)*10+1,(59-this.flame)*10+1);
        ellipse(this.x, this.y,(59-this.flame)*10,(59-this.flame)*10);
        ellipse(this.x, this.y,(59-this.flame)*10-1,(59-this.flame)*10-1);
        ellipse(this.x, this.y,(59-this.flame)*10+2,(59-this.flame)*10+2);
        ellipse(this.x, this.y,(59-this.flame)*10+3,(59-this.flame)*10+3);
        fill(0);
        ellipse(this.x, this.y,(59-this.flame)*10-4,(59-this.flame)*10-4);
        fill(#FFFFFF,140);
        ellipse(this.x,this.y,this.radius,this.radius);
        noFill();
      }
    }else{
      if(this.isBeated==false){
        fill(#FFFFFF,100);
        ellipse(this.x,this.y,this.radius,this.radius);
        noFill();
       // ellipse(this.x, this.y,(59-this.flame)*10+1,(59-this.flame)*10+1);
       // ellipse(this.x, this.y,(59-this.flame)*10,(59-this.flame)*10);
       // ellipse(this.x, this.y,(59-this.flame)*10-1,(59-this.flame)*10-1);
      }
    }
      
    if(flame>=59){
      this.isBeated=true;
      this.score=0;
    }
    
    
    if(this.isBeated==true){
      
      dispScore();
      
      scoreFlame++;
      
    }else{
      
      this.flame+=this.circRate;
    }
    
  }
  
  boolean isMouseInside(int mousex,int mousey){
    boolean inside=false;
    
    if(dist(mousex,mousey,this.x,this.y)<=this.radius){
      inside=true;
    }
    return inside;
  }
    
  
  void getScore(float flameDist,int difficulty){
    float dist=abs(flameDist);
    
    if(flameDist<0){
      this.score=-1;
    }
    
    switch(difficulty){
    case 1:
      dist/=2;
      if(1>=dist){
        this.score=300;
      }else if(3>=dist){
        this.score=100;
      }else if(5>=dist){
        this.score=50;
      }else{
        this.score=0;
      }
      break;
    case 2:
      dist/=2;
      if(1>=dist){
        this.score=300;
      }else if(3>=dist){
        this.score=100;
      }else if(5>=dist){
        this.score=50;
      }else{
        this.score=0;
      }
      break;
    case 3:
    dist/=1.3;
      if(1>=dist){
        this.score=300;
      }else if(3>=dist){
        this.score=100;
      }else if(5>=dist){
        this.score=50;
      }else{
        this.score=0;
      }
      break;
    }
    
    
  }
  
  void dispScore(){
    textAlign(CENTER);
    textSize(50);
  
    switch(this.score){
    case 300:
      fill(#00FFFF);
      break;
    case 100:
      fill(#00FF7F);
      break;
    case 50:
      fill(#F4A460);
      break;
    case 0:
      fill(#FF0000);
      break;
    }
    
    if(this.score>=0){
      text(this.score,this.x,this.y);
    }
    
    noFill();
  }
  



}
