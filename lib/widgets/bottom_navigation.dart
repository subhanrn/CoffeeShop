import 'package:CoffeeShop/utils/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

BottomNavigationBarItem createBottomNavigationBarItem(
    String asset, String semantic,
    {int notificationCount = 0}) {
  return BottomNavigationBarItem(
    icon: Stack(
      children: [
        SvgPicture.asset(
          asset,
          semanticsLabel: semantic,
          height: 25,
          width: 25,
        ),
        if (notificationCount > 0)
          Positioned(
            top: 0,
            right: 0,
            child: Stack(
              children: <Widget>[
                Icon(
                  Icons.brightness_1,
                  size: 15,
                  color: DarkBrownColor,
                ),
                Positioned(
                  top: 1,
                  right: 4.5,
                  child: Text(
                    '$notificationCount',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                )
              ],
            ),
          ),
      ],
    ),
    title: Text(
      '',
      style: TextStyle(fontSize: 0),
    ),
  );
}
