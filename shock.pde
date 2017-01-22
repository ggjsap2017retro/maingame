class Shock implements Entity{
  private Animation _animation;
  private float _x, _y;
  private float _age;

  Shock(float x, float y){
    _x = x;
    _y = y;
    _age = 8;
    _animation = new Animation("effect_", 8);
  }

  private Stage _stage;
  void setStage(Stage s){
    _stage = s;
  };

  void update(){
    _x += 10;
    if(_age <= 0){
      _shouldDie = true;
    }
    _age--;
  };

  void draw(){
    pushMatrix();
    scale(-1, 1);
    _animation.draw((int)(7-(_age)));
    popMatrix();
  };

  private boolean _shouldDie = false;
  boolean shouldDie(){return _shouldDie;}
  int width(){return 16;}
  int height(){return 16;};
  float x(){return _x;}
  float y(){return _y;}
  EntityTypes type(){return EntityTypes.Shock;}
  void callCollidingEvent(EntityTypes type){};
}
