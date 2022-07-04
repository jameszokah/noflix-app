import 'package:noflix/data/data.dart';
import 'package:noflix/screens/screens.dart';
import 'package:flutter/material.dart';
import 'package:flutter_font_icons/flutter_font_icons.dart';

class SearchScreen extends StatefulWidget {
  SearchScreen({Key? key}) : super(key: key);
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        elevation: 0,
        title: getSearchInput(),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(bottom: 12.0, left: 12.0),
            child: Text("Top Searches",
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 21,
                )),
          ),
          Expanded(
            child: Container(
              width: MediaQuery.of(context).size.width,
              child: CustomScrollView(
                physics: BouncingScrollPhysics(),
                slivers: [
                  SliverList(
                    delegate: SliverChildBuilderDelegate(
                        (BuildContext context, int i) {
                      return GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => VideoDetailedScreen()));
                        },
                        child: Container(
                          padding: const EdgeInsets.only(
                              left: 10, right: 10, top: 10, bottom: 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Container(
                                height: 90,
                                width: 140,
                                child: Stack(
                                  children: [
                                    Container(
                                      decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(10.0),
                                        image: DecorationImage(
                                          image:
                                              AssetImage(myList[i].imageUrl!),
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                    Container(
                                      decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(10.0),
                                        color: Colors.black.withOpacity(0.2),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              Container(
                                width:
                                    (MediaQuery.of(context).size.width - 46) /
                                        2.5,
                                child: Text(
                                  myList[i].name!,
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600,
                                  ),
                                  softWrap: true,
                                ),
                              ),
                              Container(
                                padding: const EdgeInsets.only(right: 6),
                                height: 80,
                                child: Container(
                                  width: 35,
                                  height: 35,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    border: Border.all(
                                      color: Colors.white,
                                      width: 2,
                                      style: BorderStyle.solid,
                                    ),
                                  ),
                                  child: Center(
                                      child: Icon(Icons.play_arrow,
                                          color: Colors.white)),
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    }, childCount: myList.length),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

Widget getSearchInput() {
  return Container(
    alignment: Alignment.center,
    width: double.infinity,
    height: 35,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(5),
      color: Colors.grey.withOpacity(0.25),
    ),
    child: TextField(
      autocorrect: true,
      enableSuggestions: true,
      textAlignVertical: TextAlignVertical.center,
      cursorColor: Colors.white.withOpacity(0.5),
      keyboardAppearance: Brightness.dark,
      style: TextStyle(color: Colors.white.withOpacity(0.5)),
      decoration: InputDecoration(
        border: InputBorder.none,
        prefixIcon:
            Icon(AntDesign.search1, color: Colors.white.withOpacity(0.5)),
        hintText: 'Search',
        hintStyle: TextStyle(
          color: Colors.white.withOpacity(0.5),
        ),
      ),
    ),
  );
}
