import 'package:flutter/material.dart';
import 'package:mobile/pages/category_page.dart';

class Category extends StatelessWidget {
  final String imagePath;
  final String title;
  
  const Category({
    Key? key,
    required this.imagePath,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => Kategori(), // Replace with your desired class
            ),
          );
        },
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Container(
            width: 50,
            height: 60,
            child: Column(
              children: [
                Image.asset(
                  imagePath,
                  width: 30,
                ),
                SizedBox(height: 15,),
                Text(
                  title,
                  style: TextStyle(fontSize: 11),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
