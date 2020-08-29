import 'package:CoffeeShop/navigation/route_paths.dart' as routePath;
import 'package:CoffeeShop/pages/home.dart';
import 'package:CoffeeShop/pages/item_detail.dart';
import 'package:flutter/material.dart';

Route<dynamic> generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case routePath.Home:
      return MaterialPageRoute(
        builder: (context) => HomePage(),
      );

    case routePath.ItemDetail:
      return MaterialPageRoute(
        builder: (context) => ItemDetail(),
      );

    // case routePath.CounterBloc:
    //   return MaterialPageRoute(
    //     builder: (_) => BlocProvider(
    //       create: (_) => CounterBloc(),
    //       child: CounterBlocPage(),
    //     ),
    //   );
    //
    // case routePath.CounterCubit:
    //   return MaterialPageRoute(
    //     builder: (_) => BlocProvider(
    //       create: (_) => CounterCubit(),
    //       child: CounterCubitPage(),
    //     ),
    //   );
    //
    // case routePath.SharedCounterCubit:
    //   return MaterialPageRoute(
    //     builder: (context) => SharedCounterCubitPage(),
    //   );

    default:
      return MaterialPageRoute(
        builder: (context) => HomePage(),
      );
  }
}
