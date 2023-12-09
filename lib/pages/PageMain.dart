import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:mobile/pages/login.dart';
import 'package:mobile/pages/desc_page.dart';
import 'package:mobile/widget/data.dart';
import 'package:mobile/widget/category.dart';
import 'package:mobile/models/movie.dart';
import 'package:mobile/http_service.dart';
import 'package:mobile/pages/welcomescreen.dart';
import 'package:mobile/pages/main_page_movie.dart'; // Import MainPageMovie
import 'package:mobile/pages/main_page_tv.dart'; // Import PageTelevision

class PageMain extends StatefulWidget {
  const PageMain ({Key? key});

  @override
  State<PageMain> createState() => _PageMainState();
}

class _PageMainState extends State<PageMain> {
  final _auth = FirebaseAuth.instance;
  final HttpService httpService = HttpService();
  String searchQuery = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => PageMain()),
                );
              },
              child: Icon(Icons.home),
            ),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.manage_accounts),
            label: "Akun",
          ),
          BottomNavigationBarItem(
            icon: GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => WelcomeScreen()),
                );
              },
              child: Icon(Icons.logout),
            ),
            label: "Logout",
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
                                          'https://th.bing.com/th/id/OIP.XadmtOiEEI6Zv388n5l2dQHaHx?pid=ImgDet&rs=1'),
                                    ),
                                    borderRadius: BorderRadius.circular(25),
                                    border: Border.all(
                                      color: Colors.white,
                                      style: BorderStyle.solid,
                                      width: 2,
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Text(
                                  'Selamat Datang di FilmFlix',
                                  style: TextStyle(
                                    color: Colors.white,
                                  ),
                                ),
                              ],
                            ),
                            Container(
                              alignment: Alignment.topRight,
                              child: InkWell(
                                onTap: () {
                                  _auth.signOut();
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => const Login(),
                                    ),
                                  );
                                },
                                child: const Padding(
                                  padding:
                                      EdgeInsets.symmetric(horizontal: 12.0),
                                  child: Icon(
                                    Icons.logout,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
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
                            onChanged: (value) {
                              setState(() {
                                searchQuery = value;
                              });
                            },
                            decoration: InputDecoration(
                              hintText: 'Cari Film Favoritmu',
                              prefixIcon: Icon(Icons.search),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(30),
                                borderSide: BorderSide(
                                  color: Colors.grey,
                                  width: 2,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(15),
                child: Text(
                  'Populer',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Category(
                    imagePath: 'assets/images/romance.png',
                    title: 'Movies',
                  ),
                  Category(
                    imagePath: 'assets/images/action.png',
                    title: 'Television',
                  ),
                ],
              ),
              FutureBuilder<List<Movie>>(
                future: httpService.fecthDataPlaces(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return CircularProgressIndicator();
                  } else if (snapshot.hasError) {
                    return Text('Error: ${snapshot.error}');
                  } else if (snapshot.hasData) {
                    List<Movie> movies = snapshot.data!;

                    // Filter dan sort film berdasarkan rating tertinggi
                    movies = movies.where((movie) => movie.title?.toLowerCase().contains(searchQuery.toLowerCase()) ?? false).toList();
                    movies.sort((a, b) => (b.voteAverage ?? 0).compareTo(a.voteAverage ?? 0));

                    // Ambil 3 film pertama
                    movies = movies.take(3).toList();

                    return ListView.builder(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: movies.length,
                      itemBuilder: (context, index) {
                        Movie movie = movies[index];
                        return Column(
                          children: [
                            InkWell(
                              child: Card(
                                clipBehavior: Clip.antiAliasWithSaveLayer,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                elevation: 10,
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      width: 150,
                                      child: Image.network(
                                        "https://www.themoviedb.org/t/p/w220_and_h330_face${movie.posterPath}" ?? "",
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                    Expanded(
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              movie.title ?? "",
                                              style: TextStyle(
                                                fontSize: 17,
                                                fontWeight: FontWeight.bold,
                                                color: Colors.black,
                                              ),
                                            ),
                                            SizedBox(height: 20),
                                            Row(
                                              children: [
                                                Text(
                                                  "Rating: ${movie.voteAverage?.toStringAsFixed(1) ?? ""}",
                                                ),
                                                SizedBox(width: 20),
                                              ],
                                            ),
                                            SizedBox(height: 8),
                                            Text(
                                              "Language: ${movie.original_language?.toUpperCase() ?? ""}",
                                            ),
                                            SizedBox(height: 8),
                                            Text(
                                              "Release Date: ${movie.ReleaseDate ?? ""}",
                                            ),
                                            SizedBox(height: 45),
                                            Center(
                                              child: ElevatedButton(
                                                onPressed: () {
                                                  Navigator.push(
                                                    context,
                                                    MaterialPageRoute(
                                                      builder: (context) => DescPage(movie: movie),
                                                    ),
                                                  );
                                                },
                                                style: ElevatedButton.styleFrom(
                                                  primary: Colors.blue,
                                                  shape: RoundedRectangleBorder(
                                                    borderRadius: BorderRadius.circular(20.0),
                                                  ),
                                                  padding: EdgeInsets.symmetric(
                                                    horizontal: 15.0,
                                                    vertical: 8.0,
                                                  ),
                                                ),
                                                child: Text(
                                                  'Show Detail',
                                                  style: TextStyle(
                                                    fontSize: 14,
                                                    color: Colors.white,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            SizedBox(height: 16),
                          ],
                        );
                      },
                    );
                  } else {
                    return Container();
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
