PImage foto;

void setup() {
  size(800, 400);
  background(255);
  foto = loadImage("sierra.png");
}

void draw (){

image(foto, width/2, 0);

noStroke();
fill(209,209,209);
 beginShape();
 vertex(24,13);
vertex(307,221);
vertex(262,268);
vertex(261,327);
vertex(277,340);
vertex(265,346);
vertex(4,34);
vertex(24,13);
 endShape();
 
 fill(229,170,107);
 beginShape();
vertex(261,327);
vertex(329,380);
vertex(345,372);
vertex(356,355);
vertex(364,332);
vertex(375,307);
vertex(395,292);
vertex(397,284);
vertex(396,280);
vertex(320,224);
vertex(307,222);
vertex(263,268);
vertex(261,327);
endShape();

fill(118,118,118);
circle (308, 232, 10);
circle (291, 267, 10);
circle (273, 306, 10);
 
 fill(255);
 beginShape();
vertex(327,255);
vertex(303,295);
vertex(295,334);
vertex(318,353);
vertex(328,349);
vertex(333,313);
vertex(341,299);
vertex(358,283);
vertex(358,278);
vertex(327,255);
endShape();

circle (23,28,10);

fill(30);
circle (215, 219, 20);
circle (230, 238, 10);
circle (243, 252, 10);

fill(209);
circle (215,219,9);

fill(130);
beginShape();
vertex(264,345);
vertex(259,346);
vertex(4,42);
vertex(4,36);
vertex(264,345);
endShape();

fill(193, 121, 72, 200);
beginShape();
vertex(298,316);
vertex(262,293);
vertex(263,279);
vertex(301,300);
vertex(299,313);
endShape();

beginShape();
vertex(331,330);
vertex(358,349);
vertex(362,335);
vertex(333,320);
vertex(330,336);
endShape();
}



void mousePressed() {
  println("vertex("+mouseX+","+mouseY+");");
}
