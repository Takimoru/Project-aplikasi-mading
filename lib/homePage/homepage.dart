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
          children: const [
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
              onTap: null,
            ),
            ListTile(
              leading: Icon(Icons.person),
              title: Text('Profile'),
              onTap: null,
            ),
            ListTile(
              leading: Icon(Icons.exit_to_app),
              title: Text('Logout'),
              onTap: null,
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
                MaterialPageRoute(builder: (context) =>
                    ContentPage()), // Replace ContentPage with your desired page
              );
            },
            child: Container(
              margin: const EdgeInsets.all(10.0),
              decoration: BoxDecoration(
                color: const Color(0xFFFAF7F7),
                // Background color set to hex FAFAFA
                borderRadius: BorderRadius.circular(10.0),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 2,
                    blurRadius: 5,
                    offset: const Offset(0, 3), // changes position of shadow
                  ),
                ],
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10.0),
                child: Image.asset(
                  'assets/images/suichan.jpg',
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
                imageUrl: 'assets/images/suichaaan.jpg',
                description: 'Diskusi menjaga demokrasi dengan aji balikpapan bahas peran pers mahasiswa.',
                contentPageId: 'info_1', // Unique ID for this content page
              ),
              placeWidget(
                context: context,
                imageUrl: 'assets/images/ayang.jpg',
                description: 'Dosen Universitas Mulia ungkap perilaku belanja online warga Balikpapan.',
                contentPageId: 'info_2', // Unique ID for this content page
              ),
              placeWidget(
                context: context,
                imageUrl: 'assets/images/hoshi.jpg',
                description: 'Kiat dan strategi menulis ala Prof. Ersis Warmansyah Abbas.',
                contentPageId: 'info_3', // Unique ID for this content page
              ),
              placeWidget(

                context: context,
                imageUrl: 'assets/images/suiseihocimachi.jpg',
                description: 'Bangun jiwa entrepreneur, mahasiswa FHK Universitas Mulia ramai bazar Ramadan.',
                contentPageId: 'info_4', // Unique ID for this content page
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
            // Background color set to hex E0DDDD
            borderRadius: BorderRadius.circular(10.0),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 2,
                blurRadius: 5,
                offset: const Offset(0, 3), // changes position of shadow
              ),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SizedBox(
                height: 130,
                child: ClipRRect(
                  borderRadius: const BorderRadius.vertical(
                      top: Radius.circular(8.0)),
                  child: Image.asset(
                    imageUrl,
                    fit: BoxFit.cover,
                    width: double.infinity,
                  ),
                ),
              ),
              const SizedBox(height: 8.0),
              Container(
                height: 60.0, // Adjust the height as needed
                padding: const EdgeInsets.all(8.0),
                child: SingleChildScrollView(
                  child: Center(
                    child: Text(
                      description,
                      textAlign: TextAlign.center,
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