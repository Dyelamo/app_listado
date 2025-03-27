class UsersModel {

 final int id;
  final String name;
  final String detalle;
  final String estado;



 UsersModel({
    required this.id,
    required this.name,
    required this.detalle,
    required this.estado,
  });

  factory UsersModel.fromJson(Map<String, dynamic> json) {
    return UsersModel(
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