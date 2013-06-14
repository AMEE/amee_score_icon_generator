PImage icon;
PFont font;
int counter = 0;

//=================================================================================

void setup() {
	
	size(210,210);
	icon = loadImage("API_icon_s2_circle.png");

	String[] fontList = PFont.list();
	println(fontList);

	font = createFont("Lato-Reg", 50);
	
	textFont(font);
	textAlign(CENTER, CENTER);

}

//=================================================================================

void draw() {

	background(255);
	image(icon, 0, 0);
	fill(#212C22);

	//increment our counter and save out our image
	if (counter < 100) {
		text(counter, 105, 100);
		counter++;
		saveFrame("amee-score-medium-######.png"); 
	} else {
		noLoop();
	}
}

//=================================================================================
