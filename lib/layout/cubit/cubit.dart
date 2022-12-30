import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mini_projet/layout/cubit/states.dart';
import 'package:mini_projet/modules/favorites/favorites_screen.dart';
import 'package:mini_projet/modules/home/home_screen.dart';
import 'package:mini_projet/modules/orders/orders_screen.dart';
import 'package:mini_projet/modules/profile/profile_screen.dart';

class LayoutCubit extends Cubit<LayoutStates>{

  LayoutCubit() : super(LayoutInitialState());


  static LayoutCubit get(context)=>BlocProvider.of(context);

  late PageController pageController;

  int currentIndex=0;


  void changeScreen(int index){
    currentIndex=index;
    emit(LayoutChangeBotNav());
  }

  List<IconData> listOfIcons = [
    Icons.home,
    Icons.favorite,
    Icons.work_history,
    Icons.person,
  ];

  List<String> appBarTitles=['Home','Favorites','Orders','Profile'];

  List<Widget> bodyScreens=
  [
    HomeScreen(),
    FavoriteScreen(),
    OrdersScreen(),
    ProfileScreen()
  ];

  //edit profile
bool editingProfile=false;

void startEditProfile(){
  editingProfile=true;
  emit(UserStartEditProfileState());
}

void doneEditProfile(){
  editingProfile=false;
  emit(UserDoneEditProfileState());

}
}