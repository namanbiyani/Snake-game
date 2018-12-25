boolean flag=true;
ArrayList<Integer> x = new ArrayList<Integer>();
ArrayList<Integer> y = new ArrayList<Integer>();
int w=30,h=30,bs=20,dir=2,ax=12,ay=10;
int[]dx={0,0,1,-1},dy={1,-1,0,0};
boolean gameover=false;
int level[]={10,5,4,2};
int score=0,pos=0;
int maxScore=0;
int prevScore=0,prevLevel=1;

void setup()
{
  size(600, 600);
  x.add(5); y.add(5); 
}
void draw() 
{
  background(255);
  
  //PRINT GRID
  for (int i=0;i<w;i++) 
    line(i*bs,0,i*bs,height);
  for(int i=0;i<h;i++)
    line(0,i*bs,width,i*bs);
    
  fill(0);
   textSize(30); 
  textAlign(LEFT);
    text("Level "+(pos+1),10,30);
    
    fill(0);
       textSize(30); 
      textAlign(LEFT);
      text("SCORE"+score,10,70);
      
      fill(0);
      textSize(30);
      textAlign(RIGHT);
      text("MAXSCORE : "+maxScore,500,30);
        
  //PRINT first snake particle
  fill(0, 255, 0); 
  for (int i = 0 ; i < x.size(); i++) 
    rect(x.get(i)*bs, y.get(i)*bs, bs, bs);
 
   if(score>=5 && pos==0)
   {
       pos=1;
       fill(0);
       textSize(30); 
        textAlign(CENTER);
        text("Congo! you reached level "+(pos+1),width/2,height/2);
        for(int i=0;i<10000;i++)
          for(int j=0;j<10000;j++);
   }
       
   if(score>=10 && pos==1)
   {
     pos=2;
     //fill(0);
       textSize(30); 
        textAlign(CENTER);
        text("Congo! you reached level "+(pos+1),width/2,height/2);
        for(int i=0;i<10000;i++)
          for(int j=0;j<10000;j++);
   }
   if(score>=15 && pos==2)
   {
     pos=3;
     fill(0);
       textSize(30); 
        textAlign(CENTER);
        text("Congo! you reached level "+(pos+1),width/2,height/2);
        for(int i=0;i<10000;i++)
          for(int j=0;j<10000;j++);
   }

  if (!gameover) 
  {
    //drawing food particle
    fill(255, 0, 0); 
    rect(ax*bs, ay*bs, bs, bs); 
    flag=true;
    
    if (frameCount%level[pos]==0) 
    {
      x.add(0, x.get(0) + dx[dir]); 
      y.add(0, y.get(0) + dy[dir]);
      
      if(x.get(0) < 0 || y.get(0) < 0 || x.get(0) >= w || y.get(0) >= h) 
        gameover = true;//boundary se crash
        
      for(int i=1;i<x.size();i++) 
        if(x.get(0)==x.get(i)&&y.get(0)==y.get(i)) 
          gameover=true;//snake eating itself
          
      if (x.get(0)==ax && y.get(0)==ay)
      {     
          //random position of food particle
          ax = (int)random(0, w);
          ay = (int)random(0, h);
          score++;
      }
      else 
      {
          x.remove(x.size()-1);
          y.remove(y.size()-1);
      }
    
    }
  }
  else 
  {
    if(flag)
    {
      prevScore=score;
      prevLevel=pos+1;
      flag=false;
    }
      fill(0);
      textSize(30); 
      textAlign(CENTER);
      text("GAME OVER. Press space",width/2,height/2);
      fill(56);
        textSize(30); 
        textAlign(CENTER);
        text("Score :"+prevScore+" Level :"+prevLevel,width/2,height/2+40);
      if(score>maxScore)
      {
        maxScore=score;
        fill(56);
        textSize(30); 
        textAlign(CENTER);
        text("CONGRATULATIONS",width/2,height/2+80);
        fill(56);
        textSize(30); 
        textAlign(CENTER);
        text("YOU HAVE SET A NEW HIGH SCORE",width/2,height/2+120);
      }
      
        if(keyPressed&&key==' ') 
        {   
          x.clear();
          y.clear(); 
          x.add(5);
          y.add(5);
          gameover = false; 
        }
        
        score=0;
        pos=0;
    }
  
}
void keyPressed()
{
    int nd=key=='s'? 0:(key=='w'?1:(key=='d'?2:(key=='a'?3:-1)));
    if (nd!=-1&&(x.size()<=1||!(x.get(1)==x.get(0)+dx[nd]&&y.get(1)==y.get(0)+dy[nd])))
        dir=nd;
}
