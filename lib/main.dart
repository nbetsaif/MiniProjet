import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mini_projet/layout/cubit/cubit.dart';
import 'package:mini_projet/modules/home/home_screen.dart';
import 'package:mini_projet/modules/product/prodct_detail_screen.dart';
import 'package:mini_projet/shared/styles/theme.dart';
import 'layout/layout_screen.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(providers: [
      BlocProvider(create: (context) => LayoutCubit())
    ], child: MaterialApp(
      theme: Themes.lightTheme,
      debugShowCheckedModeBanner: false,
      home: LayoutScreen(),
    ));
  }
}
