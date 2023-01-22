class ItemModel {
  late String name;
  late String price;
  late String description;
  late String material;
  late String image;
  late String id;
  late String traderId;

  ItemModel(
      {
        required this.traderId,
       required this.name,
      required this.price,
      required this.description,
      required this.material,
      required this.image,
      required this.id});

  ItemModel.fromJson(Map<String, dynamic> data) {
    price = data['price'].toString();
    name = data['name']??"";
    description = data['description']??"";
    material = data['material']??"";
    image = data['image']??"";
    id = data['id']??"";
    traderId=data['merchant']??"";
  }
}
