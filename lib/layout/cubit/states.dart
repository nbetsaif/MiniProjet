import 'package:mini_projet/models/favorite_model.dart';
import 'package:mini_projet/models/orders_model.dart';

import '../../models/item_model.dart';

abstract class LayoutStates{}

class LayoutInitialState extends LayoutStates{
}
class LayoutChangeBotNav extends LayoutStates{}

class PostOrdersLoadingState extends LayoutStates{}
class PostOrdersSuccessState extends LayoutStates{
  List<OrderModel> orders;
  PostOrdersSuccessState({required this.orders});
}
class PostOrdersErrorState extends LayoutStates{
  late final dynamic error;
  PostOrdersErrorState(this.error);
}

class GetOrdersLoadingState extends LayoutStates{}
class GetOrdersSuccessState extends LayoutStates{
  List<OrderModel> orders;
  GetOrdersSuccessState({required this.orders});
}
class GetOrdersErrorState extends LayoutStates{
  late final dynamic error;
  GetOrdersErrorState(this.error);
}

class GetFavoritesLoadingState extends LayoutStates{}
class GetFavoriteSuccessState extends LayoutStates{
  List<ItemModel> favorites;
  GetFavoriteSuccessState({required this.favorites});
}
class GetFavoriteErrorState extends LayoutStates{
  late final dynamic error;
  GetFavoriteErrorState(this.error);
}

class PostFavoritesLoadingState extends LayoutStates{}
class PostFavoriteSuccessState extends LayoutStates{
  List<ItemModel> favorites;
  PostFavoriteSuccessState({required this.favorites});
}
class PostFavoriteErrorState extends LayoutStates{
  late final dynamic error;
  PostFavoriteErrorState(this.error);
}

class UserLoadingState extends LayoutStates{}
class UserSuccessState extends LayoutStates{}
class UserErrorState extends LayoutStates{
  late final dynamic error;
  UserErrorState(this.error);
}

class UpdateUserLoadingState extends LayoutStates{}
class UpdateUserSuccessState extends LayoutStates{}
class UpdateUserErrorState extends LayoutStates{
  late final String error;
  UpdateUserErrorState(this.error);
}

class GetItemsLoadingState extends LayoutStates{}
class GetItemsSuccessState extends LayoutStates{
  List<ItemModel> items;
  GetItemsSuccessState({required this.items});
}
class GetItemsErrorState extends LayoutStates{
  late final dynamic error;
  GetItemsErrorState(this.error);
}

class UserStartEditProfileState extends LayoutStates{}
class UserDoneEditProfileState extends LayoutStates{}

class ProfileImagePickedSuccessState extends LayoutStates{}
class ProfileImagePickedErrorState extends LayoutStates{}

class ItemImagePickedSuccessState extends LayoutStates{}
class ItemImagePickedErrorState extends LayoutStates{}