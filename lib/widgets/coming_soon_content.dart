import 'package:noflix/models/models.dart';
import 'package:flutter/material.dart';

class ComingSoonContent extends StatelessWidget {
  final Content? content;
  const ComingSoonContent({Key? key, this.content}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(
        bottom: 30,
      ),
      width: MediaQuery.of(context).size.width,
      child: Column(
        children: [
          Container(
            height: 220.0,
            child: Stack(
              children: [
                Container(
                  decoration: BoxDecoration(
                    // borderRadius: BorderRadius.circular(16.0),
                    image: DecorationImage(
                      image: AssetImage(content!.imageUrl!),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                    // borderRadius: BorderRadius.circular(16.0),
                    color: Colors.black.withOpacity(0.2),
                  ),
                ),
              ],
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 20.0,
              ),
              Stack(
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: 2.5,
                    color: Colors.grey.withOpacity(0.7),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width * 0.23,
                    height: 2.5,
                    color: Colors.red.withOpacity(0.7),
                  ),
                ],
              ),
              SizedBox(height: 15),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      SizedBox(width: 10),
                      SizedBox(
                        width: 120,
                        child: Image.asset(content!.titleImageUrl!),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.only(right: 10),
                        child: Column(
                          children: [
                            Icon(
                              Icons.notifications_outlined,
                              color: Colors.white,
                              size: 26.0,
                            ),
                            SizedBox(height: 5),
                            Text('Remind Me',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 11,
                                )),
                          ],
                        ),
                      ),
                      SizedBox(width: 5),
                      Container(
                        padding: const EdgeInsets.only(right: 10),
                        child: Column(
                          children: [
                            Icon(
                              Icons.info_outlined,
                              color: Colors.white,
                              size: 26.0,
                            ),
                            SizedBox(height: 5),
                            Text('Info',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 11,
                                )),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(height: 12),
              Padding(
                padding: const EdgeInsets.only(right: 10, left: 10),
                child: Text('Coming soon on Friday',
                    style: TextStyle(
                      fontSize: 15,
                      color: Colors.white.withOpacity(0.5),
                    )),
              ),
              SizedBox(height: 14),
              Padding(
                padding: const EdgeInsets.only(right: 10, left: 10),
                child: Text(content!.name!,
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      height: 1.4,
                    )),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 10, left: 10, top: 4),
                child: Text(content!.description!,
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w300,
                      color: Colors.white.withOpacity(0.5),
                      height: 1.4,
                    )),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
