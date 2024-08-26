import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:taxi_calculate/src/features/authentication/view/on_boarding_screen/on_boarding_screen.dart';
import '../../repository/authentication_repository/authentication_repository.dart';

class FadeInAnimationController extends GetXState{

  FadeInAnimationController get find => Get.find();
  late SharedPreferences _prefs;


  RxBool animate = false.obs;
  RxBool animateIcon = false.obs;
  Future startSplashAnimations() async {
    _prefs = await SharedPreferences.getInstance();
    await Future.delayed(const Duration(seconds: 1));
    animate.value = true;
    await Future.delayed(const Duration(seconds: 1));
    animateIcon.value = true;
    await Future.delayed(const Duration(seconds: 3));
    animateIcon.value = false;
    await Future.delayed(const Duration(seconds: 0));
    animate.value = false;
    await Future.delayed(const Duration(seconds: 1));
    bool isFirstTime = _prefs.getBool('isFirstTime') ?? true;
    if (isFirstTime) {
      // Navigate to onboarding screen
      Get.off(OnBoardingScreen());
      _prefs.setBool('isFirstTime', false);
    } else {
      // Navigate to authentication repository or any other screen as needed
      Get.put(AuthenticationRepository());
    }
  }
  Future startAnimations() async{
    await Future.delayed(const Duration(seconds: 1));
    animate.value =true;
  }
}
