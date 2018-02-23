class Reloj implements IReloj<Reloj>
{
  private float _ejeX, _ejeY, _radio;
  private int _hora, _minutos, _segundos;

  public Reloj() 
  {
    _ejeX = width/2.0;
    _ejeY = width/2.0;
    _radio = width/2.0-10;
    obtenerHora();
  }

  /* //////////////////////////////////////// */
  /*                 VISTAS
  /* //////////////////////////////////////// */
  void iniciar()
  {      
    dibujarAvanze();

    strokeWeight(10);
    stroke(#ff3200);
    noFill();
    ellipse(_ejeX, _ejeY, 2*_radio, 2*_radio);
    ellipse(_ejeX, _ejeY, 4, 4);

    obtenerHora();
    marcasReloj();
    dibujarHorario();
    dibujarMinutero();
    dibujarSegundero();
  }

  private void dibujarAvanze()
  { 
    fill(#ff7655);
    if (_hora > 14 && _hora < 18)   
      arc(_ejeX, _ejeY, 2*_radio, 2*_radio, PI+1.57, TWO_PI);
    else if (_hora > 18 && _hora < 21)
      arc(_ejeX, _ejeY, 2*_radio, 2*_radio, PI+1.57, TWO_PI+HALF_PI);
    else if (_hora < 20)//(_hora > 20 && _hora != 0)
      arc(_ejeX, _ejeY, 2*_radio, 2*_radio, PI+1.57, TWO_PI+PI);
    else
      arc(_ejeX, _ejeY, 2*_radio, 2*_radio, PI+1.57, TWO_PI+TWO_PI);
    
  }
  private void Helper(float tamano, float angulo, float ancho) //Este método debería ser encapsulado en otra clase y aplicar composición con esta clase, si es posible con injección de dependencias.
  {
    strokeCap(ROUND);
    strokeWeight(ancho);
    line(_ejeX, _ejeY, _ejeX+tamano*cos(angulo-PI/2.0), _ejeY+tamano*sin(angulo-PI/2.0));
  }

  private void dibujarMarcasReloj(float tipoMarca, float paso, float ancho) 
  {
    strokeWeight(ancho);
    strokeCap(SQUARE);
    for (float angulo = 0.0; angulo < 2*PI; angulo += paso) {
      float x1 = _ejeX + _radio*cos(angulo);
      float y1 = _ejeY + _radio*sin(angulo);
      float x2 = _ejeX + (_radio-tipoMarca)*cos(angulo);
      float y2 = _ejeY + (_radio-tipoMarca)*sin(angulo);
      line(x1, y1, x2, y2);
    }
  }

  /* //////////////////////////////////////// */
  /*                 CORE
  /* //////////////////////////////////////// */
  private void marcasReloj() {
    dibujarMarcasReloj(20, 2*PI/60.0, 1);
    dibujarMarcasReloj(30, 2*PI/12.0, 5);
  }

  void obtenerHora()
  {
    _hora = hour();
    _minutos = minute();
    _segundos = second();
  }

  private void dibujarHorario()
  {
    float largoHorario = _radio/2.0;
    float paso = (2*PI/12.0)*(_minutos/60.0);
    float angulo = (2*PI/12.0) * _hora + paso;
    Helper(largoHorario, angulo, 5);
  }

  private void dibujarMinutero() 
  {
    float largoMinutero = _radio-40;
    float offSet = (2*PI/60.0) * (_segundos/60.0); 
    float angulo = (2*PI/60.0) * _minutos + offSet;
    Helper(largoMinutero, angulo, 5);
  }

  private void dibujarSegundero() 
  {
    float largoSegundero = _radio-40;
    float angulo = 2*PI/60.0 * _segundos;
    Helper(largoSegundero, angulo, 1);
  }
}