class BarsAndBoxes
{
    color col;
    //PVector Pos;
    float vel;
    float acc;
    float gapPos;
    float gapWidth;
    float Ypos;
    float BoxPos;
    float BoxSize;
    float BoxPos2;
    
    BarsAndBoxes(color c)
    {
        gapWidth = 150*2;
        Ypos = -30*4;
        acc = 1;
        gapPos = random(gapWidth/2 + 50*2,width - gapWidth/2 - 50*2);
        BoxPos = random(gapPos-gapWidth/2,gapPos+gapWidth/2);
        BoxPos2 = random(gapPos-gapWidth/2,gapPos+gapWidth/2);
        BoxSize = 44*2;
        col = c;
    }
    
    void put()
    {
        noStroke();
        fill(col);
        rectMode(CENTER);
        float len1 = gapPos - gapWidth/2;
        float len2 = width - len1 - gapWidth/2;
        rect(len1/2,Ypos,len1,BoxSize);
        rect(gapPos+gapWidth/2+len2/2,Ypos,len2,BoxSize);
        rect(BoxPos,Ypos + 110*2,BoxSize - 10*2,BoxSize - 10*2);
        rect(BoxPos2,Ypos - 110*2,BoxSize - 10*2,BoxSize - 10*2);
        fall();
        showScore();
        //text(collision,800,70);
    }
    
    void fall()
    {
        if(Square.pos.y<=height/2 + 22*2)
            vel = -Square.vel.y;
        vel *= 1.8;
        if(vel>0)
        {  
              Ypos += vel;
              vel += acc;
        }            
    }
    
    boolean done()
    {
        if(Ypos>height+44*2)
            return true;
        else
            return false;
    }
    
    void collide()
    {
        if(Square.pos.y<Ypos+BoxSize/2 && Square.pos.y>Ypos-BoxSize/2 && (Square.pos.x-44 < gapPos - gapWidth/2 || Square.pos.x+44 >gapPos + gapWidth/2))
        {
            collision = true;  
        }
        if(Square.pos.x-44<BoxPos+((BoxSize-10*2)/2) && Square.pos.x+44>BoxPos-((BoxSize-10*2)/2) && (Square.pos.y < (Ypos + 110*2)+((BoxSize-10*2)/2) && Square.pos.y > (Ypos + 110*2)-((BoxSize-10*2)/2)))
            collision = true;
        if(Square.pos.x-44<BoxPos2+((BoxSize-10*2)/2) && Square.pos.x+44>BoxPos2-((BoxSize-10*2)/2) && (Square.pos.y < (Ypos - 110*2)+((BoxSize-10*2)/2) && Square.pos.y > (Ypos - 110*2)-((BoxSize-10*2)/2)))
            collision = true;
        if(Square.pos.y > 1920)
            collision = true;
    }
    
    void calcScore()
    {
        if(Square.pos.y <= Ypos - 22*2)
            score++;
    }
    
    void showScore()
    {
      fill(0);
      textSize(54);
      text(score,15,70);
    }
}
