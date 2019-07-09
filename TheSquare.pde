class TheSquare
{
    PVector pos;
    PVector vel;
    PVector acc;
    float size;
    PImage theSquare;
    boolean left;
    boolean right;
    
    TheSquare()
    {
        size = 30*2;
        pos = new PVector(270*2,490*2);
        vel = new PVector(0,0);
        acc = new PVector(0,0.22*2);
        theSquare = loadImage("theSquare.png");
        left = right = false;
   }
  
  
    void put()
    {
        if((pos.x<=0 + 22*2 && left) || (pos.x>=width - 22*2 && right))
            vel.x=0;
        pos.add(vel);
        vel.add(acc);
        if(pos.y <= height/2 + 22*2)
          pos.y = height/2 + 22*2;
        image(theSquare,pos.x-22*2,pos.y-22*2);
    }
    
    void deviate()
    {
          PVector sideSpeed = new PVector(-1.8*2,0);
          //if(pos.y>height/2 + 22*2)
                          
          if(mouseX>width/2)
          {   
            jump();  
              /*if(pos.y>height/2 + 22 && pos.x>22 && right)
                  jump();*/
              sideSpeed.mult(-1);
              vel.add(sideSpeed);
              right = true;
              left = false;
          }
          else
          {
            jump();  
              /*if(pos.y>height/2 + 22 && pos.x< width - 22 && left)
                  jump();*/
              vel.add(sideSpeed);
              left = true;
              right = false;
          }
          // if(keyCode == UP)
          //   collision = false;
    }
    
    void jump()
    {
        // jumpingSound.amp(0.1);
        // jumpingSound.play();
        vel.mult(0);
        vel.add(0,-6*2);
    }
}
