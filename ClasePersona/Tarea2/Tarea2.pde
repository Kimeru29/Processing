void setup() {
IAnimal Persona = new Persona("Pablo", (byte)23, Genero.Masculino);
System.out.println(Persona.toString());
}

///////////////////////////////////////////////////////////////////

//Interfase para seguir el principio Open/Closed, aprovechar el polimorfismo y tener un sistema lo más desacoplado posible acorde a las capacidades de este preprocesador.
public interface IAnimal
{
  public String Desplazarse();
  public String Comunicarse();
  public String Comer();
  
}

///////////////////////////////////////////////////////////////////

public enum Genero
{
  Masculino,
  Femenino
}

///////////////////////////////////////////////////////////////////

//Declaro la clase como final ya que no tendría sentido que persona heredara a otra entidad(?), resultando en una mínima pero existente mejora en performance.
public final class Persona implements IAnimal
{
  //Campos pertenecientes solo a Persona.
  private String _nombre;
  private short _edad;
  private Genero _genero;
  
  public Persona(String nombre, byte edad, Genero genero)
  {
    this._nombre = nombre;
    this._edad = edad;
    this._genero = genero;
  }
  
  //Métodos sencillos
  public String Desplazarse() 
  {
    return "Camino sobre mis piernas";
  }
  
  public String Comunicarse() 
  {
    return "Hola mi nombre es "+_nombre+"cómo te llamas tú? :D";
  }
  public String Comer()
  {
    return "Como proteínas y carbohidratos para vivir!";
  }
  
  //Reescribiendo el método toString
  public String toString() 
  {
    return _nombre+" "+_edad+" "+_genero;
  }
}