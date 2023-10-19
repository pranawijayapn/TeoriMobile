import 'package:flutter/material.dart';
import 'package:mobile/pages/main_page.dart';
//import 'package:mobile/widget/category.dart';
import 'package:mobile/widget/toplist.dart';
import 'package:mobile/widget/data.dart';

class Kategori extends StatefulWidget {
  const Kategori({super.key});

  @override
  State<Kategori> createState() => _KategoriState();
}

class _KategoriState extends State<Kategori> {
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
                                  height: 45,
                                  width: 45,
                                  child: InkWell(
                                    onTap: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              MainPage(), // Replace with your desired class
                                        ),
                                      );
                                    },
                                    child: Icon(
                                      Icons.arrow_back_rounded,
                                      color: Colors.white,
                                      size: 30,
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Container(
                                    alignment: Alignment.topCenter,
                                    child: Text(
                                      'FlimFlix',
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 30,
                                          fontWeight: FontWeight
                                              .bold // Mengatur warna teks menjadi putih
                                          // Tambahkan atribut gaya teks lainnya jika diperlukan
                                          ),
                                    ))
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
                                hintText: 'Cari Donghua Favoritmu',
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
            Padding(
              padding: const EdgeInsets.all(15),
              child: Text(
                'Action',
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
