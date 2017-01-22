
class Game{
  Stage _stage;;
  
  private CollisionDetector _collisionDetector;
  private List<Entity> _entities = new ArrayList<Entity>();
  private List<Entity> _effects  = new ArrayList<Entity>();
  private List<Entity> _enemies  = new ArrayList<Entity>();
  private Hero _hero;
  private boolean _isGameover;
  private boolean _isGoal;

  void setup(){
    _isGameover = false;
    _isGoal = false;

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
    _collisionDetector.update(_entities);
    for(Entity entity: _entities){
      entity.update();
    }

    //ゲームオーバの条件チェック
    //体力切れ
    if(_hero.hitPoint() <= 0){
      _isGameover = true;
    }
    //画面下に落下した場合
    if(_hero.y() > 15*16){
      _isGameover = true;
    }

    //クリア条件
    //stageの右端にたどり着く
    if(_stage.width()*16 < _hero.x()) {
      _isGoal = true;
    }
  }

  void draw(){
    pushMatrix();
    translate(20*8, 20*8);
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

  boolean isGameover(){
    return _isGameover;
  }
  boolean isGoal(){
    return _isGoal;
  }

}
