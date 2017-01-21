class Game{
  Stage _stage;;
  void setup(){
    _stage = new Stage(20, 15);
  }

  void update(){}

  void draw(){
    _stage.draw();
    drawStatus();
  }

  void drawStatus(){}
}
