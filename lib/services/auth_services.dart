part of 'services.dart';

class AuthServices {
  static auth.FirebaseAuth _auth = auth.FirebaseAuth.instance;

  static Future<FetchResult> signUp(String email, String password, String name,
      List<String> selectedGenres, String selectedLanguage) async {
    try {

      auth.UserCredential result = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);

      User user = result.user.convertToUser(
          name: name,
          selectedGenres: selectedGenres,
          selectedLanguage: selectedLanguage);

      await UserServices.updateUser(user);

      return FetchResult(user: user);
    } catch (e) {
      return FetchResult(message: e.toString().split(',')[1].trim());
    }
  }

  static Future<FetchResult> signIn(String email, String password) async {
    try {
      auth.UserCredential result = await _auth.signInWithEmailAndPassword(
          email: email, password: password);

      User user = await result.user.fromFireStore();

      return FetchResult(user: user);
    } catch (e) {
      return FetchResult(message: e.toString().split(',')[1].trim());
    }
  }

  //Handle User has Sign Up or Sign In or Sign Out
  static Stream<auth.User> get userStream => _auth.authStateChanges();

  static Future<FetchResult> signOut() async {
    await _auth.signOut();
  }
}

class FetchResult {
  final User user;
  final String message;

  FetchResult({this.user, this.message});
}
