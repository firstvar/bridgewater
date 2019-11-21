import 'package:bridge_water/common/utils.dart';
import 'package:flutter/material.dart';

class Header extends StatelessWidget {
  Widget children;
  Header(this.children);

  @override
  Widget build(BuildContext context) {
    return Container(
        height: setHeight(120),
        padding: EdgeInsets.only(
            top: setHeight(40.0), left: setWidth(30), right: setWidth(30)),
        child:
            Column(
              children: <Widget>[
                this.children,
                Padding(
                  padding: EdgeInsets.only(top: 20.0),
                  child: Divider(color: Color(0x22000000)),
                )
              ],
            ));
  }
}
