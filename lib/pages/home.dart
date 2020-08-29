import 'package:CoffeeShop/models/coffee_category.dart';
import 'package:CoffeeShop/utils/constants.dart';
import 'package:CoffeeShop/widgets/bottom_navigation.dart';
import 'package:CoffeeShop/widgets/list_coffee.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  List<CoffeeCategory> _funcListCoffeeCategory() {
    List<CoffeeCategory> _list = [];
    _list.add(
      CoffeeCategory(
        icon: 'assets/Espresso.svg',
        name: 'Espresso',
      ),
    );
    _list.add(
      CoffeeCategory(
        icon: 'assets/Cappuccino.svg',
        name: 'Cappuccino',
      ),
    );
    _list.add(
      CoffeeCategory(
        icon: 'assets/macciato.svg',
        name: 'Mocchiato',
      ),
    );
    _list.add(
      CoffeeCategory(
        icon: 'assets/Mocha.svg',
        name: 'Mocha',
      ),
    );
    _list.add(
      CoffeeCategory(
        icon: 'assets/latte.svg',
        name: 'Latte',
      ),
    );

    return _list;
  }

  List<BottomNavigationBarItem> _barIcons() {
    return [
      createBottomNavigationBarItem(
        'assets/home_icon.svg',
        'Home',
      ),
      createBottomNavigationBarItem(
        'assets/pin_maps_icon.svg',
        'Locations',
      ),
      createBottomNavigationBarItem(
        'assets/cup_icon.svg',
        'Coffee',
        notificationCount: 1,
      ),
      createBottomNavigationBarItem(
        'assets/profile_icon.svg',
        'Profile',
      ),
    ];
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    List<CoffeeCategory> _listCoffeeCategory = _funcListCoffeeCategory();
    List<BottomNavigationBarItem> _listBarIcons = _barIcons();

    return Scaffold(
      body: SafeArea(
        child: Container(
          color: DefaultColor,
          child: Column(children: [
            Container(
              padding: EdgeInsets.symmetric(
                horizontal: 24,
                vertical: 27.5,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SvgPicture.asset(
                    'assets/burger_menu.svg',
                    semanticsLabel: 'Burger Menu',
                  ),
                  SvgPicture.asset(
                    'assets/search_icon.svg',
                    semanticsLabel: 'Search Icon',
                  ),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(
                horizontal: 24,
                vertical: 15,
              ),
              alignment: Alignment.topLeft,
              child: Text.rich(
                TextSpan(
                  style: TextStyle(fontSize: 36),
                  children: [
                    TextSpan(
                      text: "It's Great",
                    ),
                    TextSpan(
                      text: ' ',
                      style: TextStyle(
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    TextSpan(
                      text: 'Day for\nCoffee.',
                      style: TextStyle(
                        color: BrownColor,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ],
                ),
                textAlign: TextAlign.left,
              ),
            ),
            Flexible(
              flex: 1,
              child: Container(
                padding: EdgeInsets.symmetric(
                  horizontal: 10,
                ),
                alignment: Alignment.topLeft,
                child: ListView.builder(
                  itemCount: _listCoffeeCategory.length,
                  itemBuilder: (ctx, int index) => ListCoffee(
                    text: _listCoffeeCategory[index].name,
                    icon: _listCoffeeCategory[index].icon,
                  ),
                ),
              ),
            ),
          ]),
        ),
      ),
      bottomNavigationBar: Container(
        height: 90,
        color: DefaultColor,
        child: ClipRRect(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(46),
            topRight: Radius.circular(46),
          ),
          child: _bottomNavBar(_listBarIcons),
        ),
      ),
    );
  }

  BottomNavigationBar _bottomNavBar(List<BottomNavigationBarItem> items) {
    return BottomNavigationBar(
      items: items,
      currentIndex: _selectedIndex,
      onTap: _onItemTapped,
    );
  }
}
