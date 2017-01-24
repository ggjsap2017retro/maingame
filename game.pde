
class Game {
  Stage _stage;
  ;

  private CollisionDetector _collisionDetector;
  private List<Entity> _entities = new ArrayList<Entity>();
  private List<Entity> _effects  = new ArrayList<Entity>();
  private List<Entity> _enemies  = new ArrayList<Entity>();
  private Hero _hero;
  private boolean _isGameover;
  private boolean _isGoal;
  Animation _hpback, _hpfront;

  void setup() {
    _isGameover = false;
    _isGoal = false;

    _collisionDetector = new CollisionDetector();

    List<Entity> loadedEnemies = new ArrayList<Entity>();
    _stage = (new StageLoader()).loadStage("stage.png", loadedEnemies);

    setupEntities(loadedEnemies);
   
    _hpback=new Animation("HPIro", 5);
    _hpfront=new Animation("HPCabar", 6);
  }

  void setupEntities(List<Entity> enemyList) {
    _entities.clear();
    _enemies.clear();
    _effects.clear();

    _hero = new Hero();
    
    _entities.add(_hero);
    _enemies.addAll(enemyList);
    _entities.addAll(_enemies);
    for (Entity entity : _entities) {
      entity.setStage(_stage);
    }
  }

  void update() {
    updateEntities();
  }

  void updateEntities() {
    _collisionDetector.update(_entities);
    for (Entity entity : _entities) {
      entity.update();
    }

    killEntities();

    //ゲームオーバの条件チェック
    //体力切れ
    if (_hero.hitPoint() <= 0) {
      _isGameover = true;
    }
    //画面下に落下した場合
    if (_hero.y() > 15*16) {
      _isGameover = true;
    }

    //クリア条件
    //stageの右端にたどり着く
    if ((_stage.width()-5)*16< _hero.x()) {
      _isGoal = true;
    }
  }

  void killEntities(){
    List<Entity> newList = new ArrayList<Entity>();
    for(Entity entity: _entities){
      if(!entity.shouldDie()){
        newList.add(entity);
      }
    }
    _entities = newList;
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
   if (_hero.hitPoint()>=50) {
      translate(64, 8);
      _hpback.draw(0);
      _hpfront.draw(0);
    }
    if (_hero.hitPoint()<50 && _hero.hitPoint()>=40) {
      translate(64, 8);
      _hpback.draw(1);
      _hpfront.draw(1);
    }
    if (_hero.hitPoint()<40 && _hero.hitPoint()>=30) {
      translate(64, 8);
      _hpback.draw(2);
      _hpfront.draw(2);
    }
    if (_hero.hitPoint()<30&&_hero.hitPoint()>=20) {
      translate(64, 8);
      _hpback.draw(3);
      _hpfront.draw(4);
    }
    if (_hero.hitPoint()<20) {
      translate(64, 8);
      _hpback.draw(4);
      _hpfront.draw(5);
    }
  }

  void drawStatus() {
    //TODO
  }

  void drawEntities() {
    for (Entity entity : _entities) {
      pushMatrix();
      translate(int(entity.x()), int(entity.y()));
      entity.draw();
      popMatrix();
    }
  }

  void keyPressed(char k, int kCode) {
    _hero.keyPressed(k, kCode);
    if(k == 'z'){
      _entities.add(new Shock(_hero.x()+8, _hero.y()+8));
    }
  }

  void keyReleased(char k, int kCode) {
    _hero.keyReleased(k, kCode);
  }

  boolean isGameover() {
    return _isGameover;
  }
  boolean isGoal() {
    return _isGoal;
  }
}
