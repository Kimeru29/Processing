class Puntaje
{
  int p1, p2;
  
  public Puntaje(int p1, int p2)
  {
    this.p1 = p1;
    this.p2 = p2;
  }
  
  public void Punto(int jugador)
  {
    if (jugador == 1)
      p1++;
    else if (jugador == 2)
      p2++;
  }
}