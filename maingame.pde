Resources resources = new Resources();
static int displayScale = 2;
Game game = new Game();

void setup(){
  surface.setSize(16*20*displayScale, 16*15*displayScale);
  try{
    resources.minim = new Minim(this);
  }catch(Exception e){}

  game.setup();
}

void draw(){
  background(0,0,0);
  game.update();
  pushMatrix();
  scale(displayScale, displayScale);
  game.draw();
  popMatrix();
}

void keyPressed() {
  game.keyPressed(key, keyCode);
}

void keyReleased(){
  game.keyReleased(key, keyCode);
}
