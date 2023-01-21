class UserModel {
  late String name;
  late String password;
  late String email;
  late String phone;
  late String? image;

  UserModel({
    required this.password,
    required this.name,
    required this.email,
    required this.phone,
    required this.image,
  });

  UserModel.fromJson(Map<String, dynamic> data) {
    name = data['name']??'';
    email = data['email']??"";
    phone = data['phone']??"";
    image = data['image']??"";
    password = data['password']??"";
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  Map<String, dynamic>();
    data['name'] = this.name;
    data['email'] = this.email;
    data['phone'] = this.phone;
    data['image'] = this.image;
    data['password'] = this.password;
    return data;
  }

  }

