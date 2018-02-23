IReloj reloj;

void setup() 
{
  size(500, 500);
  reloj = new Reloj();
  
}

void draw() 
{ 
  background(#ffffff);
  
  reloj.iniciar();
  
}