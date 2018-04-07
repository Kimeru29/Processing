//TODO: Arreglar bug que congela al mover ambas barras al mismo tiempo
//TODO: Arreglar bud que anota punto cuando rebota desde la esquina superior derecha y colisiona con la barra

//IList<Barra> = new List<Barra>{new Barra()}
Barra barraDerecha;
Barra barraIzquierda;
Puntaje puntaje;
Pelota pelota;

boolean barraDerechaAbajo = false;
boolean barraDerechaArriba = false;

boolean barraIzquierdaAbajo = false;
boolean barraIzquierdaArriba = false;

boolean esInicializacion = true;

PFont fuente;

void setup()
{
  fullScreen();
  smooth();
  
  barraIzquierda = new Barra(10, height/2);
  barraDerecha = new Barra(width-10, height/2);
  pelota = new Pelota();
  puntaje = new Puntaje(0, 0);  
  
  fuente = loadFont("Joystix-48.vlw");
}

void draw()
{
  background(#ffffff);

  color(#000000);
  textFont(fuente);
  textSize(30);
  text("P1: " + puntaje.p1 + " P2: " + puntaje.p2, width/2.5,30);
  
  if (pelota.pelotaEnMov == false && esInicializacion == true)
     text("Preciona espacio...", width/2.8,height/3); 
  else if (pelota.pelotaEnMov == false && esInicializacion == false)
    text("     Punto! ", width/2.8,height/3); 
 
  if (pelota.pelotaEnMov == true)
  {
    pelota.draw();
    pelota.Actualizar();
  }
  else
    ellipse(width/2,height/2,Pelota.Tamano,Pelota.Tamano);
   
  barraIzquierda.draw();
  barraDerecha.draw();
  
  movimientoBarras();
}

void keyPressed()
{ 
  if (keyCode == DOWN)
    barraDerechaAbajo = true;
  else if (keyCode == UP)
    barraDerechaArriba = true;
  else if (keyCode == 'S')
    barraIzquierdaAbajo = true;
  else if (keyCode == 'W')
    barraIzquierdaArriba = true;
  else if (keyCode == ' ')
  {
    pelota.draw();
    pelota.pelotaEnMov = true;
  }
}

void keyReleased()
{
  if (keyCode == DOWN)
    barraDerechaAbajo = false;
  else if (keyCode == UP)
    barraDerechaArriba = false;
  else if (keyCode == 'S')
    barraIzquierdaAbajo = false;
  else if (keyCode == 'W')
    barraIzquierdaArriba = false;
}

void movimientoBarras()
{
  if (barraDerechaAbajo == true)
    barraDerecha.MoverAbajo();
  if (barraDerechaArriba == true)
    barraDerecha.MoverArriba();
  if (barraIzquierdaAbajo == true)
    barraIzquierda.MoverAbajo();
  if (barraIzquierdaArriba == true)
    barraIzquierda.MoverArriba();
}