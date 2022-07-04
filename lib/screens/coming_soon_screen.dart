import 'package:noflix/widgets/widgets.dart';
import 'package:flutter/material.dart';
import '../data/data.dart';

class ComingSoonScreen extends StatefulWidget {
  ComingSoonScreen({Key? key}) : super(key: key);
  _ComingSoonScreenState createState() => _ComingSoonScreenState();
}

class _ComingSoonScreenState extends State<ComingSoonScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ScreenAppBar(
        title: 'Coming Soon',
      ),
      body: getBody(context),
    );
  }
}

Widget getBody(BuildContext context) {
  return CustomScrollView(
    physics: const BouncingScrollPhysics(),
    slivers: [
      SliverPadding(
        padding: const EdgeInsets.only(top: 15, right: 10, left: 10, bottom: 15.0),
        sliver: SliverToBoxAdapter(
          child: Container(
            width: MediaQuery.of(context).size.width,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    IconButton(
                      icon: const Icon(Icons.notifications_outlined, size: 26, color: Colors.white),
                      onPressed: () => debugPrint('notification pressed'),
                    ),
                   const SizedBox(
                      width: 8.0,
                    ),
                   const Text(
                      'Notifcations',
                      style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                IconButton(
                  icon: const Icon(Icons.arrow_forward_ios_rounded, size: 24, color: Colors.white),
                  onPressed: () {},
                )
              ],
            ),
          ),
        ),
      ),
      SliverList(
        delegate: SliverChildBuilderDelegate((BuildContext context, int i) {
          return ComingSoonContent(content: previews[i], key: const ValueKey("comingsoon content"));
        }, childCount: previews.length),
      )
    ],
  );
}
