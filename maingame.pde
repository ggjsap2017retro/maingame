Resources resources = new Resources();
static int displayScale = 2;
Game game = new Game();

Enemy enemy;
void setup(){
  surface.setSize(16*20*displayScale, 16*15*displayScale);
  game.setup();

  enemy = new Enemy(16, 16, EnemyType.Bird);
}

void draw(){
  game.update();
  pushMatrix();
  scale(displayScale, displayScale);
  game.draw();

  enemy.update();
  enemy.draw();

  popMatrix();
}

void keyPressed() {
  game.keyPressed(key, keyCode);
}

void keyReleased(){
  game.keyReleased(key, keyCode);
}
