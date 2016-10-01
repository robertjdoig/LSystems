

float theta;

int iteration;

color col = color(0,0,0);

void setup(){
  size (800,800,P3D);
  background(255);
  
}

void draw(){  
  
  
  
  //RESETS THE TREE
   if(mousePressed == true){
      translate(0,0,-10);
      background(255); 
      iteration = 0;
   }
 
  //DRAWS THE TREE AND LIMITS TO 1 ITERATION 

  if(iteration < 1){
    translate(width/2,height, -10);
    branch(200);   
  }


  iteration ++;

}

void branch(float len) {

  pushStyle();
  
  colorChange(len);
  
  stroke(col);
  fill(col);
  
  pushMatrix();
    translate(0,-len/2,0);
    box(len/10,len,len/10);
  popMatrix();
 
  translate(0, -len,-10);
 
//Each branch’s length shrinks by two-thirds.
  //len *= 0.66;
   len *= random(0.4,0.80);
 
  
  // MAKES SURE THE LENGHT ISNT TO SMALL TO DRAW
  if (len > 2) {
    
   int n = int(random(1,6));
    //int n = 2;
    for(int i = 0; i < n; i++){
      float thetaX = random(-PI/6, PI/6);
      float thetaZ = random(-PI/6, PI/6);
      
      pushMatrix();
      rotateX(thetaX);
      rotateZ(thetaZ);
      branch(len);
      popMatrix();
     }
  }
  popStyle();
}

//CHANGES THE COLOUR OF THE BRANCHS WHEN THEY GET SMALLER
void colorChange(float _len){
   if(_len > 20){
     col = color(random(90,100),random(45,55),random(0,10));  //brown
  }
  else if( _len <= 20)  {
     col = color(random(0,25),random(100,250),random(0,20)); //green
  }
}