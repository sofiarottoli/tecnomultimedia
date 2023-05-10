int pantalla = 0;
int contador = 0;
int posicionXBoton = 320;
int posicionYBoton = 240;
int tamanioEnXBoton = 180;
int tamanioEnYBoton = 65;
float movimientoX;
float movimientoY;
color colorDeFondo = 0;
color colorDeTexto = 255;
color colorDeLineaDeBoton = 255;
color colorDeBoton = 255;
boolean botonOk  = false;
PImage imagen1, imagen2, imagen3;
PFont fuenteTitulo, fuenteTexto, fuenteBoton;
String variableDeTexto1, variableDeTexto2, variableDeTexto3;

void setup() {
  size(640, 480);
  textSize(32);
  imagen1 = loadImage("IMAGEN1.png"); 
  imagen2 = loadImage("IMAGEN2.png"); 
  imagen3 = loadImage("IMAGEN3.png");
  variableDeTexto1 = "¿Qué es un taladro \ny para qué sirve?";
  variableDeTexto2 = "Es una máquina que nos \npermite hacer agujeros";
  variableDeTexto3 = "Existen muchos \ntipos de taladros e \ninfinidad de calidades";
  fuenteTitulo = loadFont("BodoniMT-Bold-48.vlw");
  fuenteTexto = loadFont("BellMT-48.vlw");
  fuenteBoton = loadFont("BookAntiqua-BoldItalic-48.vlw");
  
}

void draw() {
  background(colorDeFondo);
  switch (pantalla) 
  
  //PANTALLA 1//
  
  {
  case 0:
    image(imagen1, 0,0);
    colorDeFondo = 0;
    contador++;
    println("Estado 0 ", contador);
    if (contador >= 500) {
      contador = 0;
      pantalla = 1;
    }
    
    textFont(fuenteTitulo);
    fill(129, 38, 129, contador);
    text(variableDeTexto1, width/4, height/2);

    break;
 
 //PANTALLA 2//
 
  case 1:
    image(imagen2, 0,0);
    colorDeFondo = 255;
    contador++;
    println("Estado 1 ", contador);
    if (contador >= 700) {
      contador = 0;
      pantalla = 2;
    }
    
    textFont(fuenteTexto);
    fill(240, 240, 0, contador);
    text(variableDeTexto2, movimientoX, height/2);
    movimientoX += 0.6;
    
    break;
  
  //PANTALLA 3//
  
  case 2:
    image(imagen3,0,0);
    contador++;
    println("Estado 2 ", contador);
    if (contador >= 700) {
      contador = 0;
      pantalla = 3;
    }

    textFont(fuenteTexto);
    fill(23, 36, 255, contador);
    textAlign(CENTER);
    text(variableDeTexto3, width/2, movimientoY);
    movimientoY += 0.6;

    break;
    
  //PANTALLA 4//
    
  case 3:
    image(imagen3,0,0);
    contador++;
    colorDeFondo = 127;
    stroke(colorDeLineaDeBoton);
    fill(colorDeBoton);
    rect(posicionXBoton, posicionYBoton, tamanioEnXBoton, tamanioEnYBoton);
    fill(colorDeTexto);
    textFont(fuenteBoton);
    textSize(25);
    textAlign (320, 240);
    text("REINICIAR", posicionXBoton + tamanioEnXBoton/8, posicionYBoton + tamanioEnYBoton/2);
    println("Estado 3", contador);
    
 }
}

void mouseMoved() {

  if (mouseX > posicionXBoton && mouseX < posicionXBoton + tamanioEnXBoton
    && mouseY > posicionYBoton && mouseY < posicionYBoton + tamanioEnYBoton) {
    colorDeLineaDeBoton = color(255, 0, 255);
    colorDeBoton = color(255, 20, 180);
    colorDeTexto = color(44, 50, 147);
    botonOk = true;
    } 
    
  else {
    colorDeLineaDeBoton  = 255;
    colorDeBoton = 255;
    colorDeTexto = 180;
    botonOk = false;
  }
}

void mouseClicked() {
  if (botonOk == true) {
    pantalla = 0;
  }
}
