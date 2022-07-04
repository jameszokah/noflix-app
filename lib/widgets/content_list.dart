import 'package:noflix/screens/screens.dart';
import 'package:flutter/material.dart';
import '../models/models.dart';

class ContentList extends StatelessWidget {
  final String? title;
  final List<Content>? contentList;
  final bool? isOriginals;

  ContentList({Key? key, @required this.title, @required this.contentList, this.isOriginals = false}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: Text(title!, style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20.0)),
          ),
          Container(
            height: isOriginals! ? screenHeight - 280 : 200,
            child: ListView.builder(
              padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 16.0),
              physics: BouncingScrollPhysics(),
              scrollDirection: Axis.horizontal,
              itemCount: contentList!.length,
              itemBuilder: (BuildContext context, int i) {
                final content = contentList![i];
                return GestureDetector(
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => VideoDetailedScreen()));
                  },
                  child: Container(
                    margin: const EdgeInsets.symmetric(horizontal: 8.0),
                    height: isOriginals! ? 400.0 : 200.0,
                    width: isOriginals! ? 200.0 : 130.0,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage(content.imageUrl!),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
