class StageLoader{
  Stage loadStage(String path){
    PImage img = loadImage(path);
    Stage stage = new Stage(img.width, img.height);

    for(int y = 0; y < img.height; y++){
      for(int x = 0;x < img.width; x++){
        color c = img.get(x, y);

        if(c == #000000){
          stage.fieldTileType(x, y, TileType.Block);
        }

        //TODO add dog 
        //TODO add bird
        //TODO add human
        //TODO add recovery
      }
    }
    return stage;
  }
}
