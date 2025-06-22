import 'package:flutter/material.dart';

class PerfilPage extends StatelessWidget {
  Widget _buildColumRating(String title, String value) {
    return Column(
      children: [
        Text(title, style: TextStyle(color: Colors.grey.shade600)),
        Text(
          value,
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            Container(
              width: double.infinity,
              height: screenHeight / 4,
              decoration: BoxDecoration(
                color: Color(0xff7A88A3),
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(20),
                  bottomRight: Radius.circular(20),
                ),
              ),
            ),
            Align(
              alignment: Alignment.topCenter,

              child: Container(
                padding: EdgeInsets.all(16),
                margin: EdgeInsets.only(top: screenHeight / 12),
                width: screenWidth - 60,
                height: screenHeight / 4,
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey,
                      offset: Offset(0, 5),
                      blurRadius: 10,
                    ),
                  ],
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(25),
                ),
                child: Column(
                  children: [
                    Row(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(15),
                          child: Image.network(
                            "https://images.pexels.com/photos/1222271/pexels-photo-1222271.jpeg",
                            width: screenWidth / 4,
                            height: screenWidth / 3.5,
                            fit: BoxFit.cover,
                          ),
                        ),
                        SizedBox(width: 16),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Elliot Thomson",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                              ),
                            ),
                            Text(
                              "Associate editor",
                              style: TextStyle(color: Colors.grey.shade600),
                            ),
                            Container(
                              width: screenWidth / 2.1,
                              padding: EdgeInsets.all(8),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15),
                                color: Colors.grey.shade200,
                              ),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  _buildColumRating("Likes", "34"),
                                  _buildColumRating("Followers", "980"),
                                  _buildColumRating("Rating", "8.9"),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    Row(children: []),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
