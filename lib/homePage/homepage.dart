import 'package:flutter/material.dart';
import 'package:revuemurale/profile/profile.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:revuemurale/loginPage/login page.dart';
import 'package:revuemurale/contenPage/contentPage.dart';
import 'package:revuemurale/contenPage/contentPage1.dart';
import 'package:revuemurale/contenPage/contentPage2.dart';
import 'package:revuemurale/contenPage/contentPage3.dart';
import 'package:revuemurale/contenPage/contentPage4.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 0;

  final List<Widget> _children = const [
    HomePageContent(),
    ProfilePages(),
    HomePage(),
  ];

  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  void _logout(BuildContext context) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool('isLoggedIn', false);
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => const LoginPage()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Padding(
            padding: EdgeInsets.only(top: 16.0),
            child: Text(
              'RevueMurale',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
        ),
        leading: Builder(
          builder: (context) => IconButton(
            icon: const Icon(Icons.menu),
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
            const DrawerHeader(
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
              leading: const Icon(Icons.home),
              title: const Text('Home'),
              onTap: () {
                Navigator.pop(context); // Close the drawer
                onTabTapped(0); // Switch to Home tab
              },
            ),
            ListTile(
              leading: const Icon(Icons.person),
              title: const Text('Profile'),
              onTap: () {
                Navigator.pop(context); // Close the drawer
                onTabTapped(1); // Switch to Profile tab
              },
            ),
            ListTile(
              leading: const Icon(Icons.exit_to_app),
              title: const Text('Logout'),
              onTap: () {
                Navigator.pop(context); // Close the drawer
                _logout(context); // Logout the user
              },
            ),
          ],
        ),
      ),
      body: _children[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        onTap: onTabTapped,
        currentIndex: _currentIndex,
        items: const [
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

class HomePageContent extends StatelessWidget {
  const HomePageContent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ContentPage()), // Replace ContentPage with your desired page
              );
            },
            child: Container(
              margin: const EdgeInsets.all(10.0),
              decoration: BoxDecoration(
                color: const Color(0xFFFAF7F7),
                borderRadius: BorderRadius.circular(10.0),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 2,
                    blurRadius: 5,
                    offset: const Offset(0, 3),
                  ),
                ],
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10.0),
                child: Image.asset(
                  'assets/images/um6.jpg',
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.all(10.0),
            child: Text(
              'Kabar Hari Ini',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
          GridView.count(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            crossAxisCount: 2,
            children: [
              placeWidget(
                context: context,
                imageUrl: 'assets/images/um 2.jpeg',
                description: 'SOSIALISASI MSIB BATCH 7: KIAT SUKSES PROGRAM MERDEKA BELAJAR KAMPUS MERDEKA',
                contentPageId: 'info_1',
              ),
              placeWidget(
                context: context,
                imageUrl: 'assets/images/um1.jpg',
                description: 'KATA DOSEN UNIVERSITAS MULIA, POLA PIKIR MENENTUKAN KEBERHASILAN WIRAUSAHA',
                contentPageId: 'info_2',
              ),
              placeWidget(
                context: context,
                imageUrl: 'assets/images/um3.jpg',
                description: 'SELAMAT! TIM UNIVERSITAS MULIA JUARA STAND TERBAIK PAMERAN KEWIRAUSAHAAN PEMUDA BALIKPAPAN',
                contentPageId: 'info_3',
              ),
              placeWidget(
                context: context,
                imageUrl: 'assets/images/um4.jpg',
                description: 'DISKUSI MENJAGA DEMOKRASI DENGAN AJI BALIKPAPAN BAHAS PERAN PERS MAHASISWA',
                contentPageId: 'info_4',
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget placeWidget({
    required BuildContext context,
    required String imageUrl,
    required String description,
    required String contentPageId,
  }) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: GestureDetector(
        onTap: () {
          // Navigate to different content pages based on the contentPageId
          switch (contentPageId) {
            case 'info_1':
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ContentPage1()),
              );
              break;
            case 'info_2':
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ContentPage2()),
              );
              break;
            case 'info_3':
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ContentPage3()),
              );
              break;
            case 'info_4':
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ContentPage4()),
              );
              break;
            default:
              break;
          }
        },
        child: Container(
          decoration: BoxDecoration(
            color: const Color(0xFFE0DDDD),
            borderRadius: BorderRadius.circular(10.0),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 2,
                blurRadius: 5,
                offset: const Offset(0, 3),
              ),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SizedBox(
                height: 130,
                child: ClipRRect(
                  borderRadius: const BorderRadius.vertical(top: Radius.circular(8.0)),
                  child: Image.asset(
                    imageUrl,
                    fit: BoxFit.cover,
                    width: double.infinity,
                  ),
                ),
              ),
              const SizedBox(height: 8.0),
              Expanded( // Make the description text expandable
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SingleChildScrollView( // Add scrolling capability to the text
                    child: Center(
                      child: Text(
                        description,
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          fontSize: 14,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
