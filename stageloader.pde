class StageLoader{
  Stage loadStage(String path, List<Entity> enemyList){
    PImage img = loadImage(path);
    Stage stage = new Stage(img.width, img.height);

    for(int y = 0; y < img.height; y++){
      for(int x = 0;x < img.width; x++){
        color c = img.get(x, y);
        
        if(c == #000000){
          stage.fieldTileType(x, y, TileType.Block);
        }else if(c == #FFFFFF){
        }else{
          //Enemy
          if(c == #FF0000){
            enemyList.add(new Enemy(x*16, y*16, EnemyType.Dog));
          }
          if(c == #00FF00){
            enemyList.add(new Enemy(x*16, y*16, EnemyType.Bird));
          }
          if(c==#00FFFF){
            enemyList.add(new Enemy(x*16, y*16, EnemyType.Boss));
          }
          if(c==#0000FF){
             enemyList.add(new Enemy(x*16, y*16, EnemyType.Hito));
          }
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