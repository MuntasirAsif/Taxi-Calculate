import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:taxi_calculate/src/constants/sizes.dart';
import 'package:taxi_calculate/src/constants/text_strings.dart';
import 'package:taxi_calculate/src/features/authentication/controller/edit_profile_controller.dart';

import '../../../../repository/user_repository/user_repository.dart';
import '../../model/user_model.dart';

class EditProfile extends StatelessWidget {
  const EditProfile({super.key});

  @override
  Widget build(BuildContext context) {
    final userRepo = Get.put(UserRepository());
    late Future<UserModel?> userProfileFuture;
    final currentUser = FirebaseAuth.instance.currentUser;
    if (currentUser != null) {
      userProfileFuture = userRepo.getUserDetails(currentUser.uid);
    } else {
      userProfileFuture = Future.value(null);
    }
    final controller = Get.put(EditProfileController());
    final textTheme = Theme.of(context).textTheme;
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
        controller.email.text=userData.email;
        controller.fullName.text=userData.fullName;
        controller.phoneNo.text=userData.phoneNo;
        return SafeArea(
          child: Scaffold(
            body: SingleChildScrollView(
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: defaultPadding * 2),
                child: Column(
                  children: [
                    SizedBox(
                      height: Get.height * .02,
                    ),
                    Text(
                      editProfile,
                      style: textTheme.headlineLarge!
                          .copyWith(fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: Get.height * .2,
                    ),
                    TextFormField(
                      controller: controller.fullName,
                      decoration: const InputDecoration(
                          hintText: 'Name', labelText: 'Name'),
                    ),
                    SizedBox(
                      height: Get.height * .02,
                    ),
                    TextFormField(
                      controller: controller.phoneNo,
                      decoration: const InputDecoration(
                          hintText: 'Phone Number', labelText: 'Phone Number'),
                    ),
                    SizedBox(
                      height: Get.height * .05,
                    ),
                    SizedBox(
                        height: Get.height * 0.06,
                        width: double.infinity,
                        child: ElevatedButton(
                            onPressed: () {
                              final user = UserModel(
                                  fullName: controller.fullName.text.trim(),
                                  email: controller.email.text.trim(),
                                  phoneNo: controller.phoneNo.text.trim(),
                                  profileImageUrl: userData.profileImageUrl,
                                password: userData.password,
                              );
                              EditProfileController.instance.updateUser(user);
                            },
                            child: Text(
                              'Save',
                              style: textTheme.titleMedium!
                                  .copyWith(fontWeight: FontWeight.bold),
                            )))
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
