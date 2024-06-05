import 'package:flutter/material.dart';
import 'package:revuemurale/homepage/homepage.dart';
import 'package:revuemurale/loginPage/login%20page.dart';
import 'package:revuemurale/profile/profile.dart';
import 'package:shared_preferences/shared_preferences.dart';


class ContentPage1 extends StatefulWidget {
  @override
  _ContentPage1State createState() => _ContentPage1State();
}

class _ContentPage1State extends State<ContentPage1> {
  int _currentIndex = 0;

  final List<Widget> _children = [
    ContentDetailPage(
      imageAsset: 'assets/images/um 2.jpeg', // replace with your actual asset path
      title: 'SOSIALISASI MSIB BATCH 7: KIAT SUKSES PROGRAM MERDEKA BELAJAR KAMPUS MERDEKA',
      description: 'Dalam Rangka meningkatkan minat mahasiswa dalam program MBKM Kampus Meredeka telah dilaksanakan sosialisasi program Magang dan Studi Independen Bersertifikat (MSIB) Batch 7 secara online  31, Mei 2024. Acara ini dihadiri oleh sekitar 70 mahasiswa dari berbagai program studi, menunjukkan minat yang besar dalam program Merdeka Belajar Kampus Merdeka.\n\n'
              'Kegiatan ini dihadiri oleh Wakil Rektor Bidang Akademik dan Sistem Informasi bapak Wisnu Hera Pamungkas, S.Tp., M.Eng. sebagai Pemateri pertama, , beliau memaparkan secara komprehensif tentang program Merdeka Belajar Kampus Merdeka. Beliau menjelaskan berbagai program yang dapat diikuti mahasiswa, termasuk magang, studi independen, dan pertukaran mahasiswa. Penjelasan ini diharapkan dapat membuka wawasan mahasiswa mengenai peluang yang tersedia untuk mengembangkan kompetensi dan pengalaman mereka di luar lingkungan kampus.'
    ),
    ProfilePages(), // Ensure this widget is properly defined
  ];

  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  void _logout() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool('isLoggedIn', false);
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => LoginPage()), // Ensure this widget is properly defined
    );
  }

  void _navigateToHomePage() {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => HomePage()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Padding(
            padding: const EdgeInsets.only(top: 16.0),
            child: Text(
              'RevueMurale',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
        ),
        leading: Builder(
          builder: (context) => IconButton(
            icon: Icon(Icons.menu),
            onPressed: () {
              Scaffold.of(context).openDrawer();
            },
          ),
        ),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Text(
                'Menu',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
            ),
            ListTile(
              leading: Icon(Icons.home),
              title: Text('Home'),
              onTap: () {
                Navigator.pop(context); // Close the drawer
                _navigateToHomePage();
              },
            ),
            ListTile(
              leading: Icon(Icons.person),
              title: Text('Profile'),
              onTap: () {
                setState(() {
                  _currentIndex = 1;
                });
                Navigator.pop(context); // Close the drawer
              },
            ),
            ListTile(
              leading: Icon(Icons.exit_to_app),
              title: Text('Logout'),
              onTap: _logout,
            ),
          ],
        ),
      ),
      body: _children[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        onTap: onTabTapped,
        currentIndex: _currentIndex,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}

class ContentDetailPage extends StatelessWidget {
  final String imageAsset;
  final String title;
  final String description;

  ContentDetailPage({required this.imageAsset, required this.title, required this.description});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(imageAsset),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                title,
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Text(
                description,
                style: TextStyle(fontSize: 16),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
