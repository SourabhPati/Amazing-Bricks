//100,149,237(blue) 255,99,71(red),  255,215,0(yellow)  186,85,211(purple) 0,255,127(green)
TheSquare Square;
ArrayList<BarsAndBoxes> obstacles;
int last = 0;
int colors[];
int score = 0;
int timer = 0;
// SoundFile jumpingSound;
// SoundFile bgMusic;
int fps = 60;
int currentFrame=0;
int sec=0;
boolean collision = false;
boolean start = true;
PImage cover = new PImage();
PImage GameOver = new PImage();



void setup()
{
    size(1080,1920);
    colors = new color[]{color(100,149,237),color(186,85,211),color(255,99,71),color(255,215,0),color(0,255,127)};
    Square = new TheSquare();
    GameOver = loadImage("GameOver.png");
    cover = loadImage("cover.png");
    obstacles = new ArrayList<BarsAndBoxes>();
    obstacles.add(new BarsAndBoxes(colors[0]));
    // jumpingSound = new SoundFile(this,"jumpSound.mp3");
    // bgMusic = new SoundFile(this,"BGM3.mp3");
}
void draw()
{
    // loopBgMusic();
    if(start)
    {
        background(cover);
    }
    else if(!collision)
    {
        background(255);
        print(score + "\n");
        Square.put();
        renderObstacles();
    }
    else{
        handleCollision();
    }
    //print(obstacles.size() + "\n");
}

void mousePressed()
{
    start = false;
    Square.deviate();
    // collision = false;
    // score = 0;
    //obstacles.clear();
    //Square.deviate();
}

//void keyPressed()
//{
//    //Square.deviate();
//}

void renderObstacles()
{
    if(obstacles.get(last).Ypos>650)
    {
        obstacles.add(new BarsAndBoxes(colors[((int)(score/5))%5]));
        last++;
    }
    for(int i = obstacles.size() - 1 ; i>=0 ; --i)
    {
        BarsAndBoxes temp = obstacles.get(i);
        temp.put();
        //temp.showScore();
        if(temp.done())
        {
          temp.calcScore();
          obstacles.remove(temp);
          last--;
        }
        temp.collide();
    }    
}

void handleCollision()
{
    timer++;
    if(timer > 1*fps)
    {
        fill(255);
        background(0);
        image(GameOver,330,500);
        textSize(60);
        text("Final Score",400, 1100);
        textSize(74);
        text(score,520,1200);
        if(timer > 4*fps)
        {
            timer = 0;
            collision = false;
            score = 0;
            obstacles.clear();
            obstacles.add(new BarsAndBoxes(colors[0]));
            last=0;
            Square.vel.mult(0);
            Square.pos.x = 270*2;
            Square.pos.y = 490*2;
            start = true;
        }
    }
}

// void loopBgMusic()
// {
//     currentFrame++;
//     if(currentFrame > fps*1000)
//         currentFrame = 0;
//     if(currentFrame%60==0)
//         sec++;
//     if(sec%38==0)
//     {
//         bgMusic.amp(0.8);
//         bgMusic.play();
//         sec++;
//     }
// }
