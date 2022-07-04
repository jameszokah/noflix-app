import 'package:noflix/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_font_icons/flutter_font_icons.dart';

class DownloadScreen extends StatefulWidget {
  DownloadScreen({Key? key}) : super(key: key);
  _DownloadScreenState createState() => _DownloadScreenState();
}

class _DownloadScreenState extends State<DownloadScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ScreenAppBar(
        title: 'My Downloads',
      ),
      body: getBodyDownloads(context),
    );
  }
}

Widget getBodyDownloads(BuildContext context) {
  return SingleChildScrollView(
    physics: BouncingScrollPhysics(),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          width: MediaQuery.of(context).size.width,
          height: 50,
          decoration: BoxDecoration(
            color: Colors.grey.withOpacity(0.2),
          ),
          child: Padding(
            padding: const EdgeInsets.only(left: 20, right: 20),
            child: Row(
              children: [
                Icon(Icons.info_outlined, color: Colors.white),
                SizedBox(width: 10),
                Text('Smart Downloads',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    )),
                SizedBox(width: 4),
                InkWell(
                  onTap: () => print('smart download toggle ON'),
                  child: Text('ON',
                      style: TextStyle(
                        color: Colors.blue,
                        fontWeight: FontWeight.bold,
                      )),
                ),
              ],
            ),
          ),
        ),
        SizedBox(height: 50),
        Column(
          children: [
            Container(
              width: 150,
              height: 150,
              decoration: BoxDecoration(
                color: Colors.grey.withOpacity(0.2),
                shape: BoxShape.circle,
              ),
              child: Center(
                child: Icon(Icons.file_download, size: 80, color: Colors.grey.withOpacity(0.3)),
              ),
            ),
          ],
        ),
        SizedBox(
          height: 30,
        ),
        Text(
          'Never be without Fakeflix',
          style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
        ),
        SizedBox(
          height: 20,
        ),
        Padding(
          padding: const EdgeInsets.only(left: 30.0, right: 30.0),
          child: Text(
            "Download shows and movies so you'll never be without something ton watch even when you are offline",
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.white.withOpacity(0.8),
              fontSize: 16,
              height: 1.4,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        SizedBox(
          height: 20,
        ),
        InkWell(
          onTap: () => print('Taped see what you can download'),
          child: Container(
            height: 50,
            width: MediaQuery.of(context).size.width * 0.85,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: Colors.white,
            ),
            child: Center(
                child: Text('See What You Can Downoad',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ))),
          ),
        ),

        // Spacer(),
      ],
    ),
  );
}
