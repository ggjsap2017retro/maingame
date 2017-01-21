Resources resources = new Resources();
static int displayScale = 2;
Game game = new Game();

enum GameStatus{
  Title, Tutorial, Playing, Gameover, Clear, Endroll
}

GameStatus gameStatus;

void setup(){
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
    translate(20*8, 15*8);
    resources.draw("Title.png");
    popMatrix();
  }

  if(gameStatus == GameStatus.Tutorial){
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
    translate(20*8, 15*8);
    resources.draw("Gameover.png");
    popMatrix();
  }

  if(gameStatus == GameStatus.Clear){
  }


  if(gameStatus == GameStatus.Endroll){
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
