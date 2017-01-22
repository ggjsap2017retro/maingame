class SampleEntity implements Entity{
  private Stage _stage;
  void setStage(Stage s){
    _stage = s;
  };
  void update(){};
  void draw(){};
  boolean shouldDie(){return false;}
  int width(){return 16;}
  int height(){return 16;};
  float x(){return 0;}
  float y(){return 0;}
  EntityTypes type(){return EntityTypes.Hero;}
  void callCollidingEvent(EntityTypes type){};

}
