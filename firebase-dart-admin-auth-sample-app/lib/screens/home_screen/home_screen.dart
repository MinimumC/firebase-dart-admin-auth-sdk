import 'package:dart_admin_auth_sample_app/screens/update_profile_screen/update_profile_screen.dart';
import 'package:dart_admin_auth_sample_app/shared/shared.dart';
import 'package:dart_admin_auth_sample_app/utils/extensions.dart';
import 'package:flutter/material.dart';
import 'package:bot_toast/bot_toast.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Test App',
        ),
      ),
      body: SingleChildScrollView(
        padding: 20.horizontal,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            ActionTile(
              onTap: () {},
              title: "Verify Before Update Email",
            ),
            10.vSpace,
            ActionTile(
              onTap: () {
              Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const UpdateProfileScreen()),
            );
              },
              title: "Update Profile",
            ),
            10.vSpace,
            ActionTile(
              onTap: () {},
              title: "Update Password",
            ),
            10.vSpace,
            ActionTile(
              onTap: () {},
              title: "Send Verification Email",
            ),
            10.vSpace,
            ActionTile(
              onTap: () {},
              title: "Send Password Reset Email",
            ),
            10.vSpace,
            ActionTile(
              onTap: () {
                BotToast.showText(text: "Successfully signed out!");
              },
              title: "Sign Out",
            ),
            10.vSpace,
          ],
        ),
      ),
    );
  }
}
