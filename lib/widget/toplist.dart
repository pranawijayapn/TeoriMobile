// //toplist.dart
// import 'package:flutter/material.dart';
// import 'package:mobile/pages/desc_page.dart';
// import 'package:mobile/widget/data.dart';

// class Content extends StatelessWidget {
//   final Data data;

//   const Content({Key? key, required this.data}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
                                
//     return InkWell(
//       onTap: () {
//         Navigator.push(
//           context,
//           MaterialPageRoute(
//              builder: (context) => desc(data: data),
//           ),
//         );
 
//       },
//       child: SizedBox(
//         width: double.infinity, 
//         height: 240, 
//         child: Stack(
//           children: [
//             Card(
//               clipBehavior: Clip.antiAliasWithSaveLayer,
//               shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
//               elevation: 10,
//               child: Column(
//                 children: [
//                   SizedBox(
//                     width: double.infinity,
//                     height: 150,
//                     child: Image.asset(data.imagePath, fit: BoxFit.cover,),
//                   )
//                 ],
//               ),
//             ), 
//             Positioned(
//               bottom: 0, 
//               left: 10, 
//               child: SizedBox(
//                 height: 70,
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Text(data.title, style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold, color: Colors.black),),
//                     SizedBox(height: 10,),
//                     Row(
//                       children: [
//                         Icon(Icons.star, color: Colors.amber,),
//                         Text(data.rating),
//                         SizedBox(width: 20,),
//                         Icon(Icons.access_time, color: Colors.grey,),
//                         SizedBox(width: 5,),
//                         Text(data.update)
//                       ],
//                     )
//                   ],
//                 ),
//               ),
//             ),
//             SizedBox(height: 30,)
//           ],
//         ),
//       ),
//     );
//   }
// }
