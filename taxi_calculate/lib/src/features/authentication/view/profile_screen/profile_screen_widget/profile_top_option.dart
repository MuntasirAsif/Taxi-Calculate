import 'dart:io';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import '../../../../../constants/colors.dart';
import '../../../../../constants/image_strings.dart';
import '../../../../../constants/text_strings.dart';
import '../../../../../repository/user_repository/user_repository.dart';
import '../../../model/user_model.dart';

class ProfileTopOption extends StatefulWidget {
  const ProfileTopOption({super.key});

  @override
  _ProfileTopOptionState createState() => _ProfileTopOptionState();
}

class _ProfileTopOptionState extends State<ProfileTopOption> {
  final userRepo = Get.put(UserRepository());
  late Future<UserModel?> userProfileFuture;
  final currentUser = FirebaseAuth.instance.currentUser;
  final ImagePicker _picker = ImagePicker();
  String? _profileImageUrl;

  @override
  void initState() {
    super.initState();
    if (currentUser != null) {
      userProfileFuture = userRepo.getUserDetails(currentUser!.uid);
    } else {
      userProfileFuture = Future.value(null);
    }
  }

  Future<void> _updateProfilePicture() async {
    final pickedFile = await _picker.pickImage(source: ImageSource.gallery,  imageQuality: 85,);
    if (pickedFile != null) {
      File file = File(pickedFile.path);

      // Upload to Firebase Storage
      try {
        final storageRef = FirebaseStorage.instance
            .ref()
            .child('profile_pictures/${currentUser!.uid}.jpg');
        await storageRef.putFile(file);
        String downloadUrl = await storageRef.getDownloadURL();

        // Update Firestore user profile with new image URL
        await userRepo.updateUserProfilePicture(currentUser!.uid, downloadUrl);

        setState(() {
          _profileImageUrl = downloadUrl;
        });
      } on FirebaseException catch (e) {
        if (kDebugMode) {
          print('Error uploading profile picture: ${e.code} - ${e.message}');
        }
      } catch (e) {
        if (kDebugMode) {
          print('Error uploading profile picture: $e');
        }
      }
    }
  }

  @override
  Widget build(BuildContext context) {
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
        _profileImageUrl ??= userData.profileImageUrl;

        return Stack(
          children: [
            Container(
              height: 150,
              decoration: BoxDecoration(
                color: primaryColor,
                borderRadius: BorderRadius.circular(10),
                image: const DecorationImage(
                  image: AssetImage(homeImage,),fit: BoxFit.fill
                )
              ),
            ),
            SizedBox(
              height: 150 + Get.width * 0.30,
            ),
            Positioned(
              top: 110,
              left: Get.width * 0.1,
              child: Stack(
                children: [
                  CircleAvatar(
                    radius: Get.width * 0.125,
                    backgroundImage: _profileImageUrl != null && _profileImageUrl!.isNotEmpty
                        ? NetworkImage(_profileImageUrl!)
                        : AssetImage(personIcon),
                    backgroundColor: secondaryColor,
                  ),
                  Positioned(
                    bottom: 0,
                    right: 0,
                    child: Container(
                      height: 35,
                      width: 35,
                      decoration: BoxDecoration(
                        color: primaryColor,
                        borderRadius: BorderRadius.circular(100),
                        border: Border.all(width: 3),
                      ),
                      child: Center(
                        child: IconButton(
                          onPressed: _updateProfilePicture,
                          icon: const Icon(Icons.camera_alt, size: 15),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Positioned(
              left: Get.width * 0.4,
              top: 155,
              child: SizedBox(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      userData.fullName,
                      style: textTheme.titleLarge,
                    ),
                    Text('$phoneNo ${userData.phoneNo}'),
                    Text('$email: ${userData.email}'),
                  ],
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
