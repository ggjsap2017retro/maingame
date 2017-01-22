Resources resources = new Resources();
static int displayScale = 2;
Game game = new Game();
Animation _animation;

enum GameStatus{
  Title, Tutorial, Playing, Gameover, Clear, Endroll
}
int tutocount;
GameStatus gameStatus;

void setup(){
  _animation=new Animation("operating",8);
  surface.setSize(16*20*displayScale, 16*15*displayScale);
  try{
    resources.minim = new Minim(this);
  }catch(Exception e){}

  gameStatus = GameStatus.Title;
  game.setup();
}

void draw(){
  println(gameStatus);
  background(0,0,0);

  pushMatrix();
  scale(displayScale, displayScale);

  if(gameStatus == GameStatus.Title){
    pushMatrix();
    translate(20*8, 15*10);
    resources.draw("Title.png");
    popMatrix();
  }

  if(gameStatus == GameStatus.Tutorial){
 
    pushMatrix();
    translate(20*8, 15*10.7);
    resources.draw("operating1.png");
    _animation.draw(tutocount);
    if(tutocount<7){
    tutocount++;
    try{
    Thread.sleep(200);
  }catch(InterruptedException e){ 
e.printStackTrace(); 
} 
    }else{
    tutocount=0;
    try{
    Thread.sleep(200);
  }catch(InterruptedException e){ 
e.printStackTrace(); 
} 
  }
    popMatrix();
  }

  if(gameStatus == GameStatus.Playing){
    game.update();
    game.draw();

    if(game.isGameover()){
      gameStatus = GameStatus.Gameover;
    }

    if(game.isGoal()){
      gameStatus = GameStatus.Clear;
    }
  }

  if(gameStatus == GameStatus.Gameover){
    pushMatrix();
    translate(20*8, 15*10.7);
    resources.draw("Gameover.png");
    popMatrix();
  }

  if(gameStatus == GameStatus.Clear){
    pushMatrix();
    translate(20*8, 15*10.7);
    resources.draw("clear.png");
    popMatrix();
  }


  if(gameStatus == GameStatus.Endroll){
    pushMatrix();
    translate(20*8, 15*10.7);
    resources.draw("endroll.png");
    popMatrix();
  }

  popMatrix();
}


void keyPressed() {
  switch(gameStatus){
    case Title:
      gameStatus = GameStatus.Tutorial;
      break;
    case Tutorial:
      game.setup();
      gameStatus = GameStatus.Playing;
      break;
    case Playing:
      game.keyPressed(key, keyCode);
      break;
    case Gameover:
      gameStatus = GameStatus.Endroll;
      break;
    case Clear:
      gameStatus = GameStatus.Endroll;
      break;
    case Endroll:
      gameStatus = GameStatus.Title;
      break;
  }
}

void keyReleased(){
  game.keyReleased(key, keyCode);
}