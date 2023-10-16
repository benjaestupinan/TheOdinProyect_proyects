class Casilla

  attr_accessor :lista_vecinos, :ocupada , :ocupada_por

  def initialize(lista_vecinos = [arriba_izq=nil,arriba=nil,arriba_der=nil,derecha=nil,abajo_der=nil,abajo=nil,abajo_izq=nil,izquierda=nil], ocupada = false, ocupada_por = nil)
    @ocupada = ocupada
    @ocupada_por = ocupada_por
    @lista_vecinos = lista_vecinos
  end

  def marcar(arg)
    if ocupada == false
      self.ocupada = true
      self.ocupada_por = arg
    else
      puts("Esta casilla esta ocupada")
    end
    
  end

  def nuevos_vecinos(new_lista_vecinos)
    self.lista_vecinos = new_lista_vecinos
  end

  def mostrarCasilla
    if self.ocupada
      print("|#{self.ocupada_por}|")
    else
        print("|.|")
    end
  end

end

class Tablero

  attr_accessor :a1, :a2, :a3, :b1, :b2, :b3, :c1, :c2, :c3, :turno

  def initialize(a1 = Casilla.new,a2 = Casilla.new,a3 = Casilla.new,b1 = Casilla.new,b2 = Casilla.new,b3 = Casilla.new,c1 = Casilla.new,c2 = Casilla.new,c3 = Casilla.new, turno = 1)
    @a1 = a1; @a2 = a2; @a3 = a3
    @b1 = b1; @b2 = b2; @b3 = b3
    @c1 = c1; @c2 = c2; @c3 = c3
    
    @turno = turno

    # xx | xx | xx | xx | xx
    # xx | a1 | a2 | a3 | xx
    # xx | b1 | b2 | b3 | xx
    # xx | c1 | c2 | c3 | xx
    # xx | xx | xx | xx | xx

    a1.nuevos_vecinos([nil,nil,nil,a2,b2,b1,nil,nil])
    a2.nuevos_vecinos([nil,nil,nil,a3,b3,b2,b1,a1])
    a3.nuevos_vecinos([nil,nil,nil,nil,nil,b3,b2,a2])

    b1.nuevos_vecinos([nil,a1,a2,b2,c2,c1,nil,nil])
    b2.nuevos_vecinos([a1,a2,a3,b3,c3,c2,c1,b1])
    b3.nuevos_vecinos([a2,a3,nil,nil,nil,c3,c2,b2])

    c1.nuevos_vecinos([nil,b1,b2,c2,nil,nil,nil,nil])
    c2.nuevos_vecinos([b1,b2,b3,c3,nil,nil,nil,c1])
    c3.nuevos_vecinos([b2,b3,nil,nil,nil,nil,nil,c2])

  end

  def mostrarTablero
    print("    1  2  3")
    print("\n a ")
    a1.mostrarCasilla; a2.mostrarCasilla; a3.mostrarCasilla
    print("\n b ")
    b1.mostrarCasilla; b2.mostrarCasilla; b3.mostrarCasilla
    print("\n c ")
    c1.mostrarCasilla; c2.mostrarCasilla; c3.mostrarCasilla
    print("\n")
  end

  
  def chechVictoria
    def checkEsquina(esquina)
        s = 0
        for index in (0...8)
            if esquina.ocupada_por != nil && esquina.lista_vecinos[index] != nil && esquina.ocupada_por == esquina.lista_vecinos[index].ocupada_por && esquina.lista_vecinos[index].ocupada_por == esquina.lista_vecinos[index].lista_vecinos[index].ocupada_por
                return true
            else
                s += 1
            end
        end

        if s > 0
            return false
        end
    end

    def checkCentro(centro)
        s = 0
        for index in (0...8)
          if centro.ocupada_por != nil && centro.ocupada_por == centro.lista_vecinos[index].ocupada_por && centro.lista_vecinos[index].ocupada_por == centro.lista_vecinos[(index+4)%8].ocupada_por
              return true
          else
              s += 1
         end
       end

        if s > 0
         return false
       end
    end

    if checkEsquina(a1) || checkEsquina(a3) || checkEsquina(c3) || checkCentro(b2)
        puts("Juego terminado")
        return true
    else
        return false
    end
  end

  def IniciarJuego
    self.mostrarTablero
    while self.turno < 10
        puts("elije una casilla:")
        casillero = gets.chomp
        case casillero
        when "a1"
            casillero = a1
        when "a2"
            casillero = a2
        when "a3"
            casillero = a3
        when "b1"
            casillero = b1
        when "b2"
            casillero = b2
        when "b3"
            casillero = b3
        when "c1"
            casillero = c1
        when "c2"
            casillero = c2
        when "c3"
            casillero = c3  
        else
            casillero = "casilla no valida"   
        end
        
        if  casillero == "casilla no valida"
            puts("Esa no es una casilla valida")
        elsif casillero.ocupada
            puts("esa casilla esta ocupada")
        elsif turno % 2 == 1
            casillero.marcar("o")
            self.mostrarTablero
            self.turno += 1
        else
            casillero.marcar("x")
            self.mostrarTablero
            self.turno += 1
        end

        if self.chechVictoria
          if self.turno % 2 == 0
            puts("ganador #{"circulo"}")
          else
            puts("ganador #{"cruz"}")
          end
            break
        end    
    end
    if self.turno >= 10
      puts("Juego terminado ¡Es un empate!")
    end
  end

end

a =Tablero.new
a.IniciarJuego
