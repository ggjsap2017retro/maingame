interface Entity{
  void update();
  void draw();
  boolean shouldDie();
  void setStage(Stage s);
  int width();
  int height();

  float x();
  float y();
  
  EntityTypes type();
  void callCollidingEvent(EntityTypes type);
}
