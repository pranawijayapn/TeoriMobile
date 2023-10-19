import 'package:flutter/material.dart';
import 'package:mobile/widget/category.dart';
import 'package:mobile/widget/toplist.dart';
import 'package:mobile/widget/data.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.bookmark),
            label: "Tersimpan",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.library_add_check_outlined),
            label: "Favorit",
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: SafeArea(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                Container(
                  height: 140,
                  width: double.infinity,
                  color: Colors.blue,
                ),
                Column(
                  children: [
                    SizedBox(
                      height: 10,
                    ),
                    Padding(
                        padding: const EdgeInsets.all(15),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Container(
                                    alignment: Alignment.topLeft,
                                    height: 45,
                                    width: 45,
                                    decoration: BoxDecoration(
                                        image: DecorationImage(
                                            image: NetworkImage(
                                                'https://th.bing.com/th/id/OIP.XadmtOiEEI6Zv388n5l2dQHaHx?pid=ImgDet&rs=1')),
                                        borderRadius: BorderRadius.circular(25),
                                        border: Border.all(
                                            color: Colors.white,
                                            style: BorderStyle.solid,
                                            width: 2))),
                                SizedBox(
                                  width: 10,
                                ),
                                Text(
                                  'Selamat Datang di FilmFlix',
                                  style: TextStyle(
                                    color: Colors
                                        .white, // Mengatur warna teks menjadi putih
                                    // Tambahkan atribut gaya teks lainnya jika diperlukan
                                  ),
                                )
                              ],
                            ),
                            Container(
                              alignment: Alignment.topRight,
                              child: Icon(
                                Icons.notifications_active,
                                color: Colors.white,
                                size: 30,
                              ),
                            )
                          ],
                        )),
                    SizedBox(
                      height: 15,
                    ),
                    Padding(
                        padding: const EdgeInsets.all(15),
                        child: Container(
                          height: 60,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: Color(0xFFF5F5F7),
                            borderRadius: BorderRadius.circular(30),
                          ),
                          child: TextField(
                            cursorHeight: 20,
                            autofocus: false,
                            decoration: InputDecoration(
                                hintText: 'Cari Film Favoritmu',
                                prefixIcon: Icon(Icons.search),
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(30),
                                    borderSide: BorderSide(
                                        color: Colors.grey, width: 2))),
                          ),
                        )),
                  ],
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Category(
                    imagePath: 'assets/images/romance.png', title: 'Romance'),
                Category(
                    imagePath: 'assets/images/action.png', title: 'Action'),
                Category(imagePath: 'assets/images/magic.png', title: 'Magic'),
                Category(
                    imagePath: 'assets/images/fantasi.png', title: 'Fantasy'),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(15),
              child: Text(
                'Populer',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              ),
            ),
            ListView.builder(
              itemCount: dataList.length,
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                Data data = dataList[index];
                return Content(data: data);
              },
            ),
          ],
        )),
      ),
    );
  }
}
