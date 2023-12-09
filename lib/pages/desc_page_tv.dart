import 'package:flutter/material.dart';
import 'package:mobile/models/television.dart';
import 'package:mobile/pages/main_page.dart';
import 'package:mobile/pages/login.dart';
import 'package:firebase_auth/firebase_auth.dart';

class DescPage extends StatefulWidget {
  final Television television;

  const DescPage({Key? key, required this.television}) : super(key: key);

  @override
  _DescPageState createState() => _DescPageState();
}

class _DescPageState extends State<DescPage> {
  final _auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text('Detail Page'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Image.network(
              "https://www.themoviedb.org/t/p/w500${widget.television.posterPath}" ?? "",
              fit: BoxFit.cover,
            ),
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
                        widget.television.name ?? "",
                        style: TextStyle(fontSize: 17, color: Colors.white),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 30),
                  Text(
                    "Original Name: ${widget.television.originalName ?? ""}",
                    style: TextStyle(fontSize: 16, color: Colors.white),
                  ),
                  Text(
                    "Rating: ${widget.television.voteAverage ?? ""}",
                    style: TextStyle(fontSize: 16, color: Colors.white),
                  ),
                  Text(
                    "Language: ${widget.television.original_language?.toUpperCase() ?? ""}",
                    style: TextStyle(fontSize: 16, color: Colors.white),
                  ),
                  Text(
                    "Country: ${widget.television.originCountry ?? ""}",
                    style: TextStyle(fontSize: 16, color: Colors.white),
                  ),
                  Text(
                    "First Air Date: ${widget.television.FirstAirDate ?? ""}",
                    style: TextStyle(fontSize: 16, color: Colors.white),
                  ),
                  SizedBox(height: 20),
                  Text(
                    "Overview:",
                    style: TextStyle(fontSize: 18, color: Colors.white),
                  ),
                  SizedBox(height: 10),
                  Text(
                    widget.television.overview ?? "",
                    style: TextStyle(fontSize: 16, color: Colors.white),
                  ),
                  SizedBox(height: 40,)
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.white,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.logout),
            label: 'Logout',
          ),
        ],
        onTap: (int index) {
          if (index == 0) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => MainPage()),
            );
          } else if (index == 1) {
            // Tambahkan fungsi onTap di sini
            _auth.signOut();
            // Perubahan: Menggunakan pushReplacement agar dapat kembali ke LoginPage
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => const Login(),
              ),
            );
          }
        },
      ),
    );
  }
}
