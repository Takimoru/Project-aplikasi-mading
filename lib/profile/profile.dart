import 'package:flutter/material.dart';

class ProfilePages extends StatelessWidget {
  const ProfilePages({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: ListView(
          children: [
            ProfileRow(
              profilePhoto: 'assets/profile_photo_1.jpg',
              name: 'John Doe',
              description:
              'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer nec odio. Praesent libero. Sed cursus ante dapibus diam.',
            ),
            SizedBox(height: 20),
            ProfileRow(
              profilePhoto: 'assets/profile_photo_2.jpg',
              name: 'Jane Doe',
              description:
              'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer nec odio. Praesent libero. Sed cursus ante dapibus diam.',
            ),
          ],
        ),
      ),
    );
  }
}

class ProfileRow extends StatelessWidget {
  final String profilePhoto;
  final String name;
  final String description;

  const ProfileRow({
    required this.profilePhoto,
    required this.name,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          height: 150,
          width: 150,
          child: CircleAvatar(
            backgroundImage: AssetImage(profilePhoto),
          ),
        ),
        SizedBox(width: 20),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                name,
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),
              Text(
                description,
                style: TextStyle(fontSize: 16),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
