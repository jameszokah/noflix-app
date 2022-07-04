import 'package:noflix/screens/screens.dart';
import 'package:flutter/material.dart';

import '../assets.dart';

class AppBarButtons extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 10),
      child: InkWell(
        onTap: () {
          Navigator.push(context, MaterialPageRoute(builder: (_) => ProfileScreen()));
        },
        child: Container(
          width: 30.0,
          height: 20.0,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(
                Assets.bluelackAvatar,
              ),
              // fit: BoxFit.fill,
            ),
          ),
        ),
      ),
    );
  }
}
