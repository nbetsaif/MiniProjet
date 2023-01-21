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
        var cubit=LayoutCubit.get(context);
        return cubit.orders.length!=0? ListView.separated(
            physics: BouncingScrollPhysics(),
            shrinkWrap: true,
            itemBuilder: (context, index) {
              return
                LayoutCubit.get(context).isClient==true?
                orderItem(context,index,cubit.orders[index].state)
                    :
                orderTraderItem(context,index,cubit.orders[index].state);
            },
            separatorBuilder: (context, index) {
              return divider();
            },
            itemCount:cubit.orders.length):
        Column(
            mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              children: [
                Image.asset("assets/images/empty.png",height:MediaQuery.of(context).size.height/1.7 ,),
                Text('No Orders Yet',)
              ],
            )  ;
      },
      listener: (context, state) {},
    );
  }
}
