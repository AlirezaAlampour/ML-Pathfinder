PImage missileImg;
Population test;
PVector goal  = new PVector(400, 10);
int obsSize = 5; 
int[] obs = new int[obsSize];


void setup() {
  size(1000, 1000); //size of the window
  frameRate(500);//increase this to make the dots go faster
  test = new Population(600);//create a new population with 1000 members
  missileImg = loadImage("missile.png");

}


void draw() { 
  background(255);
  //draw goal
  fill(255, 0, 0);
  ellipse(goal.x, goal.y, 10, 10);

  //draw obstacle(s)
  //fill(0, 0, 255);
  //fill(0,0,255);
  //image(missileImg,0,0,12.5,5);
  //rect(0, 300, 600, 10);
  

   
  fill(0, 0, 255);
  fill(0,0,255);
  image(missileImg,0,0,12.5,5);
  rect(300, 600, 100, 100);
  
  fill(0, 0, 255);
  fill(0,0,255);
  image(missileImg,0,0,12.5,5);
  rect(200, 550, 100, 100);
  
  fill(0, 0, 255);
  fill(0,0,255);
  image(missileImg,0,0,12.5,5);
  rect(400, 750, 100, 100);
  
  fill(0, 0, 255);
  fill(0,0,255);
  image(missileImg,0,0,12.5,5);
  rect(150, 500, 20, 20);

  fill(0, 0, 255);
  fill(0,0,255);
  image(missileImg,0,0,12.5,5);
  rect(547, 235, 20, 20);
  
  fill(0, 0, 255);
  fill(0,0,255);
  image(missileImg,0,0,12.5,5);
  rect(462, 546, 20, 20);

  fill(0, 0, 255);
  fill(0,0,255);
  image(missileImg,0,0,12.5,5);
  rect(754, 278, 20, 20);

  fill(0, 0, 255);
  fill(0,0,255);
  image(missileImg,0,0,12.5,5);
  rect(400, 437, 20, 20);

  fill(0, 0, 255);
  fill(0,0,255);
  image(missileImg,0,0,12.5,5);
  rect(510, 379, 20, 20);


  if (test.allMissilesDead()) {
    //genetic algorithm
    int w = int(random(100,700));
    int h = int(random(100,700));
    test.calculateFitness();
    test.naturalSelection();
    test.mutateBabies();
  } else {
    //if any of the dots are still alive then update and then show them

    test.update();
    test.show();
  }
}
