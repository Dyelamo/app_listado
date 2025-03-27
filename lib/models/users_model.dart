class Tarea {

 final int id;
  final String name;
  final String detalle;
  final String estado;



 Tarea({
    required this.id,
    required this.name,
    required this.detalle,
    required this.estado,
  });

  factory Tarea.fromJson(Map<String, dynamic> json) {
    return Tarea(
      id: json['id'],
      name: json['name'],
      detalle: json['detalle'],
      estado: json['estado'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'detalle': detalle,
      'estado': estado,
    };
  }


}