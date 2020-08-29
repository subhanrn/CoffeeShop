import 'package:CoffeeShop/navigation/locator.dart';
import 'package:CoffeeShop/navigation/route_paths.dart' as routePath;
import 'package:CoffeeShop/services/navigation_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ListCoffee extends StatelessWidget {
  final String text;

  final String icon;

  ListCoffee({
    Key key,
    @required this.text,
    @required this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final NavigationService _navigationService = locator<NavigationService>();
    return FlatButton(
      onPressed: () {
        _navigationService.push(routePath.ItemDetail);
      },
      child: Center(
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 20),
          child: Row(
            children: [
              SvgPicture.asset(
                '$icon',
                semanticsLabel: '$text',
                width: 40,
              ),
              Container(
                padding: EdgeInsets.only(left: 30),
                child: Text(
                  '$text',
                  style: TextStyle(fontSize: 20),
                ),
              ),
              Flexible(
                flex: 1,
                child: Align(
                  alignment: Alignment.centerRight,
                  child: SvgPicture.asset(
                    'assets/list_button.svg',
                    semanticsLabel: 'Enter Menu',
                    height: 15,
                    width: 15,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
