import 'package:CoffeeShop/models/coffee_category.dart';
import 'package:CoffeeShop/widgets/list_coffee.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 1;

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
      _createBottomNavigationBarItem('assets/home_icon.svg', 'Home'),
      _createBottomNavigationBarItem('assets/pin_maps_icon.svg', 'Locations'),
      _createBottomNavigationBarItem(
        'assets/cup_icon.svg',
        'Coffee',
        notificationCount: 1,
      ),
      _createBottomNavigationBarItem('assets/profile_icon.svg', 'Profile'),
    ];
  }

  BottomNavigationBarItem _createBottomNavigationBarItem(
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
                    color: Color(0xff8C746A),
                  ),
                  Positioned(
                    top: 2.5,
                    right: 4,
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

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    List<CoffeeCategory> _listCoffeeCategory = _funcListCoffeeCategory();
    return Scaffold(
      body: SafeArea(
        child: Container(
          color: Color(0xfffaf4ee),
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
                  style: GoogleFonts.sen(
                    textStyle: TextStyle(
                      fontFamily: 'Sen',
                      fontSize: 36,
                      color: Color(0xff000000),
                    ),
                  ),
                  children: [
                    TextSpan(
                      text: 'It\'s Great',
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
                        color: Color(0xffb98875),
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
        color: Color(0xfffaf4ee),
        child: ClipRRect(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(46),
            topRight: Radius.circular(46),
          ),
          child: BottomNavigationBar(
            items: _barIcons(),
            currentIndex: _selectedIndex,
            selectedItemColor: Colors.amber[800],
            onTap: _onItemTapped,
          ),
        ),
      ),
    );
  }
}
