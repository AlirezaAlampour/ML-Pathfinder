class Population {
  Missile[] Missiles;

  float fitnessSum;
  int gen = 1;

  int bestmissle = 0;//the index of the best Missle in the Missles[]

  int minStep = 1000;

  Population(int size) {
    Missiles = new Missile[size];
    for (int i = 0; i< size; i++) {
      Missiles[i] = new Missile();
    }
  }


  //------------------------------------------------------------------------------------------------------------------------------
  //show all Missiles
  void show() {
    for (int i = 1; i< Missiles.length; i++) {
      Missiles[i].show();
    }
    Missiles[0].show();
  }

  //-------------------------------------------------------------------------------------------------------------------------------
  //update all Missiles 
  void update() {
    for (int i = 0; i< Missiles.length; i++) {
      if (Missiles[i].brain.step > minStep) {//if the Missile has already taken more steps than the best Missile has taken to reach the goal
        Missiles[i].dead = true;//then its dead
      } else {
        Missiles[i].update();
      }
    }
  }

  //-----------------------------------------------------------------------------------------------------------------------------------
  //calculate all the fitnesses
  void calculateFitness() {
    for (int i = 0; i< Missiles.length; i++) {
      Missiles[i].calculateFitness();
    }
  }


  //------------------------------------------------------------------------------------------------------------------------------------
  //returns whether all the dots are either dead or have reached the goal
  boolean allMissilesDead() {
    for (int i = 0; i< Missiles.length; i++) {
      if (!Missiles[i].dead && !Missiles[i].reachedGoal) { 
        return false;
      }
    }

    return true;
  }



  //-------------------------------------------------------------------------------------------------------------------------------------

  //gets the next generation of dots
  void naturalSelection() {
    Missile[] newDots = new Missile[Missiles.length];//next gen
    setBestMissile();
    calculateFitnessSum();

    //the champion lives on 
    newDots[0] = Missiles[bestmissle].makeBaby();
    newDots[0].isBest = true;
    for (int i = 1; i< newDots.length; i++) {
      //select parent based on fitness
      Missile parent = selectParent();

      //get baby from them
      newDots[i] = parent.makeBaby();
    }

    Missiles = newDots.clone();
    gen ++;
  }


  void calculateFitnessSum() {
    fitnessSum = 0;
    for (int i = 0; i< Missiles.length; i++) {
      fitnessSum += Missiles[i].fitness;
    }
  }

  //-------------------------------------------------------------------------------------------------------------------------------------

  //chooses Missile from the population to return randomly(considering fitness)

  //this function works by randomly choosing a value between 0 and the sum of all the fitnesses
  //then go through all the Missiles and add their fitness to a running sum and if that sum is greater than the random value generated that Missile is chosen
  //since Missiles with a higher fitness function add more to the running sum then they have a higher chance of being chosen
  Missile selectParent() {
    float rand = random(fitnessSum);


    float runningSum = 0;

    for (int i = 0; i< Missiles.length; i++) {
      runningSum+= Missiles[i].fitness;
      if (runningSum > rand) {
        return Missiles[i];
      }
    }

    //should never get to this point

    return null;
  }

  //------------------------------------------------------------------------------------------------------------------------------------------
  //mutates all the brains of the babies
  void mutateBabies() {
    for (int i = 1; i< Missiles.length; i++) {
      Missiles[i].brain.mutate();
    }
  }

  //---------------------------------------------------------------------------------------------------------------------------------------------
  //finds the dot with the highest fitness and sets it as the best dot
  void setBestMissile() {
    float max = 0;
    int maxIndex = 0;
    for (int i = 0; i< Missiles.length; i++) {
      if (Missiles[i].fitness > max) {
        max = Missiles[i].fitness;
        maxIndex = i;
      }
    }

    bestmissle = maxIndex;

    //if this Missile reached the target then reset the minimum number of steps it takes to get to the goal
    if (Missiles[bestmissle].reachedGoal) {
      minStep = Missiles[bestmissle].brain.step;
      println("step:", minStep);
    }
  }
}
