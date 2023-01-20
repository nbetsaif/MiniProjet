import 'package:mini_projet/models/item_model.dart';

class OrderModel {

  late int id;
  late bool? state;
  late String date;
  late ItemModel item;

  OrderModel(
      {required this.id,
        required this.state,
        required this.date,
        required this.item,
        });

  OrderModel.fromJson(dynamic json){
    id =json['id'];
    state=json['state'];
    date=json['date'];
    item=   ItemModel.fromJson(json['item']);
  }

}
