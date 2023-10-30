// Authors:  //<>//
// Ximo Casanova

// Problem description:
// Buble - shoter (disparador de bolas)

float v = 0.01;   // Velocidad del disparo
float dt = 0.01;  // Paso de simulación

float angle = -HALF_PI; // Ángulo
boolean disp = false;   // Booleano del disparo

PVector p = new PVector(0,0);  // Posición del disparo
PVector p_canyon = new PVector(0, 0); // Posición del extremo del cañón

// Posición base del disparo
float dx = 0.0;
float dy = 0.0;

void setup() {
  size(600,600);
}

void draw() {
  background(150);
  line (width/2 - 50, height - 10, width/2 + 50, height - 10);
   
  // Cañón
  translate(width/2, height - 10);
  stroke (0); // Borde de la elipse
  fill (255, 0, 0); // Relleno elipse
  
  // Redibujado del extremo del cañón
  p_canyon.x = 75 * cos(angle);
  p_canyon.y = 75 * sin(angle);
  
  // Extremo del cañón
  line(0, 0, p_canyon.x, p_canyon.y);
  
  // Disparo
  if (disp == true) {
    // Formato del disparo
    ellipse(dx, dy, 10, 10);
    
    // Cambio de posición del disparo
    dx += v * dt + p.x;
    dy += v * dt + p.y; 
  }
}

void mousePressed() {
  disp = true;
    
  // Reestablecer la posición inicial del disparo
  dx = 0.0;
  dy = 0.0;
  
  // Velocidad del disparo
  p.x = p_canyon.x / 10;
  p.y = p_canyon.y / 10;
}

void keyPressed() {
  // Mover cañón hacia la derecha
  if (keyCode == RIGHT)
  {
    // No se permite apuntar hacia fuera de la pantalla
    if (angle < 0)
      angle += 0.01;
  }
  
  // Mover cañón hacia la izquierda
  if (keyCode == LEFT) {
    // No se permite apuntar hacia fuera de la pantalla
    if (angle > -PI)
      angle -= 0.01;
  }
}
