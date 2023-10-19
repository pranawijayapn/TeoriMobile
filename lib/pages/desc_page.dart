import 'package:flutter/material.dart';
import 'package:mobile/widget/data.dart';

class desc extends StatelessWidget {
  final Data data;
  const desc({Key? key, required this.data}) : super(key: key);

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
      appBar: AppBar(
        title: Text('Detail Page'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Image.asset(data.imagePath),
            Row(
              children: [
                Expanded(
                  child: Container(
                      padding: const EdgeInsets.only(
                        top: 10,
                        left: 20,
                        right: 20,
                        bottom: 8,
                      ),
                      color: Colors.white38,
                      child: Center(
                        child: Text(
                          data.title,
                          style: TextStyle(fontSize: 17, color: Colors.white),
                        ),
                      )),
                ),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              children: [
                Expanded(
                  child: Text(
                    data.episode,
                    textAlign:
                        TextAlign.center, // Mengatur teks menjadi di tengah
                    style: TextStyle(color: Colors.green, fontSize: 12),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 13,
            ),
            Container(
              child: Row(
                children: [
                 Expanded(
  child: ElevatedButton(
    onPressed: () {},
    style: ElevatedButton.styleFrom(
      primary: Colors.blue, // Warna latar belakang tombol
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(30.0), // Mengatur border-radius
      ),
    ),
    child: Text(
      'Download',
      style: TextStyle(
        color: Colors.white, // Warna teks
        fontSize: 18, // Ukuran teks // Ketebalan teks
      ),
    ),
  ),
)

                ],
              ),
            ),
            Row(
              children: [
                Expanded(
                    child: ElevatedButton(
                  onPressed: () {},
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(
                        Colors.white), // Warna latar belakang putih
                    foregroundColor: MaterialStateProperty.all<Color>(
                        Colors.black), // Warna teks hitam
                  ),
                  child: Text(
                    'Mulai Lihat',
                    style: TextStyle(fontSize: 18),
                  ),
                ))
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              padding: const EdgeInsets.only(
                top: 10,
                left: 10,
                right: 10,
                bottom: 18,
              ),
              
              child: RichText(
                textAlign: TextAlign.justify,
                text: TextSpan(
                  style: DefaultTextStyle.of(context).style.copyWith(
                        decoration:
                            TextDecoration.none, // Menghilangkan garis bawah
                        color: Colors.white,
                      ),
                      
                  children: <TextSpan>[
                    TextSpan(
                      text:
                          data.description,
                      style: TextStyle(
                        fontSize: 16,
                      ),
                    ),
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
