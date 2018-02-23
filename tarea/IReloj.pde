public interface IReloj<T extends Reloj> //Aquí vá la clase abstracta del reloj pero meh, detalles; usemos la misma clase de la que hereda en lugar de sellarla xd
{
  void obtenerHora();
  void iniciar();
}