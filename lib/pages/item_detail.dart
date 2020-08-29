import 'package:CoffeeShop/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ItemDetail extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: CustomScrollView(
          slivers: <Widget>[
            SliverAppBar(
              iconTheme: IconThemeData(
                color: Colors.black,
              ),
              backgroundColor: DefaultColor,
              expandedHeight: 365,
              pinned: true,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(40),
                  bottomRight: Radius.circular(40),
                ),
              ),
              flexibleSpace: FlexibleSpaceBar(
                centerTitle: true,
                title: Text(
                  'Macchiato',
                  style: TextStyle(color: Colors.black),
                ),
                // background: Image.asset(
                //   'assets/bg.png',
                //   fit: BoxFit.cover,
                // ),
                background: Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(
                        'assets/bg.png',
                      ),
                      fit: BoxFit.cover,
                    ),
                  ),
                  child: Center(
                    // color: Colors.purple,
                    child: SvgPicture.asset(
                      'assets/macciato.svg',
                      height: 170,
                    ),
                  ),
                ),
              ),
            ),
            SliverFillRemaining(
              child: _buildContent(),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildContent() {
    return Container(
      // color: Colors.red,
      padding: EdgeInsets.only(top: 40, left: 24, right: 24),
      child: Column(
        children: [
          Container(
            height: 30,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Macchiato',
                  style: TextStyle(fontSize: 20),
                ),
                Flexible(
                    flex: 1,
                    child: Container(
                      child: Row(
                        // crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Container(
                            height: 38,
                            width: 38,
                            // color: DarkBrownColor,
                            child: RaisedButton(
                              color: Colors.red,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(100),
                                  topLeft: Radius.circular(100),
                                ),
                              ),
                              onPressed: null,
                              child: Text(
                                '-',
                                style: TextStyle(
                                  fontSize: 20,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                          SizedBox(width: 5),
                          Text('1', style: TextStyle(fontSize: 20)),
                          SizedBox(width: 5),
                          Container(
                            height: 38,
                            width: 38,
                            // color: DarkBrownColor,
                            child: RaisedButton(
                              color: Colors.red,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.only(
                                  // bottomLeft: Radius.circular(100),
                                  bottomRight: Radius.circular(100),
                                  topRight: Radius.circular(100),
                                ),
                              ),
                              onPressed: null,
                              child: Text(
                                '+',
                                style: TextStyle(
                                  fontSize: 20,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ))
                // Container(
                //   color: Colors.purple,
                //   child: Row(
                //     children: [
                //       FlatButton(
                //         onPressed: null,
                //         child: Container(
                //           width: 0,
                //           color: BrownColor,
                //           child: Center(
                //             child: Text(
                //               '+',
                //               style: TextStyle(color: Colors.white),
                //             ),
                //           ),
                //         ),
                //         color: Colors.green,
                //       ),
                //       Text('a'),
                //       Text('a'),
                //       Text('a'),
                //     ],
                //   ),
                // ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
