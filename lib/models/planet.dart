class Planet {
  int? id;
  String name;
  double distanceFromSun;
  double size;
  String? nickname; // Opcional

  Planet({
    this.id,
    required this.name,
    required this.distanceFromSun,
    required this.size,
    this.nickname,
  });

  // Convertendo para Map (Banco de Dados)
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'distanceFromSun': distanceFromSun,
      'size': size,
      'nickname': nickname,
    };
  }

  // Convertendo de Map para Objeto
  factory Planet.fromMap(Map<String, dynamic> map) {
    return Planet(
      id: map['id'],
      name: map['name'],
      distanceFromSun: map['distanceFromSun'],
      size: map['size'],
      nickname: map['nickname'],
    );
  }
}
