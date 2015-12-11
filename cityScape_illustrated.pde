/*
*
* author: Laurie Waxman
* date: December 2015
*
* Draws cityscapes in marker style.
*
* original felt-tip script from:
* http://www.local-guru.net/processing/felttip/felttip.pde
*
*/

import processing.pdf.*;

boolean record = false;

int seed = int(random(1024));
float strokeWidth = 2;
float strokeLight = 0.75;
int bMinH = 250; 
int bMaxH = 350;

void setup() {
  size(24, 36);
  // surface.setSize(24*120, 36*120); //poster
	surface.setSize(1680, 1050+200); //screen
  noLoop();
  smooth();
}

void draw() {
	int buildingXPos = 0;
	int buildingYPos = 250;
	randomSeed(seed);

  background(255);
	stroke(0);
	strokeWeight(strokeWidth);

 	if(record){
	  beginRecord(PDF, "pdf/" +year()+"."+month()+"."+day()+"_"+hour()+"."+minute()+"."+second()+ ".pdf"); 
 	}
	for(int i=0; i<(height/bMinH); i++){
		for(int j=0; j<(width/170); j++){	
			int buildingWidth = (int) random(100, 300);
			drawBuilding(buildingXPos, buildingYPos, buildingWidth);
			buildingXPos+=buildingWidth;
		}
		buildingYPos+=bMinH; 
		buildingXPos = 0; 
	} 
	if(record){
		endRecord();
	}
	saveFrame("output/image"+year()+"."+month()+"."+day()+"_"+hour()+"."+minute()+"."+second()+".jpg");
}

void drawBuilding(int x, int y, int bW){
  
	int bH = (int) random(bMinH, bMaxH);
	y = y-bH; //draw from top left of building
	
	//tower
	int towerStyle = floor( random(5) );
	if(towerStyle != 0){
		drawTowers(x, y, bW, bH, towerStyle);
	}

	//roof
	int roofStyle = floor( random(4) );
	drawRoof(x, y, bW, bH, roofStyle);

	//building body
	ftrect(x, y, bW, bH); 
	if(random(1)>0.4){
		stroke(0, 75);
		chooseTexture(x, y, bW, bH); 
	}
	if(random(1)>0.4){
		grit(x, y, bW, bH); 
	}
	stroke(0);
	if(towerStyle == 0){
		drawTowers(x, y, bW, bH, towerStyle);
	}
	//ornaments
	int ornamentStyle = (int) random(10); 
	drawOrnaments(x, y, bW, bH, 3);

}


