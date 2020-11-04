PImage missileImg;
Population test;
PVector goal  = new PVector(400, 10);
int obsSize = 5; 
int[] obs = new int[obsSize];
boolean running = false;

void setup() {
  size(1000, 1000); //size of the window
  frameRate(500);//increase this to make the dots go faster
  test = new Population(600);//create a new population with 1000 members
  missileImg = loadImage("missile.png");
}


void draw(){
  background(66);
  //draw goal
  fill(255, 255, 0);
  ellipse(goal.x, goal.y, 15, 15);
   
  fill(178, 34, 34);
  image(missileImg,0,0,12.5,5);
  rect(300, 600, 100, 100);
  
  fill(178, 34, 34);
  image(missileImg,0,0,12.5,5);
  rect(100, 100, 100, 100);
  
  fill(178, 34, 34);
  image(missileImg,0,0,12.5,5);
  rect(600, 100, 100, 100);
  
  fill(178, 34, 34);
  image(missileImg,0,0,12.5,5);
  rect(200, 550, 100, 100);
  
  fill(178, 34, 34);
  image(missileImg,0,0,12.5,5);
  rect(400, 750, 100, 100);
  
  fill(178, 34, 34);
  image(missileImg,0,0,12.5,5);
  rect(150, 500, 100, 100);

  fill(178, 34, 34);
  image(missileImg,0,0,12.5,5);
  rect(547, 235, 100, 100);
  
  fill(178, 34, 34);
  image(missileImg,0,0,12.5,5);
  rect(462, 546, 100, 100);

  fill(178, 34, 34);
  image(missileImg,0,0,12.5,5);
  rect(754, 278, 100, 100);

  fill(178, 34, 34);
  image(missileImg,0,0,12.5,5);
  rect(400, 437, 100, 100);

  fill(178, 34, 34);
  image(missileImg,0,0,12.5,5);
  rect(510, 379, 100, 100);

  if(keyPressed){
    if(key=='c')
    running=true;
  }  
  if(running){
    if (test.allMissilesDead()){
      //genetic algorithm
      int w = int(random(100,700));
      int h = int(random(100,700));
      test.calculateFitness();
      test.naturalSelection();
      test.mutateBabies();
    } else{
      //if any of the dots are still alive then update and then show them

      test.update();
      test.show();
    }
  }

}
