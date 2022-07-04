import 'package:noflix/screens/screens.dart';
import 'package:flutter/material.dart';

import '../models/models.dart';
import 'widgets.dart';

class ContentHeader extends StatelessWidget {
  final Content? featuredContent;

  ContentHeader({this.featuredContent});

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    return Stack(
      alignment: Alignment.center,
      children: [
        Container(
          height: screenHeight - 230,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(featuredContent!.imageUrl!),
              fit: BoxFit.cover,
            ),
          ),
        ),
        Container(
          height: screenHeight - 230,
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Colors.black,
                Colors.transparent,
              ],
              begin: Alignment.bottomCenter,
              end: Alignment.topCenter,
            ),
          ),
        ),
        Positioned(
          bottom: 110.0,
          child: SizedBox(width: 250.0, child: Image.asset(featuredContent!.titleImageUrl!)),
        ),
        Positioned(
          left: 0,
          right: 0,
          bottom: 40.0,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              VerticalIconButton(icon: Icons.add, title: 'List', onTap: () => print('My List')),
              _PlayButton(),
              VerticalIconButton(icon: Icons.info_outlined, title: 'Info', onTap: () => print('My Info')),
            ],
          ),
        ),
      ],
    );
  }
}

class _PlayButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return TextButton.icon(
      onPressed: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) => VideoDetailedScreen()));
      },
      icon: Icon(
        Icons.play_arrow,
        size: 30.0,
        color: Colors.black,
      ),
      label: const Text(
        'Play',
        style: TextStyle(
          fontSize: 16.0,
          fontWeight: FontWeight.w600,
          color: Colors.black,
        ),
      ),
      style: TextButton.styleFrom(
        padding: const EdgeInsets.fromLTRB(15.0, 6.0, 20.0, 6.0),
        backgroundColor: Colors.white,
        primary: Colors.white,
      ),
    );
  }
}
