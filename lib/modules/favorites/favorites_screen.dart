import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../layout/cubit/cubit.dart';
import '../../layout/cubit/states.dart';

class FavoriteScreen extends StatelessWidget {
  const FavoriteScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  BlocConsumer<LayoutCubit,LayoutStates>(builder: (context, state) {
      return SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 30,),
            Image.asset("assets/images/favorites.png",height: 400,fit: BoxFit.cover,),
            SizedBox(height: 30,),
            Text("Empty Favorites"),
          ],
        ),
      );
    }, listener: (context, state) {

    },);
  }
}
