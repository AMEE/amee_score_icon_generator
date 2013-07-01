PImage back_ring;
PFont font;
PGraphics pg;
//=================================================================================

void setup() {

  size(1260, 840);
  back_ring = loadImage("API_icon_s1_circle_rails_copy.png");

  //String[] fontList = PFont.list();
  //println(fontList);
  font = createFont("Lato-Reg", 72);
  
  textFont(font);
  textAlign(CENTER, CENTER);
  
  
  pg = createGraphics(210, 210);
  
}

//=================================================================================

void draw() {
  
  int i = frameCount;
  
//  //background ring
//  background(255);
//  image(back_ring, 0, 0);
//  //green ring
//  stroke(#CBCCCB); //light gray
//  fill(#4AA362); //green
//  arc(105, 105, 170, 170, -0.5*PI, 2*PI*i/100-0.5*PI);
//  //inner circle, should be image
//  fill(255);
//  ellipse(105, 105, 133, 133);
//  //score number
//  fill(#212C22); //black
//  text(i, 105, 95);
//  saveFrame("amee-score-large-" + i + ".png"); 

  //PGraphics version, enables transparent background, textAlign doesn't work
  pg.beginDraw();
  pg.textFont(font);
  pg.textAlign(CENTER, CENTER);
  //background ring
  pg.image(back_ring, 0, 0);
  //green ring
  pg.stroke(#CBCCCB); //light gray
  pg.fill(#4AA362); //green
  pg.arc(105, 105, 170, 170, -0.5*PI, 2*PI*i/100-0.5*PI);
  //inner circle, should be image
  pg.fill(255);
  pg.ellipse(105, 105, 133, 133);
  //score number
  pg.fill(#212C22); //black
  pg.text(i, 105, 100);
  pg.endDraw();
  //image(pg, 0, 0); //show the pg
  pg.save("pg-amee-score-large-" + i + ".png"); 

  if ((i-1) % 5 == 0 || i == 100) {
    int count = i / 5;
    int xpos = (count%6)*210;
    int ypos = count / 6 * 210;
    image(pg, xpos, ypos);
  }

  if (i >= 100) {
    noLoop();
  }
}

//=================================================================================

