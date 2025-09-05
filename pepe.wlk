object pepe {

    var property categoria = cadete //Escribir "property" automaticamente construye el getter y setter de esa variable
    var property bonoResultado = resultadoNulo 
    var property bonoPresentismo = presentismoNulo
    var property faltas = 0

    method sueldo() {
        return self.sueldoNeto() + self.extraPorResultado() + self.extraPorPresentismo()
    }

    method sueldoNeto() {
        return categoria.neto()
    }

    method extraPorResultado() {
        return bonoResultado.valor(self)
    }

    method extraPorPresentismo() {
        return bonoPresentismo.valor(self)
    }


}
//categorias
object cadete {
    method neto() {
        return 20000
    }
}

object gerente {
    method neto() {
        return 15000
    }
}

//bono resultado

object resultadoNulo {
    method valor(empleado) {
        return 0
    }
}

object resultadoFijo {
    method valor(empleado) {
        return 800
    }
}

object resultadoPorcentual {
    method valor(empleado) {
        return empleado.sueldoNeto() * 0.1
    }
}

//bono presentismo
object presentismoNulo {
    method valor(empleado) {
        return 0
    }
}

object presentismoNormal {
    method valor(empleado) {
        return (2000 - 1000 * empleado.faltas()).max(0) //se podía usar un if? sí, pero está bueno explorar otras formas
    }
    
}
object presentismoDemagogico {
    method valor(empleado) {
        return if (empleado.sueldoNeto() < 18000) 500 else 300 //Uso el if como una expresión (el if devuelve un objeto, 500 o 300)
    }
}

object presentismoAjuste {
    method valor(empleado) {
        return if (empleado.faltas() > 0) 0 else 100
    }
}