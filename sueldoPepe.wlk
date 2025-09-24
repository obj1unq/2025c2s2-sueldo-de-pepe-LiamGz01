object pepe {
    var property categoria = cadete 
    var property resultado = porcentaje
    var property presentismo = normal 
    var property faltas = 0
    
    method sueldo() {
      return self.sueldoNeto() + self.bonoResultado() + self.bonoPresentismo()
    }
    method sueldoNeto() {
      return categoria.neto()
    }

     method bonoResultado() {
      return resultado.bono(self)
    }

    method bonoPresentismo() {
      return presentismo.bono(self)
    } 
}

//categoria
object cadete {
    const sueldo = 20000
    
    method neto() {
      return sueldo
    }
}

object gerente {
  const sueldo = 15000

  method neto() {
    return sueldo
  }
}

//Bono por Resultado
object porcentaje {
  method bono(empleado) {
    return empleado.sueldoNeto() * 0.1
  }
}

object montoFijo {
  method bono(empleado) {
    return 800
  }
}

object nulo {
  method bono(empleado) {
    return 0
  }
}

//Bono por presentismo
object normal {
  method bono(empleado) {
    if (empleado.faltas() > 1) {
      return 0
    } else if (empleado.faltas() == 1) {
      return 1000
    } else {
      return 2000
    }
  }
}

object demagogico {
  method bono(empleado) {
    if (empleado.sueldoNeto() < 1800) {
      return 500
    } else {
      return 300
    }
  }
}

object ajuste {
  method bono(empleado) {
    return if (empleado.faltas() == 0) 100 else 0
  }
}
