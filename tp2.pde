/*
SOFÍA ROTTOLI
COMISIÓN 5
https://youtu.be/d-OcZshgAJk
*/

PImage imagen;
int cantidad = 10;
int tamaño;
int radio;
boolean cambioColor = false;
boolean cambioColor1 = false;
boolean rotacionActivada = false;
boolean rotando = false;

// Parámetros globales
int color1 = 0;
int color2 = 255;
float incrementoAngulo = 0.5;
int minValor = 0;
int maxValor = 255;

float[][] angulos;
float[][] angulosIniciales;

void setup() {
  size(800, 400);
  background(200);
  imagen = loadImage("imagen1.png");
  tamaño = width / (2 * cantidad);
  radio = tamaño / 2;

  angulos = new float[cantidad][cantidad];
  angulosIniciales = new float[cantidad][cantidad];
}

void draw() {
  background(200);
  image(imagen, 0, 0);
  noStroke();
  serieCuadros(color1, color2);
  serieCirculos(color1, color2);

  if (rotando) {
    actualizarAngulos();
  }
}

// CREACIÓN DE GRILLA DE CUADROS
void serieCuadros(int c1, int c2) {
  for (int x = 0; x < cantidad; x++) {
    for (int y = 0; y < cantidad; y++) {
      pushMatrix();
      float centroX = width - ((x + 1) * tamaño) + tamaño / 2;
      float centroY = height - ((y + 1) * tamaño) + tamaño / 2;

      translate(centroX, centroY);
      rotate(radians(angulos[x][y]));

      if ((x + y) % 2 == 0) {
        if (cambioColor) {
          fill(c1, c2, obtenerValor(minValor, maxValor));
        } else {
          fill(0);
        }
      } else {
        if (cambioColor) {
          fill(c1, c2, obtenerValor(minValor, maxValor));
        } else {
          fill(255);
        }
      }
      rect(-tamaño / 2, -tamaño / 2, tamaño, tamaño);

      popMatrix();
    }
  }
}

// CREACIÓN DE SERIE DE CÍRCULOS
void serieCirculos(int c1, int c2) {
  for (int x = 0; x < cantidad; x++) {
    for (int y = 0; y < cantidad; y++) {
      float centroX = width - ((x + 1) * tamaño) + tamaño / 2;
      float centroY = height - ((y + 1) * tamaño) + tamaño / 2;
      if ((x + y) % 2 == 0) {
        if (cambioColor1) {
          fill(c1, c2, 0);
        } else {
          fill(255);
        }
      } else {
        if (cambioColor1) {
          fill(0, 0, c1);
        } else {
          fill(0);
        }
      }
      ellipse(centroX, centroY, radio, radio);
    }
  }
}

// EVENTOS DEL MOUSE Y EL TECLADO PARA CAMBIAR COLORES Y MOVIMIENTO DE LOS CUADRADOS
void mouseDragged() {
  if (mouseX > width / 2) {
    cambioColor = true;
    color1 = obtenerValor(minValor, maxValor);
    color2 = obtenerValor(minValor, maxValor);
  } else {
    cambioColor = false;
  }
}

void mouseReleased() {
  cambioColor = false;
}

void keyPressed() {
  if (key == 'r' || key == 'R') {
    cambioColor1 = true;
  }
  if (key == 'm' || key == 'M') {
    cambioColor1 = false;
  }

  if (key == 'a' || key == 'A') {
    rotando = true;
  }
  if (key == 'p' || key == 'P') {
    rotando = false;
    restablecerAngulos();
  }
}

void restablecerAngulos() {
  for (int x = 0; x < cantidad; x++) {
    for (int y = 0; y < cantidad; y++) {
      angulos[x][y] = angulosIniciales[x][y];
    }
  }
}

void actualizarAngulos() {
  for (int x = 0; x < cantidad; x++) {
    for (int y = 0; y < cantidad; y++) {
      angulos[x][y] += incrementoAngulo;
    }
  }
}

int obtenerValor(int min, int max) {
  return int(random(min, max + 1));
}
