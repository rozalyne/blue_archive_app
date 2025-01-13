class Character {
  final String id;
  final String name;
  final String school;
  final String birthday;
  final String photoUrl;
  final String image;
  final String imageSchool;
  final String damageType;

  Character({
    required this.id,
    required this.name,
    required this.school,
    required this.birthday,
    required this.photoUrl,
    required this.image,
    required this.imageSchool,
    required this.damageType,
  });

  factory Character.fromJson(Map<String, dynamic> json) {
    return Character(
      id: json['_id'] ?? '',
      name: json['name'] ?? 'Unknown',
      school: json['school'] ?? 'Unknown',
      birthday: json['birthday'] ?? 'Unknown',
      photoUrl: json['photoUrl'] ?? '',
      image: json['image'] ?? '',
      imageSchool: json['imageSchool'] ?? '',
      damageType: json['damageType'] ?? 'Unknown',
    );
  }
}
