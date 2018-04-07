class Pelota
{
  static final int Tamano = 20;
  
  boolean pelotaEnMov = false;
  float x,y,ejeX,ejeY; 

  public Pelota()  { Reset((int)random(1,2)); }
  
  public void draw()
  {
    ellipse(x,y,Tamano,Tamano);
    pelotaEnMov = true;
    esInicializacion = (esInicializacion == true) ? false : true;
  }
  
  public void Actualizar()
  {
    if (pelotaEnMov == true)
    {
      VerificarPelotaColisiona(); 
      JugadorPunto();
    }
  }
  
  public void Reset(int jugadorActual)
  {    
    ejeX = (jugadorActual == 1) ? (int)random(5)+10 : (int)random(-5)-10;
    ejeY = 6;   
    
    x = width/2;
    y = height/2;
  }  
  
  public void Punto()
  {   
    puntaje.Punto((x < 0) ? 2 : 1);
    
    barraIzquierda.Reset();
    barraDerecha.Reset();
    pelotaEnMov = false;
  }
  
  public void VerificarPelotaColisiona()
  {
    int P1IzquierdaArriba = barraIzquierda.y;
    int P1IzquierdaAbajo = barraIzquierda.y + Barra.Alto;
    
    int P2IzquierdaArriba = barraDerecha.y;
    int P2IzquierdaAbajo = barraDerecha.y + Barra.Alto;
    
    ejeX = ((x <= Barra.Ancho) && (y > P1IzquierdaArriba && y < P1IzquierdaAbajo) || (x >= width-Barra.Ancho) && (y > P2IzquierdaArriba && y < P2IzquierdaAbajo)) ? -ejeX : ejeX;
  }
  
  public void JugadorPunto()
  {
    int jugadorActual;
    if (x > width || x < 0) 
    {
      jugadorActual = (x > width) ? 1 : 2;
        
      Punto();
      Reset(jugadorActual);
    }
    
    ejeY = (y > height || y < 0) ? -ejeY : ejeY;
    x += ejeX;
    y += ejeY;
  }
}