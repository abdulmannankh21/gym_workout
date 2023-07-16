import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
 


class PreferenceController extends GetxController{
  String reps = '';
  String repetitions = '';
  bool isloggedin = false;
@override
  void onInit() {
    // TODO: implement onInit
  getdata();
    super.onInit();

  }

  void getdata() async{
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    isloggedin = prefs.getBool('isLoggedIn') ?? false;
    reps = prefs.getString('reps') ?? '';
    repetitions = prefs.getString('repetitions') ?? '';
    print(reps);
    print(repetitions);
  }
}