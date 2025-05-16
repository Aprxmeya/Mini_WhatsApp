import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
    //instance of the auth
      final FirebaseAuth _auth = FirebaseAuth.instance;

      // store recent logged user
      final FirebaseFirestore _firestore = FirebaseFirestore.instance;

      User? getCurrentuser(){
        return _auth.currentUser;
      }

    //sign in
      Future<UserCredential> signinwithemailpassword (String email, password) async {
        try{
          UserCredential userCredential = await _auth.signInWithEmailAndPassword(
              email: email,
              password: password
          );

          _firestore.collection("Users").doc(userCredential.user !.uid).set(
              {
                'uid' : userCredential.user!.uid,
                'email':email,
              }
          );

          return userCredential;
        } on FirebaseAuthException catch(e){
          throw Exception(e.code);
        }
      }
  //sign up
      Future<UserCredential> signupwithemailpassword (String email, password) async{
        try{
          UserCredential userCredential = await _auth.createUserWithEmailAndPassword(
              email: email,
              password: password,
          );

          _firestore.collection("Users").doc(userCredential.user !.uid).set(
            {
              'uid' : userCredential.user!.uid,
              'email':email,
            }
          );

          return userCredential;
        }on FirebaseAuthException catch(e){
          throw Exception(e.code);

        }
      }

  //sign out
      Future<void> signout() async{
        return _auth.signOut();
      }
  //errors


}