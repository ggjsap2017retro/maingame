Resources resources = new Resources();
static int displayScale = 2;
Game game = new Game();

void setup(){
  surface.setSize(16*20*displayScale, 16*15*displayScale);
  game.setup();
}

void draw(){
  game.update();
  pushMatrix();
  scale(displayScale, displayScale);
  game.draw();
  popMatrix();
}
