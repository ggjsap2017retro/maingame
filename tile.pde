enum TileType{
  Empty,
  Block
}

class Tile{
  TileType type;
  private Animation _animation;

  Tile(TileType t){
    type = t;
    //TODO 複数のタイルに対応
    _animation = new Animation("Bird1");
  }

  void draw(){
    //TODO 複数のタイルに対応
    if(type == TileType.Block){
      _animation.draw();
    }
  }
}
