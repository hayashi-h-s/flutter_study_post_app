import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../constants.dart';
import '../enums.dart';

class CustomBottomNavBar extends StatelessWidget {
  const CustomBottomNavBar({
    Key key,
    @required this.selectedMenu,
  }) : super(key: key);

  final MenuState selectedMenu;

  @override
  Widget build(BuildContext context) {
    final Color inActiveIconColor = Colors.red;
    return Container(
      padding: EdgeInsets.symmetric(vertical: 14),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            offset: Offset(0, -15),
            blurRadius: 20,
            color: Colors.green.withOpacity(0.15),
          ),
        ],
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(40),
          topRight: Radius.circular(40),
        ),
      ),
      child: SafeArea(
          top: false,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              IconButton(
                  icon: Icon(
                    Icons.home,
                    color: MenuState.profile == selectedMenu
                        ? Colors.orange
                        : Colors.green,
                  ),
                  onPressed: () => {
                        // Navigator.pushNamed(context, HomeScreen.routeName),
                      }),
              IconButton(
                icon: Icon(Icons.home),
                onPressed: () {
                },
              ),
              IconButton(
                icon: Icon(Icons.home),
                onPressed: () {

                },
              ),
              IconButton(
                  icon: Icon(
                    Icons.home,
                    color: MenuState.profile == selectedMenu
                        ? Colors.orange
                        : Colors.green,
                  ),

                  //   icon: SvgPicture.asset(
                  //   "assets/icons/User Icon.svg",
                  //   color: MenuState.profile == selectedMenu
                  //       ? Colors.orange
                  //       : inActiveIconColor,
                  // ),
                  onPressed: () => {
                        // Navigator.pushNamed(context, ProfileScreen.routeName),
                      }),
            ],
          )),
    );
  }
}
