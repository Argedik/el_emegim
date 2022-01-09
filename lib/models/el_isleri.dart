class Food {
  final String id;
  final String foodname;
  final String comment;
  final String materials;
  final String making;
  final String resources;
  final String picture;

  Food({
    required this.id,
    required this.foodname,
    required this.comment,
    required this.materials,
    required this.making,
    required this.resources,
    required this.picture,
  });

  // objeden map oluşturma
  Map<String, dynamic> toMap() => {
    "id": id,
    "foodname": foodname,
    "comment": comment,
    "materials": materials,
    "making": making,
    "resources": resources,
    "picture": picture,
  };

  //mapten obje oluşturan yapıcı
  factory Food.fromMap(Map map) => Food(
    id: map["id"],
    foodname: map["foodname"],
    comment: map["comment"],
    materials: map["materials"],
    making: map["making"],
    resources: map["resources"],
    picture: map["picture"],
  );
}
