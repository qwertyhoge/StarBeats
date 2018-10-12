int difficulty;
int circleindex;
int interval;
int intervalFlame;
ArrayList<OsuNote> circles= new ArrayList<OsuNote>();

void setup(){
  
  difficulty=2;
  circleindex=0;
  intervalFlame=0;
  
  switch(difficulty){
  case 1:
    interval=300;
    break;
  case 2:
    interval=180;
    break;
  case 3:
    interval=30;
    break;
  }
  
  size(800, 600);
  ellipseMode(CENTER);
  background(0);
}

void draw() {
  int score;
  int i,j,k;
  
  background(0);


  if(intervalFlame>=interval){
    circles.add(new OsuNote(difficulty));
    intervalFlame=0;
  }

  for(i=0;i<circles.size();i++){
    OsuNote circle = circles.get(i);
    circle.dispCircle();
    
    if(circle.scoreFlame>=circle.scoreFlameLimit){
      circles.remove(i);
    }
    
    for(j=0;j<circle.keyNum;j++){
      if(circle.keys[j].isPressed()==true){
        if(circle.isMouseInside(mouseX,mouseY)==true){
          circle.isBeated=true;
          circle.getScore(circle.targetFlame-circle.flame,difficulty);
        }
      }
    }
        
        
  
  }
  
  
  
  intervalFlame++;
  
}

