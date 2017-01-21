class Game{
  Stage _stage;;
  
  private CollisionDetector _collisionDetector;
  private List<Entity> _entities = new ArrayList<Entity>();
  private List<Entity> _effects  = new ArrayList<Entity>();
  private List<Entity> _enemies  = new ArrayList<Entity>();
  private Hero _hero;

  void setup(){

    _collisionDetector = new CollisionDetector();

    List<Entity> loadedEnemies = new ArrayList<Entity>();
    _stage = (new StageLoader()).loadStage("stage.png", loadedEnemies);

    setupEntities(loadedEnemies);
  }

  void setupEntities(List<Entity> enemyList){
    _entities.clear();
    _enemies.clear();
    _effects.clear();

    _hero = new Hero();

    _entities.add(_hero);
    _enemies.addAll(enemyList);
    _entities.addAll(_enemies);
    for(Entity entity: _entities){
      entity.setStage(_stage);
    }
  }

  void update(){
    updateEntities();
  }

  void updateEntities(){
    for(Entity entity: _entities){
      entity.update();
    }
  }

  void draw(){
    pushMatrix();
    translate(20*8, 15*8);
    resources.draw("back3.png");
    popMatrix();

    pushMatrix();
    translate(int(-_hero.x()+16*10), 0);
    _stage.draw();
    drawEntities();
    popMatrix();
    drawStatus();
  }

  void drawStatus(){
    //TODO
  }

  void drawEntities(){
    for(Entity entity: _entities){
      pushMatrix();
      translate(int(entity.x()), int(entity.y()));
      entity.draw();
      popMatrix();
    }
  }

  void keyPressed(char k, int kCode){
    _hero.keyPressed(k, kCode);
  }

  void keyReleased(char k, int kCode){
    _hero.keyReleased(k, kCode);
  }

}
