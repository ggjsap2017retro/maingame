  int state;
long t_start;
float t;
int x=0;
PImage img;
void setup(){
size(1024, 768);
  textSize(32);
  textAlign(CENTER);
  fill(255);
  state = 0;
  t_start = millis();
}

void draw(){
background(0);
img=loadImage("70543471.jpg");
image(img,0,0);
  t = (millis() - t_start) / 1000.0; 
 // text(nf(t, 1, 3)  + "sec.", width * 0.5, height * 0.9); 
  
  int nextState= 0;
  if(state == 0){ nextState = title(); }
  else if(state == 1){ nextState = game(); }
  else if(state == 2){ nextState = ending(); }
  else if(state == 3){ nextState = gameover(); }
  if(state != nextState){ t_start = millis(); } 
  state = nextState;
}
int title(){
  text("Game Title", width * 0.5, height * 0.3);
  text("Press 'z' key to start", width * 0.5, height * 0.7);
  if(keyPressed && key == 'z'){ // if 'z' key is pressed
    return 1; // start game
  }
  return 0;
}
  
 

int game(){
  background(0); 
  text("Game (for 5 seconds)", width * 0.5, height * 0.5);
      if(keyPressed && key == 'y'){ 
    x++;
  }
  if(x>=20){
    return 2;
  } // start game
  else if(life<=0){  // if ellapsed time is larger than 5 seconds
    return 3; // go to ending
  } 
  return 1;
}

int ending(){
  background(0);
  text("Ending", width * 0.5, height * 0.5);
  x=0;
  if(t > 3){
    text("Press 'a' to restart.", width * 0.5, height * 0.7);
    if(keyPressed && key == 'a') return 0;
  }
  return 2;
}
int gameover()
{
  background(0);
  img=loadImage("70543471.jpg");
  image(img,0,0);
  t = (millis() - t_start) / 1000.0; x=0;
  text("Gameover", width * 0.5, height * 0.5);
  if(t > 3){
    text("Press 'a' to restart.", width * 0.5, height * 0.7);
    if(keyPressed && key == 'a') return 0;
  }
  return 3;
}