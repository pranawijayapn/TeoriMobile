import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:mobile/pages/login.dart';
import 'package:mobile/pages/desc_page.dart';
import 'package:mobile/widget/data.dart';
import 'package:mobile/widget/category.dart';
import 'package:mobile/models/movie.dart';
import 'package:mobile/http_service.dart';
import 'package:mobile/pages/welcomescreen.dart';
import 'package:mobile/pages/main_page.dart';

class MainPageMovie extends StatefulWidget {
  const MainPageMovie({Key? key});

  @override
  State<MainPageMovie> createState() => _MainPageMovieState();
}

class _MainPageMovieState extends State<MainPageMovie> {
  final _auth = FirebaseAuth.instance;
  final HttpService httpService = HttpService();
  String searchQuery = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
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
                                      image:
                                          AssetImage('assets/images/logo1.jpg'),
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
                                  'FilmFlix',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize:
                                        32, // Sesuaikan ukuran font sesuai keinginan
                                    fontWeight:
                                        FontWeight.bold, // Atur ketebalan font
                                    fontFamily:
                                        'YourDesiredFont', // Ganti 'YourDesiredFont' dengan nama font yang diinginkan
                                  ),
                                  textAlign: TextAlign
                                      .center, // Agar teks berada di tengah
                                ),
                              ],
                            ),
                            Container(
                              alignment: Alignment.topRight,
                              child: InkWell(
                                onTap: () {
                                  _auth.signOut();
                                  // Perubahan: Menggunakan pushReplacement agar dapat kembali ke LoginPage
                                  Navigator.pushReplacement(
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
                  'Movie',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
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

                    return ListView.builder(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: movies.length,
                      itemBuilder: (context, index) {
                        Movie movie = movies[index];
                        if (movie.title
                                ?.toLowerCase()
                                .contains(searchQuery.toLowerCase()) ??
                            false) {
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
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                        width:
                                            150, // Atur lebar gambar sesuai kebutuhan
                                        child: Image.network(
                                          "https://www.themoviedb.org/t/p/w220_and_h330_face${movie.posterPath}" ??
                                              "",
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                      Expanded(
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
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
                                                        builder: (context) =>
                                                            DescPage(
                                                                movie: movie),
                                                      ),
                                                    );
                                                  },
                                                  style:
                                                      ElevatedButton.styleFrom(
                                                    primary: Colors.blue,
                                                    shape:
                                                        RoundedRectangleBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              20.0),
                                                    ),
                                                    padding:
                                                        EdgeInsets.symmetric(
                                                            horizontal: 15.0,
                                                            vertical: 8.0),
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
                        } else {
                          return Container();
                        }
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
