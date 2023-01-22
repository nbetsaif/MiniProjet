import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mini_projet/layout/cubit/states.dart';
import 'package:mini_projet/models/favorite_model.dart';
import 'package:mini_projet/models/orders_model.dart';
import 'package:mini_projet/models/user_model.dart';
import 'package:mini_projet/modules/favorites/favorites_screen.dart';
import 'package:mini_projet/modules/home/home_screen.dart';
import 'package:mini_projet/modules/orders/orders_screen.dart';
import 'package:mini_projet/modules/profile/profile_screen.dart';
import 'package:mini_projet/shared/constants/constants.dart';
import 'package:mini_projet/shared/network/remote/dio_helper.dart';
import '../../models/item_model.dart';

class LayoutCubit extends Cubit<LayoutStates> {
  LayoutCubit() : super(LayoutInitialState());

  static LayoutCubit get(context) => BlocProvider.of(context);

  late PageController pageController;

  int currentIndex = 0;

  bool isClient = true;
  final name=TextEditingController();
  final email=TextEditingController();
  final password=TextEditingController();
  final confirmPassword=TextEditingController();
  final phone=TextEditingController();

  String? nameValidator(String? value){
    if(value!.isNotEmpty){
      if(!RegExp(r'^[a-z A-Z]+$').hasMatch(value)){
        return "Enter correct name";
      }
    }

    return null;
  }
  String? phoneValidator(String? value){
    if(value!.isNotEmpty)
    if(!RegExp(r'^((\+|00)216)?(7|9|4|2|5)[0-9]{7}').hasMatch(value)){
      return "Enter correct phone number";
    }
    return null;
  }
  String?  emailValidator(String? value){
    if(value!.isNotEmpty)
    if(!RegExp(r'^[\w-\,]+@([\w-]+\.)+[\w]{2,5}').hasMatch(value)){
      return "Enter correct email";
    }
    return null;
  }
  String? passwordValidator(String? value){
    if(value!.isNotEmpty)
    if(!RegExp(r'^(?=.*[0-9a-zA-Z]).{6,}$').hasMatch(value)){
      return "Enter correct password";
    }
    return null;
  }
  String? confirmPasswordValidator(String? value){
    if(password.text!=value){
      return "Password do not match";
    }
    return null;
  }

  void changeScreen(int index) {
    currentIndex = index;
    emit(LayoutChangeBotNav());
  }

  List<IconData> listOfIcons = [
    Icons.home,
    Icons.favorite,
    Icons.work_history,
    Icons.person,
  ];

  List<IconData> listOfTraderIcons = [
    Icons.home,
    Icons.work_history,
    Icons.person,
  ];

  List<String> appBarTitles = ['Home', 'Favorites', 'Orders', 'Profile'];

  List<String> appBarTraderTitles = ['Home', 'Orders', 'Profile'];

  List<Widget> bodyScreens = [
    HomeScreen(),
    FavoriteScreen(),
    OrdersScreen(),
    ProfileScreen()
  ];

  List<Widget> bodyTraderScreens = [
    HomeScreen(),
    OrdersScreen(),
    ProfileScreen()
  ];

  List<ItemModel> favorites = [];
  List<OrderModel> orders = [];
  List<ItemModel> items = [];

  Future<void> getAllItems(bool isClient) async {

    emit(GetItemsLoadingState());
    DioHelper.getData(url:isClient==true? 'client/product':'merchant/product/list/$token',).then((value) {
      items=[];
      (value.data['products'] as List).forEach((element) {
        items.add(ItemModel.fromJson(element));

      });
      print(items);
      emit(GetItemsSuccessState(items: items));
    }).catchError((error) {
      print(error.toString());
      emit(GetItemsErrorState(error));
    });
  }

  Future<void> getFavoritesItems() async {
    emit(GetFavoritesLoadingState());
    DioHelper.getData(url: 'favorites',token: token).then((value) {
      favorites=value.data;
      emit(GetFavoriteSuccessState(favorites: favorites));
    }).catchError((error) {
      print(error.toString());
      emit(GetFavoriteErrorState(error));
    });
  }

  Future<void> postFavoritesItems() async {
    emit(PostFavoritesLoadingState());
    DioHelper.postData(url: 'favorites',token: token,data: favorites).then((value) {
      emit(PostFavoriteSuccessState(favorites: favorites));
    }).catchError((error) {
      print(error.toString());
      emit(PostFavoriteErrorState(error));
    });
  }

  Future<void> getOrdersItems() async {
    emit(GetOrdersLoadingState());
    DioHelper.getData(url: 'orders',token: token).then((value) {
      orders=value.data;
      emit(GetOrdersSuccessState(orders: orders));
    }).catchError((error) {
      print(error.toString());
      emit(GetOrdersErrorState(error));
    });
  }

  Future<void> postOrdersItems()  async {
  emit(PostOrdersLoadingState());
  DioHelper.postData(url: 'orders',token: token, data: orders).then((value) {
  emit(PostOrdersSuccessState(orders: orders));
  }).catchError((error) {
  print(error.toString());
  emit(PostOrdersErrorState(error));
  });
}

  File? profileImage;
  Future getProfileImage() async {
    ImagePicker picker = ImagePicker();
    final pikedFile = await picker.pickImage(source: ImageSource.gallery);
    if (pikedFile != null) {
      profileImage = File(pikedFile.path);
      emit(ProfileImagePickedSuccessState());
    } else {
      emit(ProfileImagePickedErrorState());
    }
  }


  File? itemImage;
  Future getItemImage() async {
    ImagePicker picker = ImagePicker();
    final pikedFile = await picker.pickImage(source: ImageSource.gallery);
    if (pikedFile != null) {
      itemImage = File(pikedFile.path);
      emit(ItemImagePickedSuccessState());
    } else {
      emit(ItemImagePickedErrorState());
    }
  }


  late UserModel userModel;
  Future<void> getUserData (bool isClient) async {
    emit(UserLoadingState());
    await DioHelper.getData(url: isClient==true?'client/user/$token':'merchant/user/$token').then(
            (value)
        {
          // print(value.data);
          userModel= UserModel.fromJson(value.data[isClient==true?"client":"merchant"]);
          // userModel= UserModel.fromJson(value.data["client"]);
          emit(UserSuccessState());
        }
    ).catchError(
            (error) {
          print(error.toString());
          emit(UserErrorState(error.toString()));
        });
  }

  Future<void> updateUserProfile (bool isClient, {required String email,required String name,required String phone, required String password}) async {
    if(email!=""||name!=""||password!=""||phone!=""){
      emit(UpdateUserLoadingState());
      await DioHelper.putData(url: isClient==true?'client/update/$token':'merchant/update/$token',
          data: {
            'name':name==""?userModel.name:name,
            'email':email==""?userModel.email:email,
            'phone':phone==""?userModel.phone:phone,
            'password':password==""?userModel.password:password
          }
      ).then(
              (value)
          async{
            // print(value.data);
           await getUserData(isClient);
            emit(UpdateUserSuccessState());
          }
      ).catchError(
              (error) {
            print(error.toString());
            emit(UpdateUserErrorState(error.toString()));
          });
    }

  }
  //edit profile
  bool editingProfile = false;

  void startEditProfile() {
    editingProfile = true;
    emit(UserStartEditProfileState());
  }

  void doneEditProfile() {
    editingProfile = false;
    emit(UserDoneEditProfileState());
  }
}
