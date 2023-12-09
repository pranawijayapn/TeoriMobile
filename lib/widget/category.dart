import 'package:flutter/material.dart';
import 'package:mobile/pages/main_page_movie.dart';
import 'package:mobile/pages/main_page_tv.dart';

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
          if (title == "Movies") {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => MainPageMovie(),
              ),
            );
          } else if (title == "Television") {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => PageTelevision(),
              ),
            );
          }
        },
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Container(
            width: double.infinity,
            height: 60,
            child: Row(
              children: [
                Expanded(
                  child: Image.asset(
                    imagePath,
                    width: 30,
                  ),
                ),
                SizedBox(
                  width: 15, // Adjust the spacing between buttons as needed
                ),
                Expanded(
                  child: Text(
                    title,
                    style: TextStyle(fontSize: 11),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// import 'package:flutter/material.dart';
// import 'package:mobile/pages/main_page_movie.dart';
// import 'package:mobile/pages/main_page_tv.dart';

// class Category extends StatelessWidget {
//   final String imagePath;
//   final String title;

//   const Category({
//     Key? key,
//     required this.imagePath,
//     required this.title,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Card(
//       child: InkWell(
//         onTap: () {
//           if (title == "Movies") {
//             Navigator.push(
//               context,
//               MaterialPageRoute(
//                 builder: (context) => MainPageMovie(),
//               ),
//             );
//           } else if (title == "Television") {
//             Navigator.push(
//               context,
//               MaterialPageRoute(
//                 builder: (context) => PageTelevision(),
//               ),
//             );
//           }
//         },
//         child: Padding(
//           padding: const EdgeInsets.all(16),
//           child: Container(
//             width: double.infinity,
//             height: 60,
//             child: Row(
//               children: [
//                 Expanded(
//                   child: Image.asset(
//                     imagePath,
//                     width: 30,
//                   ),
//                 ),
//                 SizedBox(
//                   width: 15, // Adjust the spacing between buttons as needed
//                 ),
//                 Expanded(
//                   child: Text(
//                     title,
//                     style: TextStyle(fontSize: 11),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
