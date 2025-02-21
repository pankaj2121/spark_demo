import 'package:demo_app/app/strings/app_colors.dart';
import 'package:flutter/material.dart';

class CustomDrawer extends StatelessWidget {
  final String userName;
  final String userEmail;
  final String userImagePath;
  const CustomDrawer({required this.userName, required this.userEmail,required this.userImagePath, super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          UserAccountsDrawerHeader(
            accountName: Text(userName),
            accountEmail: Text(userEmail),
            currentAccountPicture: CircleAvatar(
              backgroundImage: AssetImage(userImagePath),
            ),
            decoration: BoxDecoration(
              color: AppColors.themeColor, // Change the color here
            ),
          ),
          _buildDrawerItem(Icons.home, "Home", 0),
          _buildDrawerItem(Icons.person, "Profile", 1),
          _buildDrawerItem(Icons.settings, "Settings", 2),
          Spacer(),
          _buildDrawerItem(Icons.logout, "Logout", 3),
          SizedBox(height: 20),
        ],
      ),
    );
  }

  Widget _buildDrawerItem(IconData icon, String title, int index) {
    return ListTile(
      leading: Icon(icon),
      title: Text(title),
      onTap: () {},
    );
  }
}
