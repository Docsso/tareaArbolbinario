// Clase que representa un empleado
class Empleado {
  int id;
  String nombre;

  Empleado(this.id, this.nombre);
}

// Nodo del ábol binario
class Nodo {
  Empleado empleado;
  Nodo? izquierdo;
  Nodo? derecho;

  Nodo(this.empleado);
}

// Árbol Binario de Empleados
class ArbolBinario {
  Nodo? raiz;

  // Método para insertar un empleado en el árbol
  void insertar(int id, String nombre) {
    Empleado nuevoEmpleado = Empleado(id, nombre);
    raiz = _insertarRec(raiz, nuevoEmpleado);
  }

  Nodo _insertarRec(Nodo? nodo, Empleado empleado) {
    if (nodo == null) {
      return Nodo(empleado);
    }

    if (empleado.id < nodo.empleado.id) {
      nodo.izquierdo = _insertarRec(nodo.izquierdo, empleado);
    } else {
      nodo.derecho = _insertarRec(nodo.derecho, empleado);
    }

    return nodo;
  }

  // Recorrido Preorden
  void preorden() {
    _preordenRec(raiz);
    print('');
  }

  void _preordenRec(Nodo? nodo) {
    if (nodo != null) {
      print('${nodo.empleado.id}: ${nodo.empleado.nombre}');
      _preordenRec(nodo.izquierdo);
      _preordenRec(nodo.derecho);
    }
  }

  // Recorrido Inorden
  void inorden() {
    _inordenRec(raiz);
    print('');
  }

  void _inordenRec(Nodo? nodo) {
    if (nodo != null) {
      _inordenRec(nodo.izquierdo);
      print('${nodo.empleado.id}: ${nodo.empleado.nombre}');
      _inordenRec(nodo.derecho);
    }
  }

  // Recorrido Postorden
  void postorden() {
    _postordenRec(raiz);
    print('');
  }

  void _postordenRec(Nodo? nodo) {
    if (nodo != null) {
      _postordenRec(nodo.izquierdo);
      _postordenRec(nodo.derecho);
      print('${nodo.empleado.id}: ${nodo.empleado.nombre}');
    }
  }
}

void main() {
  ArbolBinario empresa = ArbolBinario();

  // Insertando empleados (director y subordinados)
  empresa.insertar(50, "Director General");
  empresa.insertar(30, "Gerente de Ventas");
  empresa.insertar(70, "Gerente de Tecnología");
  empresa.insertar(20, "Ejecutivo de Ventas");
  empresa.insertar(40, "Coordinador de Ventas");
  empresa.insertar(60, "Líder de Desarrollo");
  empresa.insertar(80, "Arquitecto de Software");

  // Mostrar los recorridos
  print("Recorrido Preorden:");
  empresa.preorden();

  print("Recorrido Inorden:");
  empresa.inorden();

  print("Recorrido Postorden:");
  empresa.postorden();
}

