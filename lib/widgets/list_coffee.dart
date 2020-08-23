import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

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
    return FlatButton(
      onPressed: () {},
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
                  style: GoogleFonts.sen(
                    fontSize: 20,
                  ),
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
