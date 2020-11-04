class Missile {
  PVector pos;
  PVector vel;
  PVector acc;
  Node brain;

  boolean dead = false;
  boolean reachedGoal = false;
  boolean isBest = false;//true if this missile is the best missile from the previous generation

  float fitness = 0;

  Missile() {
    brain = new Node(500);//new brain with 1000 instructions

    //start the missiles at the bottom of the window with a no velocity or acceleration
    pos = new PVector(width/2, height- 10);
    vel = new PVector(0, 0);
    acc = new PVector(0, 0);
  }


  //-----------------------------------------------------------------------------------------------------------------
  //draws the dot on the screen
  void show() {
    //if this dot is the best dot from the previous generation then draw it as a big green Missile
    if (isBest) {
      fill(0, 255, 0);
      ellipse(pos.x, pos.y, 8, 8);
    } else {//all other dots are just smaller black dots
      fill(0);
      ellipse(pos.x, pos.y, 4, 4);
    }
  }

  //-----------------------------------------------------------------------------------------------------------------------
  //moves the dot according to the brains directions
  void move() {

    if (brain.directions.length > brain.step) {//if there are still directions left then set the acceleration as the next PVector in the direcitons array
      acc = brain.directions[brain.step];
      brain.step++;
    } else {//if at the end of the directions array then the dot is dead
      dead = true;
    }

    //apply the acceleration and move the dot
    vel.add(acc);
    vel.limit(5);//not too fast
    pos.add(vel);
  }

  //-------------------------------------------------------------------------------------------------------------------
  //calls the move function and check for collisions 
  void update() {
    if (!dead && !reachedGoal) {
      move();
      if (pos.x< 2|| pos.y<2 || pos.x>width-2 || pos.y>height -2) {//if near the edges of the window then kill it 
        dead = true;
      } else if (dist(pos.x, pos.y, goal.x, goal.y) < 5) {//if reached goal

        reachedGoal = true;
      } else if (hit()) {//if hit obstacle
        dead = true;
      }
    }
  }


  //--------------------------------------------------------------------------------------------------------------------------------------
  //calculates the fitness
  void calculateFitness() {
    if (reachedGoal) {//if the dot reached the goal then the fitness is based on the amount of steps it took to get there
      fitness = 1.0/16.0 + 10000.0/(float)(brain.step * brain.step);
    } else {//if the dot didn't reach the goal then the fitness is based on how close it is to the goal
      float distanceToGoal = dist(pos.x, pos.y, goal.x, goal.y);
      fitness = 1.0/(distanceToGoal * distanceToGoal);
    }
  }

  //---------------------------------------------------------------------------------------------------------------------------------------
  //clone it 
  Missile makeBaby() {
    Missile baby = new Missile();
    baby.brain = brain.clone();//babies have the same brain as their parents
    return baby;
  }
  
  boolean hit(){
    float x = pos.x;
    float y = pos.y;
    if(x<320 && y<620 && x>300 && y>600){
      return true;
    }
    if(x<220 && y<350 && x>200 && y>550){
      return true;
    }
    if(x<420 && y<770 && x>400 && y>750){
      return true;
    }
    if(x<170 && y<330 && x>150 && y>500){
      return true;
    }
    if(x<567 && y<255 && x>547 && y>235){
      return true;
    }
    if(x<482 && y<566 && x>462 && y>546){
      return true;
    }
    if(x<774 && y<298 && x>754 && y>278){
      return true;
    }
    if(x<420 && y<457 && x>400 && y>437){
      return true;
    }
    if(x<530 && y<399 && x>510 && y>379){
      return true;
    }
    return false;
  }
}
