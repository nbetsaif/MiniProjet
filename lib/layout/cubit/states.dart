abstract class LayoutStates{}

class LayoutInitialState extends LayoutStates{
  void onInit(){

  }

}
class LayoutChangeBotNav extends LayoutStates{}
class HomeLoadingState extends LayoutStates{}
class HomeSuccessState extends LayoutStates{
}
class HomeErrorState extends LayoutStates{
  late final dynamic error;
  HomeErrorState(this.error);
}

class CategoryLoadingState extends LayoutStates{}
class CategorySuccessState extends LayoutStates{}
class CategoryErrorState extends LayoutStates{
  late final dynamic error;
  CategoryErrorState(this.error);
}

class FavoriteChangeState extends LayoutStates{}
class FavoriteSuccessState extends LayoutStates{
}
class FavoriteErrorState extends LayoutStates{
  late final dynamic error;
  FavoriteErrorState(this.error);
}
class GetFavoriteChangeState extends LayoutStates{}
class GetFavoriteSuccessState extends LayoutStates{}
class GetFavoriteErrorState extends LayoutStates{
  late final dynamic error;
  GetFavoriteErrorState(this.error);
}

class UserLoadingState extends LayoutStates{}
class UserSuccessState extends LayoutStates{}
class UserErrorState extends LayoutStates{
  late final dynamic error;
  UserErrorState(this.error);
}
class UserUpdateLoadingState extends LayoutStates{}