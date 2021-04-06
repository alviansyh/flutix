part of 'services.dart';

class UserServices {
  static CollectionReference _userCollection = FirebaseFirestore.instance.collection('users');

  static Future<void> updateUser (User user) async {
    String genres = "";

    for (var genre in user.selectedGenres) {
      //ex data : ["Action","Horror","Drama"] => "Action,Horror,Drama"
      genres += genre + ((genre != user.selectedGenres.last) ? ',' : '');
    }

    _userCollection.doc(user.id).set({
      'email': user.email,
      'name': user.name,
      'balance': user.balance,
      'selectedGenres': user.selectedGenres,
      'selectedLanguage': user.selectedLanguage,
      'profilePicture': user.profilePicture ?? ""
    });
  }

  static Future<User> getUser(String id) async {
    DocumentSnapshot snapshot = await _userCollection.doc(id).get();

    return User(id, snapshot.data()['email'],
    balance: snapshot.data()['balance'],
    profilePicture: snapshot.data()['profilePicture'],
    selectedGenres: (snapshot.data()['selectedGenres'] as List)
        .map((e) => e.toString())
        .toList(),
    selectedLanguage: snapshot.data()['selectedLanguage'],
    name: snapshot.data()['name']);
  }
}