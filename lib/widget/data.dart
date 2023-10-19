class Data {
  String title;
  String description;
  String imagePath;
  String rating;
  String update;
  String genre;
  String episode;

  Data({
    required this.title,
    required this.description,
    required this.imagePath,
    required this.rating,
    required this.update,
    required this.genre,
    required this.episode,
  });
}

List<Data> dataList = [
  Data(
    title: 'Soul Land',
    genre: 'Romance',
    description: 'Donghua Soul Land adalah kisah petualangan Tang San, seorang murid dari Sekte Tang, yang mengungkap rahasia kekuatan dalam jiwa manusia. Bersama dengan teman-temannya, dia menjalani pelatihan keras dan berjuang melawan kekuatan jahat untuk menjaga keseimbangan dunia spiritual. Dengan bakat luar biasa dan semangat juangnya, Tang San mencari keadilan dan perdamaian dalam dunia roh yang penuh misteri', // Replace with your actual description
    imagePath: 'assets/images/soulland.jpg',
    rating: '4.8',
    update: 'Complete',
    episode: 'Complete'
  ),

  Data(
    title: 'Legend of Exorcism',
    genre: 'Magic',
    description: 'Legend of Exorcism adalah sebuah donghua (animasi Tiongkok) yang mengikuti kisah seorang tokoh utama bernama Li Xiu, seorang eksorsis muda yang memiliki kemampuan luar biasa dalam mengusir roh jahat dan makhluk gaib. Cerita ini berlatar belakang dunia di mana manusia hidup berdampingan dengan roh dan makhluk supernatural. Li Xiu, dengan bantuan teman-temannya, berusaha untuk menjaga kedamaian dunia manusia dengan mengusir roh jahat yang mengganggu. Manhua ini menawarkan campuran antara elemen supernatural, aksi, dan petualangan, sambil menggali konflik-konflik antara dunia manusia dan dunia gaib.', // Replace with your actual description
    imagePath: 'assets/images/legend.jpg',
    rating: '4.5',
    update: 'Update Setiap Hari Senin',
    episode: 'Ongoing'
  ),

  Data(
    title: 'Battle Through of Heaven',
    genre: 'Fantasy',
    description: 'Legend of Exorcism adalah sebuah donghua (animasi Tiongkok) yang mengikuti kisah seorang tokoh utama bernama Li Xiu, seorang eksorsis muda yang memiliki kemampuan luar biasa dalam mengusir roh jahat dan makhluk gaib. Cerita ini berlatar belakang dunia di mana manusia hidup berdampingan dengan roh dan makhluk supernatural. Li Xiu, dengan bantuan teman-temannya, berusaha untuk menjaga kedamaian dunia manusia dengan mengusir roh jahat yang mengganggu. Manhua ini menawarkan campuran antara elemen supernatural, aksi, dan petualangan, sambil menggali konflik-konflik antara dunia manusia dan dunia gaib.', // Replace with your actual description
    imagePath: 'assets/images/btth.jpg',
    rating: '4.5',
    update: 'Update Setiap Hari Kamis',
    episode: 'Ongoing'
  ),




];