import 'package:flutter/material.dart';
import 'package:taxi_calculate/src/features/authentication/view/profile_screen/profile_screen_widget/profile_bottom_options.dart';
import 'package:taxi_calculate/src/features/authentication/view/profile_screen/profile_screen_widget/profile_top_option.dart';

import '../home_screen/home_screen_widget/banner_add.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});
  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              ProfileTopOption(),
              ProfileBottomOptions(),
              BannerAddWidget(),
            ],
          ),
        ),
      ),
    );
  }
}
