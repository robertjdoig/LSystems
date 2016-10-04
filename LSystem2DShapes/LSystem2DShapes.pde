

float theta;

int iteration;

int state; 

color col = color(0,0,0);

PImage treeText;
PImage leafText;
PImage drawText;

void setup(){
  size (800,800,P2D);
  background(255);
 
}

void draw(){  

   state = 2;  //change the stem 
  
  //RESETS THE TREE
   if(mousePressed == true){
      translate(0,0);
      rect(0,0,width,height); 
      iteration = 0;
   }
 
  //DRAWS THE TREE AND LIMITS TO 1 ITERATION 

  if(iteration < 1){
    translate(width/2,height);
    branch(200);   
  }


  iteration ++;
}

void branch(float len) {
  
  pushStyle();
 
   colorChange(len);

  noStroke();
  fill(col);
  
  if(state == 0){
    line(0, 0, 0, -len);
  }
  else if(state == 1){
    triangle(-len/30,0,+len/30,0,0,-len);
  }
  else if(state == 2){ 
    beginShape();
      texture(drawText);
      vertex(-len/30,0,0,0);
      vertex(+len/30,0, 100, 0);
      vertex(+len/50,-len, 100, 100);
      vertex(-len/50,-len, 0, 100);
    endShape();
    
  }
  
  translate(0, -len);
 
//Each branch’s length shrinks by two-thirds.
  //len *= 0.66;
   len *= random(0.4,0.80);
 
  
  // MAKES SURE THE LENGHT ISNT TO SMALL TO DRAW
  if (len > 2) {
    
    int n = int(random(1,7));
    for(int i = 0; i < n; i++){
      float theta = random(-PI/2, PI/2);
      pushMatrix();
      rotate(theta);
      branch(len);
      popMatrix();
     }
  }
  popStyle();
}

//CHANGES THE COLOUR OF THE BRANCHS WHEN THEY GET SMALLER
void colorChange(float _len){
   if(_len > 20){
     drawText = treeText;
     
    //col = color(random(90,100),random(45,55),random(0,10));  //brown
  }
  else if( _len <= 20)  {
     
    drawText = leafText;
    //col = color(random(0,25),random(100,250),random(0,20)); //green
  }
}