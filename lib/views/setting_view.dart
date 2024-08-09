import 'package:flutter/material.dart';

class SettingView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                CircleAvatar(
                  radius: 30,
                  backgroundImage: AssetImage(
                      'assets/profile.jpg'), // Replace with your profile image path
                ),
                SizedBox(width: 15),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Jisoo',
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 5),
                      ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Color(0xFFF4B6FC),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                        ),
                        child: Text('Edit Profile'),
                      ),
                    ],
                  ),
                ),
                IconButton(
                  icon: Image.asset(
                    'assets/images/close icon.png', // Replace with the actual path to your image
                    width: 24, // Adjust size as needed
                    height: 24,
                  ),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
              ],
            ),
            SizedBox(height: 30),
            Expanded(
              child: ListView(
                children: [
                  _buildMenuItem(
                    context,
                    icon: Icons.wifi_off_outlined,
                    title: 'Offline Mode',
                    onTap: () {},
                  ),
                  _buildMenuItem(
                    context,
                    icon: Icons.star_border,
                    title: 'Give Rating',
                    onTap: () {},
                  ),
                  _buildMenuItem(
                    context,
                    icon: Icons.help_outline,
                    title: 'Help and Support',
                    onTap: () {},
                  ),
                  _buildMenuItem(
                    context,
                    icon: Icons.feedback_outlined,
                    title: 'Send Feedback',
                    onTap: () {},
                  ),
                  _buildMenuItem(
                    context,
                    icon: Icons.share_outlined,
                    title: 'Share App',
                    onTap: () {},
                  ),
                  _buildMenuItem(
                    context,
                    icon: Icons.logout,
                    title: 'Log Out',
                    onTap: () {},
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildMenuItem(BuildContext context,
      {required IconData icon,
      required String title,
      required VoidCallback onTap}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/kolom2.png'),
            fit: BoxFit.cover,
          ),
          borderRadius: BorderRadius.circular(10),
        ),
        child: ListTile(
          leading: Icon(icon),
          title: Text(title),
          onTap: onTap,
        ),
      ),
    );
  }
}
