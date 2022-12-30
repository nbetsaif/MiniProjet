import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mini_projet/layout/cubit/cubit.dart';
import 'package:mini_projet/layout/cubit/states.dart';
import 'package:mini_projet/modules/orders/widgets/widgets.dart';

class OrdersScreen extends StatelessWidget {
  const OrdersScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return BlocConsumer<LayoutCubit, LayoutStates>(
      builder: (context, state) {
        return ListView.separated(
            physics: BouncingScrollPhysics(),
            shrinkWrap: true,
            itemBuilder: (context, index) {
              return orderItem(context,index);
            },
            separatorBuilder: (context, index) {
              return divider();
            },
            itemCount: 3);
      },
      listener: (context, state) {},
    );
  }
}
