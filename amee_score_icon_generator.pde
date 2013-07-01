PGraphics pgMain;
PGraphics[] pgs;
PImage[] circles;
PImage inner_circle;
PFont[] fonts;
int[] fontColors;
int[] dimensions;
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
  pgMain = createGraphics(210, 210); //main canvas to draw stuff
  pgs = new PGraphics[3]; //cropped canvas to export different sizes
  pgs[0] = createGraphics(172, 172);
  pgs[1] = createGraphics(127, 127);
  pgs[2] = createGraphics(87, 87);

  dimensions = new int[3];
  dimensions[0] = 172; //2px padding
  dimensions[1] = 127;
  dimensions[2] = 87;
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
  pgMain.beginDraw();
  pgMain.clear();
  pgMain.textFont(fonts[style-1]);
  pgMain.textAlign(CENTER, CENTER);
  //background circle
  pgMain.image(circles[style-1], 0, 0);
  if (style == 1) {
    //green ring
    pgMain.stroke(#CBCCCB); //light gray
    pgMain.fill(#4AA362); //green
    pgMain.arc(105, 105, 170, 170, -0.5*PI, 2*PI*i/100-0.5*PI);
    //inner circle
    pgMain.image(inner_circle, 0, 0);
  }
  //score number
  pgMain.fill(fontColors[style-1]);
  pgMain.text(i, 105, style==1?97:98);
  pgMain.endDraw();

  //paste image on a smaller pg and save
  PGraphics pg = pgs[style-1];
  pg.beginDraw();
  pg.clear();
  int offset = -ceil((210-dimensions[style-1])/2);
  pg.image(pgMain, offset, offset);
  pg.endDraw();
  pg.save("score_images/style" + style + "/" + i + ".png");

  if ((i-1) % 5 == 0 || i == 100) {
    int count = i / 5;
    int xpos = (count%6)*210;
    int ypos = count / 6 * 210;
    image(pg, xpos, ypos);
  }
}

