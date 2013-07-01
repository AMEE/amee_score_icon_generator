PGraphics pg;
PImage[] circles;
PImage inner_circle;
PFont[] fonts;
int[] fontColors;
//=================================================================================

void setup() {

  size(1260, 840);

  circles = new PImage[3];
  circles[0] = loadImage("API_icon_s1_circle_rails_only.png");
  circles[1] = loadImage("API_icon_s2_circle.png");
  circles[2] = loadImage("API_icon_s3_circle.png");
  inner_circle = loadImage("Large_inner_circle.png");

  //String[] fontList = PFont.list();
  //println(fontList);
  fonts = new PFont[3];
  fonts[0] = createFont("Lato-Reg", 72);
  fonts[1] = createFont("Lato-Reg", 50);
  fonts[2] = createFont("Lato-Reg", 37);

  fontColors = new int[3];
  fontColors[0] = #212C22;
  fontColors[1] = #212C22;
  fontColors[2] = #FFFFFF;
  
  //PGraphic enables transparent background
  pg = createGraphics(210, 210); //reused for all icons
}

//=================================================================================

void draw() {

  int i = frameCount;

  makeIcon(1, i);
  makeIcon(2, i);
  makeIcon(3, i);

  if (i >= 100) {
    noLoop();
  }
}

//=================================================================================

void makeIcon(int style, int i) {
  pg.beginDraw();
  pg.clear();
  pg.textFont(fonts[style-1]);
  pg.textAlign(CENTER, CENTER);
  //background circle
  pg.image(circles[style-1], 0, 0);
  if (style == 1) {
    //green ring
    pg.stroke(#CBCCCB); //light gray
    pg.fill(#4AA362); //green
    pg.arc(105, 105, 170, 170, -0.5*PI, 2*PI*i/100-0.5*PI);
    //inner circle
    pg.image(inner_circle, 0, 0);
  }
  //score number
  pg.fill(fontColors[style-1]);
  pg.text(i, 105, style==1?97:98);
  pg.endDraw();
  pg.save("score_images/style" + style + "/" + i + ".png");

  if ((i-1) % 5 == 0 || i == 100) {
    int count = i / 5;
    int xpos = (count%6)*210;
    int ypos = count / 6 * 210;
    image(pg, xpos, ypos);
  }
}

