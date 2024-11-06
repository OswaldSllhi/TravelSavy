import 'package:flutter/material.dart';
import 'package:travelsavvy/page/home_screen.dart';
import 'terms_and_privacy.dart';
import 'profile.dart';
import 'bottom_nav.dart';

class ProfileDashboard extends StatefulWidget {
  @override
  _ProfileDashboardState createState() => _ProfileDashboardState();
}

class _ProfileDashboardState extends State<ProfileDashboard> {
  void onProfileTap(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => EditProfilePage()),
    );
  }

  void onLanguageTap() {
    print("Bahasa diklik");
  }

  void onAppVersionTap() {
    print("Versi Aplikasi diklik");
  }

  void onTermsTap(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => TermsAndPrivacyPage()),
    );
  }

  void onPolicyTap() {
    print("Policy diklik");
  }

  void onMenuTap(int index) {
    setState(() {
      if (index == 0) {
        Navigator.pushReplacement(
          context,
          PageRouteBuilder(
            pageBuilder: (context, animation, secondaryAnimation) => HomeScreen(),
            transitionsBuilder: (context, animation, secondaryAnimation, child) {
              var begin = Offset(-1.0, 0.0);
              var end = Offset.zero;
              var curve = Curves.ease;
              var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
              return SlideTransition(position: animation.drive(tween), child: child);
            },
          ),
        );
      } else if (index == 3) {
        // Do nothing as we are already on the ProfileDashboard
      } else {
        // Handle other menu actions here if needed
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[800],
      bottomNavigationBar: BottomNavigation(
        selectedIndex: 3,
        onTap: onMenuTap,
      ),
      body: Column(
        children: [
          SizedBox(height: 60),
          CircleAvatar(
            radius: 50,
            backgroundImage: AssetImage('assets/profile_image.png'), // Tambahkan gambar profil di folder assets
          ),
          SizedBox(height: 10),
          Text(
            'Hi, Sabet',
            style: TextStyle(color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 20),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 20),
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Siap untuk petualangan baru hari ini?',
                        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                      ),
                      Text('kami siap menemani perjalananmu'),
                    ],
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 20),
          Expanded(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 20),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                ),
              ),
              child: ListView(
                children: [
                  ListTile(
                    leading: Icon(Icons.person),
                    title: Text("Profil"),
                    trailing: Icon(Icons.arrow_forward_ios),
                    onTap: () {
                      onProfileTap(context);
                    },
                  ),
                  ListTile(
                    leading: Icon(Icons.language),
                    title: Text("Bahasa"),
                    trailing: Icon(Icons.arrow_forward_ios),
                    onTap: onLanguageTap,
                  ),
                  ListTile(
                    leading: Icon(Icons.info),
                    title: Text("Versi Aplikasi"),
                    trailing: Icon(Icons.arrow_forward_ios),
                    onTap: onAppVersionTap,
                  ),
                  ListTile(
                    leading: Icon(Icons.privacy_tip),
                    title: Text("Term and Privacy"),
                    trailing: Icon(Icons.arrow_forward_ios),
                    onTap: () {
                      onTermsTap(context);
                    },
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
