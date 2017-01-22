class Boss implements Entity{
  Animation _boss;
  boolean _enableToJumped = false;
  float speed;
  float _x,_y;
  int direction=-1;
  boolean _shouldDie;
  Boss(float xpos,float ypos,float sp){
    _x=xpos;
    _y=ypos;
    speed=sp;
    _boss=new Animation("boss_stand0",2);
  }
  
   private Stage _stage;
  void setStage(Stage s){
    _stage = s;
  };
  
  void  draw(){
    //_boss.draw(0);
  }
  
  float _fy = 0.1, _vy = 0;

  void update(){
    _x+=(speed*direction);
    if(_y>(20*16)){
      direction*=-1;
    }
  }
  boolean shouldDie(){return _shouldDie;}
  int width(){return 16;}
  int height(){return 16;};
  float x(){return _x;}
  float y(){return _y;}
  EntityTypes type(){return EntityTypes.Enemy;}
  //TODO
  void callCollidingEvent(EntityTypes type){};
}