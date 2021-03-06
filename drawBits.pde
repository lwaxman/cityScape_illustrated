///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

int showFill = 255;
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////// TOWERS
void drawTowers(int x, int y, int bW, int bH, int tS){
	if(tS == 0){ 
	//water tower
		float tW = random(20, 50);
		float tH = random(20, 50);
		float tLegW = random(0, 15);
		float tLegH = random(25, 45);
		float tRoofH = random(8, 20);
		float xPos = random(tLegW, bW-tW-(tLegW*2));
		//--
		noStroke();
		fill(showFill);
		beginShape();
		vertex(x+xPos, y-(tH+tLegH));
		vertex(x+xPos+(tW/2), y-(tH+tLegH)-tRoofH);
		vertex(x+xPos+(tW/2), y-(tH+tLegH)-tRoofH);
		vertex(x+xPos+tW, y-(tH+tLegH));
		endShape();
		//--lines
		stroke(0);
		noFill();
		ftline(x+xPos, y-(tH+tLegH), x+xPos+(tW/2), y-(tH+tLegH)-tRoofH);
		ftline(x+xPos+(tW/2), y-(tH+tLegH)-tRoofH, x+xPos+tW, y-(tH+tLegH));
		ftrect(x+xPos, y-(tH+tLegH), tW, tH);
		chooseTexture(x+xPos, y-(tH+tLegH), tW, tH);
		//--base
		ftline(x+xPos-tLegW, y, x+xPos, y-tLegH);
		ftline(x+xPos, y-tLegH, x+xPos+tW+tLegW, y);
		ftline(x+xPos+tW+tLegW, y, x+xPos+tW, y-tLegH);
		ftline(x+xPos+tW, y-tLegH, x+xPos-tLegW, y);
	}else if(tS == 1){ 
	//elevator tower
		float tW = random(40, 60);
		float tH = random(40, 60);
		float xPos = random(0, bW-tW);
		ftrect(x+xPos, y-tH, tW, tH);
		chooseTexture(x+xPos, y-tH, tW, tH);
		if(random(1)<0.6){
		//door
			float dH = random(20, tH*0.8);
			float dW = random(10, 20);
			float dXPos = xPos + random(0, tW-dW);
			ftrect(x+dXPos, y-dH, dW, dH);
		}
	}
}

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////// ROOF
void drawRoof(int x, int y, int bW, int bH, int rS){
	float roofHeight = random(10, 40);
	float roofMargin = random(bW*0.1, bW*0.3);
	float roofBase = random(5, 15);

	if(rS == 0){ 
	//--squares
		float w1 = random(bW*0.1, bW*0.5);
		float w2 = random(bW*0.1, bW*0.5);
		float h1 = random(5, 25);
		float h2 = random(5, 25);
		//--fill
		noStroke();
		fill(showFill);
		beginShape();
		vertex(x, y);
		vertex(x, y-(roofBase+h1));
		vertex(x+w1, y-(roofBase+h1));
		vertex(x+w1, y-roofBase);
		vertex(x+w1+(bW-(w1+w2)), y-roofBase);
		vertex(x+w1+(bW-(w1+w2)), y-(roofBase+h2));
		vertex(x+bW, y-(roofBase+h2));
		vertex(x+bW, y);
		endShape();
		//--lines
		stroke(0);
		noFill();
		ftline(x, y, x, y-(roofBase+h1));
		ftline(x, y-(roofBase+h1), x+w1, y-(roofBase+h1));
		ftline(x+w1, y-(roofBase+h1), x+w1, y-roofBase);
		ftline(x+w1, y-roofBase, x+w1+(bW-(w1+w2)), y-roofBase);
		ftline(x+w1+(bW-(w1+w2)), y-roofBase, x+w1+(bW-(w1+w2)), y-(roofBase+h2));
		ftline(x+w1+(bW-(w1+w2)), y-(roofBase+h2), x+bW, y-(roofBase+h2));
		ftline(x+bW, y, x+bW, y-(roofBase+h2));
	}else if(rS == 1){ 
	//--triangle
		noStroke();
		fill(showFill);
		beginShape();
		vertex(x, y);
		vertex(x, y-roofBase);
		vertex(x+roofMargin, y-roofBase);
		vertex(x+(bW/2), y-(roofBase+roofHeight));
		vertex(x+(bW-roofMargin), y-roofBase);
		vertex(x+bW, y-roofBase);
		vertex(x+bW, y);
		endShape();
		//--lines
		stroke(0);
		noFill();
		ftline(x, y, x, y-roofBase);
		ftline(x, y-roofBase, x+roofMargin, y-roofBase);
		ftline(x+roofMargin, y-roofBase, x+(bW/2), y-(roofBase+roofHeight));
		ftline(x+(bW/2), y-(roofBase+roofHeight), x+(bW-roofMargin), y-roofBase);
		ftline(x+(bW-roofMargin), y-roofBase, x+bW, y-roofBase);
		ftline(x+bW, y-roofBase, x+bW, y);
	}else if(rS == 2){
		float flatCenter = random(bW*0.1, bW*0.5);
	//--quad
		noStroke();
		fill(showFill);
		beginShape();
		vertex(x, y);
		vertex(x, y-roofBase);
		vertex(x+roofMargin, y-roofBase);
		vertex(x+(bW/2)-(flatCenter/2), y-(roofBase+roofHeight));
		vertex(x+(bW/2)+(flatCenter/2), y-(roofBase+roofHeight));
		vertex(x+(bW-roofMargin), y-roofBase);
		vertex(x+bW, y-roofBase);
		vertex(x+bW, y);
		endShape();
		//--lines
		stroke(0);
		noFill();
		ftline(x, y, x, y-roofBase);
		ftline(x, y-roofBase, x+roofMargin, y-roofBase);
		ftline(x+roofMargin, y-roofBase, x+(bW/2)-(flatCenter/2), y-(roofBase+roofHeight));
		ftline(x+(bW/2)-(flatCenter/2), y-(roofBase+roofHeight), x+(bW/2)+(flatCenter/2), y-(roofBase+roofHeight));
		ftline(x+(bW/2)+(flatCenter/2), y-(roofBase+roofHeight), x+(bW-roofMargin), y-roofBase);
		ftline(x+(bW-roofMargin), y-roofBase, x+bW, y-roofBase);
		ftline(x+bW, y-roofBase, x+bW, y);
	}else if(rS == 3){ 
	//--flat
		ftrect(x, y-roofBase, bW, roofBase);
	}
}

///////////////////////////////////////////////////////////////////////////////////////////////////////////////////// ORNAMENTS
void drawOrnaments(int x, int y, int bW, int bH, int oS){
	float roofThickness = random(5, 20);
	float ornamentHeight = random(5, 20);
	ftrect(x, y+roofThickness, bW, ornamentHeight); 
	if(oS == 0){
	//no decor
		ftrect(x, y+ornamentHeight, bW, ornamentHeight+roofThickness); 
	}else if(oS == 1){
	//vertical
		columnhatch(x, y+ornamentHeight, bW, ornamentHeight); 
	}else if(oS == 2){
	//horizontal
		crosshatch(x, y+ornamentHeight, bW, ornamentHeight); 	
	}else if(oS == 3){
	//quads
		float thisHeight = random(5, ornamentHeight);
		float thisWidth = random(5, 20);
		float span = bW*random(0.5, 0.8);
		float count = span/thisWidth;
		float gap = (bW-span)/(count-1);


		println("bW: " + bW);
		println("count: " + count);
		println("thisWidth: " + thisWidth);
		println("gap: " + gap);
		// println("fWidth: " + fWidth);

		for(int i=0; i<count; i++){
			fill(255, 0, 0);
			rect(x+((thisWidth+gap)*i), y, thisWidth, thisHeight);
			noFill();
		}
	}else if(oS == 4){
	//triangles

	}else if(oS == 5){
	//rounds

	}else if(oS == 6){

	}
	println("buildingHeight-original: " + bH);
	bH -= (ornamentHeight*2)-roofThickness;
	println("buildingHeight-modified: " + bH);
	drawWindows(x, y+roofThickness, bW, bH);

}

/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////// WINDOWS
void drawWindows(float x, float y, float bW, float bH){
	float margin = random(4, 20); //edge of building
	float wWGap = random(8,15); //window gap 
	float wHGap = random(wWGap*random(1,2),wWGap*random(2,3)); //window gap 
	float w = bW - (margin*2);  //width
	float wWC = floor( random(3, 8)); //how many windows
	if(bW > 200){ wWC = floor( random(5, 8) ); } //how many windows wide buildings
	if(bW < 120){ wWC = floor( random(3, 5) ); } //how many windows thin buildings

	float wW = (w-(wWGap*wWC))/ wWC ; //window width 
	float wH = random(wW, wW*(random(2))); //window height (up to 3*width)

	float groundFloor = random(wH+wHGap);

	float wHC = floor((bH-groundFloor)/(wH+wHGap));

	int windowStyle = floor( random(5) ); //choose style
	int windowsill = floor( random(4) ); //windowsill
	int roundTop = floor( random(2) ); //rounded top
	// float topHeight = wH/random(3);

	for(int i=0; i<wWC; i++){
		for(int j=0; j<wHC; j++){
			// drawWindow(margin+x+((wW+wGap)*i)+(wGap/2), margin+y, wW, wH, windowStyle, windowsill);
			drawWindow(margin+x+((wW+wWGap)*i)+(wWGap/2), margin+y+((wH+wHGap)*j)+wHGap, wW, wH, windowStyle, windowsill, roundTop);//, topHeight);
		}
	} 
}

void drawWindow(float x, float y, float w, float h, int wS, float windowsill, int rT){ //, float tH){
	if(windowsill==0){
	//frame
		ftrect(x-2, y-4, w+4, h+6);
		chooseTexture(x-2, y, w+4, h+4);
	}else if(windowsill==1){
	//sill top
		ftrect(x-2, y-5, w+4, 10);
		chooseTexture(x-2, y-5, w+4, 10);
	}else if(windowsill==2){
	//sill bottom
		ftrect(x-2, y+h-5, w+4, 10);
		chooseTexture(x-2, y+h-5, w+4, 10);
	}else if(windowsill==3){
	//sill both
		ftrect(x-2, y-5, w+4, 10);
		ftrect(x-2, y+h-5, w+4, 10);
		chooseTexture(x-2, y-5, w+4, 10);
		chooseTexture(x-2, y+h-5, w+4, 10);
	}

	if(rT==0){
	//round
		roundTop(x, y, w, h);
	}else{
	//rectangle
		ftrect(x, y, w, h);
	}

	if(w>20){
	//large windows	
		if(wS==0){
			ftline(x+(w/2), y, x+(w/2), y+h);
			ftline(x, y+(h/2), x+w, y+(h/2));
		}else if(wS==1){
		//picture half
			ftline(x+(w*0.50), y, x+(w*0.50), y+h);
			ftline(x+(w*0.25), y, x+(w*0.25), y+(h*0.50));
			ftline(x+(w*0.75), y, x+(w*0.75), y+(h*0.50));
			ftline(x, y+(h*0.50), x+w, y+(h*0.50));
			ftline(x, y+(h*0.25), x+w, y+(h*0.25));
		}else{
		//picture full
			ftline(x+(w*0.50), y, x+(w*0.50), y+h);
			ftline(x+(w*0.25), y, x+(w*0.25), y+h);
			ftline(x+(w*0.75), y, x+(w*0.75), y+h);
			ftline(x, y+(h*0.50), x+w, y+(h*0.50));
			ftline(x, y+(h*0.25), x+w, y+(h*0.25));
			ftline(x, y+(h*0.75), x+w, y+(h*0.75));
		}
	}else{
	//small windows
		if(wS==0){
		//standard (4)
			// ftrect(x, y, w, h);
			ftline(x+(w/2), y, x+(w/2), y+h);
			ftline(x, y+(h/2), x+w, y+(h/2));
		}else if(wS==2){
		//half width
			// ftrect(x, y, w, h);
			ftline(x+(w*0.50), y, x+(w*0.50), y+h);
		}else{
		//half height
			// ftrect(x, y, w, h);
			ftline(x, y+(h*0.5), x+w, y+(h*0.5));
		}
	}
}

void roundTop(float x1, float y1, float w, float h){ 
	float roundHeight = h*0.33;
	y1+=roundHeight;

	noStroke();
	fill(255);
	beginShape();
	vertex(x1, y1);
	vertex(x1+(w*0.10), y1-(roundHeight*0.66));
	vertex(x1+(w*0.30), y1-(roundHeight*0.88)); 
	vertex(x1+(w*0.50), y1-roundHeight); 
	vertex(x1+(w*0.70), y1-(roundHeight*0.88));
	vertex(x1+(w*0.90), y1-(roundHeight*0.66));
	vertex(x1+w, y1);
	vertex(x1+w, y1+(h*0.66));
	vertex(x1, y1+(h*0.66));
	endShape(); 
	// lines
	noFill();
	stroke(0); 
	ftline(x1, y1, x1+(w*0.10), y1-(roundHeight*0.66));
	ftline(x1+(w*0.10), y1-(roundHeight*0.66), x1+(w*0.30), y1-(roundHeight*0.88));
	ftline(x1+(w*0.30), y1-(roundHeight*0.88), x1+(w*0.50), y1-roundHeight); 
	ftline(x1+(w*0.50), y1-roundHeight, x1+(w*0.70), y1-(roundHeight*0.88)); 
	ftline(x1+(w*0.70), y1-(roundHeight*0.88), x1+(w*0.90), y1-(roundHeight*0.66));
	ftline(x1+(w*0.90), y1-(roundHeight*0.66), x1+w, y1);
	ftline(x1+w, y1, x1+w, y1+(h*0.66));
	ftline(x1+w, y1+(h*0.66), x1, y1+(h*0.66));
	ftline(x1, y1+(h*0.66), x1, y1);
}

/////////////////////////////////////////////////////////////////////////////////////////////////////////////////// FIRE ESCAPE
// how?? 
// yeesh.

/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////// TEXTURE

void chooseTexture(float x1, float y1, float w, float h){ 
	int textureStyle = floor( random(6) );
	float area = w*h;
	if(textureStyle==0){
		crosshatch(x1, y1, w, h);
	}else if(textureStyle==1){
		crosshatch(x1, y1, w, h);
		columnhatch(x1, y1, w, h);
	}else if(textureStyle==2){
		columnhatch(x1, y1, w, h);
	}
	if(area>=10000){
		float extras = floor( random(4) );
		if(extras==0){
			ivy(x1, y1, w, h);
		}else if(extras==2){
			grit(x1, y1, w, h);
		}
	}
}

void crosshatch(float x1, float y1, float w, float h){ 
	float rangeMin = random(5, w);
	float rangeMax = random(15, w);
	float gap = random(3, 6);
	int crossStyle = floor(random(4));
	if(crossStyle==0){
	//full
		float count = h/gap;
		if(random(1)<0.5){
		//left
			for(int i=0; i<count; i++){
				ftline(x1+w, y1+(gap*i)+3, x1+w-random(rangeMin, rangeMax), y1+(gap*i)+3);
			}
		}else{
		//right
			for(int i=0; i<count; i++){
				ftline(x1, y1+(gap*i)+3, x1+random(rangeMin, rangeMax), y1+(gap*i)+3);
			}
		}

	}else if(crossStyle==1){
	//few
		float count = (h*random(0.1,0.6))/gap;
		float yPos =  random(3, h-(gap*count));
		if(random(1)<0.5){
		//left
			for(int i=0; i<count; i++){
				ftline(x1+w, y1+(gap*i)+yPos, x1+w-random(rangeMin, rangeMax), y1+(gap*i)+yPos);
			}
		}else{
		//right
			for(int i=0; i<count; i++){
				ftline(x1, y1+(gap*i)+yPos, x1+random(rangeMin, rangeMax), y1+(gap*i)+yPos);
			}
		}
	}
}

void columnhatch(float x1, float y1, float w, float h){ 
	float rangeMin = random(2, h);
	float rangeMax = random(5, h);
	if(random(1)>0.5){
		rangeMax = random(5, h/3);
	}
	float gap = random(3, 6);
	int columnStyle = floor(random(4));
	columnStyle = 0;
	if(columnStyle==0){
	//full
		float count = w/gap;
		if(random(1)<0.5){
		// top
			for(int i=0; i<count; i++){
				ftline(x1+(gap*i), y1, x1+(gap*i), y1+h-random(rangeMin, rangeMax));
				// ftline(x1+w, y1+(gap*i)+3, x1+w-random(rangeMin, rangeMax), y1+(gap*i)+3);
			}
		}else{
		//bottom
			for(int i=0; i<count; i++){
				ftline(x1+(gap*i), y1+h, x1+(gap*i), y1+h-random(rangeMin, rangeMax));
			}
		}
	}else if(columnStyle==1){
	//few
		float count = (w*random(0.1,0.6))/gap;
		float xPox =  0;
		if(random(1)<0.5){
		//top
			for(int i=0; i<count; i++){
				ftline(x1+(gap*i), y1, x1+(gap*i), y1+h-random(rangeMin, rangeMax));
			}
		}else{
		//bottom
			for(int i=0; i<count; i++){
				ftline(x1+(gap*i), y1+h, x1+(gap*i), y1+h-random(rangeMin, rangeMax));
			}
		}
	}
}

void grit(float x1, float y1, float w, float h){ 
	stroke(0, 40);
	float area = w*h; 
	float density = random(200, 2000);
	// strokeWeight(4);
	for(int i=0; i<density; i++){
		float xPos1 = x1+random(0, w);
		float yPos1 = y1+random(0, h);
		ftline(xPos1, yPos1, xPos1+random(-4, 4), yPos1+random(-4, 4));
	}
	stroke(0);
	// strokeWeight(strokeWidth);
}

void ivy(float x1, float y1, float w, float h){ 

	float density = random(4000, 5000);
	float x = x1+random(w);
	float y = y1+random(h);

	stroke(180, 200);
	strokeWeight(4);
	for(int i=0; i<density; i++){
		int choice = int(random(5));
		if (choice == 0) {
			x+=random(2,10);
		} else if (choice == 1) {
			x-=random(2,10);
		} else if (choice == 2) {
			y-=random(10,15);
		} else {
			y+=random(5,10);
		}
		x = constrain(x,2,w-2);
		y = constrain(y,2,h-2);
		point(x1+x, y1+y);
	}
	stroke(0);
	strokeWeight(strokeWidth);
}


////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////// DOOR



////////////////////////////////////////////////////////////////////////////////////////////////////////////////////// FELT TIP
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

void ftline(float x1, float y1, float x2, float y2){

	float segLength = sqrt( sq( abs(x2-x1) ) + sq( abs(y2-y1) ));

	if(segLength <= 20){
		float offset = 0;
		beginShape();
		vertex( x1 + random(-offset,offset), y1 +random(-offset,offset));
		vertex( x2 + random(-offset,offset), y2 +random(-offset,offset));
		endShape();  
	}else if(segLength > 20 && segLength <= 70){
		float offset = 1;
		beginShape();
		vertex( x1 + random(-offset,offset), y1 +random(-offset,offset));
		curveVertex( x1+(x2 -x1)/3 + random(-offset,offset), y1 + (y2-y1)/3 +random(-offset,offset));
		vertex( x2 + random(-offset,offset), y2 +random(-offset,offset));
		endShape();  
	}else if(segLength > 70 && segLength <= 150){
		float offset = 1;
		beginShape();
		vertex( x1 + random(-offset,offset), y1 +random(-offset,offset));
		curveVertex( x1 + random(-offset,offset), y1 +random(-offset,offset));
		curveVertex( x1+(x2 -x1)*0.33 + random(-offset,offset), y1 + (y2-y1)*0.33 +random(-offset,offset));
		curveVertex( x1+2*(x2-x1)*0.33 + random(-offset,offset), y1+ 2*(y2-y1)*0.33 +random(-offset,offset)); 
		curveVertex( x2 + random(-offset,offset), y2 +random(-offset,offset));
		vertex( x2 + random(-offset,offset), y2 +random(-offset,offset));
		endShape();  
	}else{
		float offset = 2;
		beginShape();
		vertex( x1 + random(-offset,offset), y1 +random(-offset,offset));
		curveVertex( x1 + random(-offset,offset), y1 +random(-offset,offset));
		curveVertex( x1+(x2-x1)*0.33 + random(-offset,offset), y1 + (y2-y1)*0.33 +random(-offset,offset));
		curveVertex( x1+2*(x2-x1)*0.33 + random(-offset,offset), y1+ 2*(y2-y1)*0.33 +random(-offset,offset)); 
		curveVertex( x2 + random(-offset,offset), y2 +random(-offset,offset));
		vertex( x2 + random(-offset,offset), y2 +random(-offset,offset));
		endShape();  
	}
}

void ftrect(float x1, float y1, float w, float h){ 
	noStroke();
	fill(255);
	rect(x1, y1, w, h);
	//--
	stroke(0);
	noFill();
	ftline( x1, y1, x1, y1 + h );
	ftline( x1, y1, x1 + w, y1 );
	ftline( x1+w, y1, x1+w, y1+h ); 
	ftline( x1, y1+h, x1+w, y1+h );  
}