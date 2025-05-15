import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
    //instance of the auth
      final FirebaseAuth _auth = FirebaseAuth.instance;

    //sign in
      Future<UserCredential> signinwithemailpassword (String email, password) async {
        try{
          UserCredential userCredential = await _auth.signInWithEmailAndPassword(
              email: email,
              password: password
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