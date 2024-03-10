import 'package:task_app/remote/local/auth_local_service/get_user_data.dart';

class TryAutoLogin {
  Future tryAutoLogin() async {
    final prefs = await GetsUserData.getsUserData();
    if (prefs == null) {
      print("did not got ohhhh");

      return null;
    }
    print(prefs);

    print(prefs['userId']);
    // final extractedUserData = json.decode(prefs) as Map<String, String>;
    final userId = prefs['userId'];
    // if (expiryDate.isBefore(DateTime.now())) {
    //   return false;
    // }
    // String? _token = extractedUserData['token'];
    // String? _userId = extractedUserData['userId'];
    // _expiryDate = expiryDate;
    // _autoLogout();
    return userId;
  }
}
