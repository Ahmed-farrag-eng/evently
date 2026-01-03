import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:evently/models/user_modal.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthServices {
  static Future<UserModal?> login(String email, String password) async {
    try {
      final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      UserModal? user = await _getUserinfo(credential.user!.uid);
      return user;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        print('Wrong password provided for that user.');
      }
    }
    return null;
  }

  static Future<void> registerNewUser(UserModal user, String password) async {
    try {
      final credential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(
            email: user.email,
            password: password,
          );
      user.uid = credential.user!.uid;
      await _addUserInfo(user);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
      }
    } catch (e) {
      print(e);
    }
  }

  static CollectionReference<UserModal> _getUserCollectioin() {
    CollectionReference<UserModal> users = FirebaseFirestore.instance
        .collection('users')
        .withConverter<UserModal>(
          fromFirestore: (snapshot, options) =>
              UserModal.fromJson(snapshot.data()!),
          toFirestore: (value, options) => value.toJson(),
        );
    return users;
  }

  static Future<void> _addUserInfo(UserModal user) async {
    CollectionReference<UserModal> usersCollections = _getUserCollectioin();
    DocumentReference<UserModal> doc = usersCollections.doc(user.uid);
    await doc.set(user);
  }

  static Future<UserModal?> _getUserinfo(String uid) async {
    CollectionReference<UserModal> users = _getUserCollectioin();
    DocumentSnapshot<UserModal> doc = await users.doc(uid).get();
    return doc.data();
  }

  logout() {}
  deleteUser() {}
  updateUser(UserModal user) {}
}
