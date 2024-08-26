import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:taxi_calculate/src/features/authentication/view/bottom_bar/bottom_bar.dart';
import 'package:taxi_calculate/src/features/authentication/view/welcome_screen/welcome_screen.dart';
import 'package:taxi_calculate/src/repository/authentication_repository/exceptions/signup_email_password_failure.dart';

class AuthenticationRepository extends GetxController {
  static AuthenticationRepository get instance => Get.find();

  //variables
  final _auth = FirebaseAuth.instance;
  late final Rx<User?> firebaseUser;
  var verificationId= ''.obs;

  @override
  void onReady() {
    // TODO: implement onReady
    Future.delayed(const Duration(seconds: 6));
    firebaseUser = Rx<User?>(_auth.currentUser);
    firebaseUser.bindStream(_auth.userChanges());
    ever(firebaseUser, _initialScreen);
  }

  _initialScreen(User? user) {
    user == null
        ? Get.to(() => const WelcomeScreen())
        : Get.to(() => const BottomBar());
  }

  Future<void> phoneAuthentication(String phoneNo) async {
    await _auth.verifyPhoneNumber(
        phoneNumber: phoneNo,
        verificationCompleted: (credential) async {
          await _auth.signInWithCredential(credential);
        },
        codeSent: (verificationId, resendToken) {
          this.verificationId.value = verificationId;
        },
        codeAutoRetrievalTimeout: (verificationId) {
          this.verificationId.value = verificationId;
        },
        verificationFailed: (e) {
          if(e.code == 'invalid-phone-number'){
            Get.snackbar('Error', 'The provided phone number is invalid.');
          }else{
            Get.snackbar('Error', e.message.toString());
          }
        },
    );
  }

  Future<bool> verifyOTP(String otp) async {
    var credentials =await _auth.signInWithCredential(PhoneAuthProvider.credential(verificationId: verificationId.value, smsCode: otp));
    return credentials.user!=null?true:false;
  }

  Future<void> createUserWithEmailAndPassword(
      String email, String password) async {
    try {
      await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      firebaseUser.value != null
          ? Get.to(() => const BottomBar())
          : Get.to(() => const WelcomeScreen());
    } on FirebaseAuthException catch (e) {
      final ex = SignupEmailPasswordFailure.code(e.code);
      print('FIREBASE AUTH EXCEPTIONS -${ex.message}');
      throw ex;
    } catch (_) {
      final ex = SignupEmailPasswordFailure();
      print('FIREBASE AUTH EXCEPTIONS -${ex.message}');
      throw ex;
    }
  }

  Future<void> loginUserWithEmailAndPassword(
      String email, String password) async {
    try {
      await _auth.signInWithEmailAndPassword(email: email, password: password);
    } on FirebaseAuthException catch (e) {
      Get.snackbar('Error', e.message.toString());
    } catch (error) {
      Get.snackbar('Error', error.toString());
    }
  }

  Future<void> logOut() async => _auth.signOut();
}
