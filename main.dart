import 'package:throneapp/models/User.dart';
import 'package:throneapp/service/api.dart';

void main() async {
  final api = Api();


  try {
    await api.loginWithEmail("johndoe@example.com", "securepassword");
    await api.getLoggedInformation();
    // await api.loggout();
    print('User logged successfully');
  } catch (e) {
    print('loggin failed: $e');
  }
}
