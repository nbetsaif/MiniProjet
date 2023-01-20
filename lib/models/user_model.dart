class UserModel {
  late int id;
  late String name;

  late String email;
  late String phone;
  late String? image;
  late String token;

  UserModel({
    required this.id,
    required this.name,
    required this.email,
    required this.phone,
    required this.image,
    required this.token,
  });

  UserModel.fromJson(Map<String, dynamic> data) {
    id = data['id'];
    name = data['name'];
    email = data['email'];
    phone = data['phone'];
    image = data['image'];
    token = data['token'];
  }
}
