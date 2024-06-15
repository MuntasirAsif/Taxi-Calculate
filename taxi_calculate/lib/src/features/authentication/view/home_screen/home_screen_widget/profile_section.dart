import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:taxi_calculate/src/constants/colors.dart';
import '../../../../../constants/image_strings.dart';
import '../../../../../constants/text_strings.dart';
import '../../../../../repository/user_repository/user_repository.dart';
import '../../../model/user_model.dart';

class ProfileSection extends StatelessWidget {
  const ProfileSection({
    super.key,
    required this.textTheme,
  });

  final TextTheme textTheme;

  @override
  Widget build(BuildContext context) {
    String? _profileImageUrl;
    final userRepo = Get.put(UserRepository());
    late Future<UserModel?> userProfileFuture;
    final currentUser = FirebaseAuth.instance.currentUser;
    if (currentUser != null) {
      userProfileFuture = userRepo.getUserDetails(currentUser.uid);
    } else {
      userProfileFuture = Future.value(null);
    }
    final isDark = Get.isDarkMode;
    return FutureBuilder<UserModel?>(
      future: userProfileFuture,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        }

        if (snapshot.hasError) {
          return Center(child: Text('Error: ${snapshot.error}'));
        }

        if (!snapshot.hasData || snapshot.data == null) {
          return const Center(child: Text('User not found'));
        }

        UserModel userData = snapshot.data!;
        _profileImageUrl ??= userData.profileImageUrl;
        return Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: Get.width * 0.12,
              width: Get.width * 0.12,
              child: CircleAvatar(
                radius: Get.width * 0.12,
                backgroundImage: _profileImageUrl != null && _profileImageUrl!.isNotEmpty
                    ? NetworkImage(_profileImageUrl!)
                    : const AssetImage(personIcon),
                backgroundColor: secondaryColor,
              ),
            ),
            SizedBox(
              width: Get.width * 0.03,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  hello,
                  style: textTheme.titleSmall,
                ),
                Text(
                  userData.fullName,
                  style: textTheme.titleMedium,
                )
              ],
            ),
          ],
        );
      },
    );
  }
}
