import 'item_model.dart';

class FavoriteModel{

  late int id;
  late ItemModel item;

  FavoriteModel(
      {required this.item,
        required this.id});

  FavoriteModel.fromJson(Map<String, dynamic> data) {
    item =ItemModel.fromJson(data['item']);
    id = data['id'];
  }
}