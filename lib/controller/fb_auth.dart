import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:twitter_login/twitter_login.dart';

final FirebaseAuth _auth = FirebaseAuth.instance;

class FirebaseService {
  Future<Resource?> signInWithFacebook() async {
    try {
      final LoginResult result = await FacebookAuth.instance.login();
      switch (result.status) {
        case LoginStatus.success:
          final AuthCredential facebookCredential =
              FacebookAuthProvider.credential(result.accessToken!.token);
          final userCredential =
              await _auth.signInWithCredential(facebookCredential);
          return Resource(status: Status.Success);
        case LoginStatus.cancelled:
          return Resource(status: Status.Cancelled);
        case LoginStatus.failed:
          return Resource(status: Status.Error);
        default:
          return null;
      }
    } on FirebaseAuthException catch (e) {
      throw e;
    }
  }

  Future<Resource?> signInWithTwitter() async {
    final twitterLogin = TwitterLogin(
      apiKey: "3GxJfPCAqix9al1EZKCS7SU68",
      apiSecretKey: "AV9gPvGSMEnwPCx07wXr891NeGNseaJS3a0NpJPScdQhI2Uaj9",
      redirectURI: "responsiveloginui://",
    );
    final authResult = await twitterLogin.login();
print('Auth result credenitals  ${authResult.errorMessage.toString()}\n');
    switch (authResult.status) {
      case TwitterLoginStatus.loggedIn:
        final AuthCredential twitterAuthCredential =
            TwitterAuthProvider.credential(
                accessToken: authResult.authToken!,
                secret: authResult.authTokenSecret!);
        print('Twitter auth credenitals  ${twitterAuthCredential.toString()}\n');
        final userCredential =
            await _auth.signInWithCredential(twitterAuthCredential);
            print('Firebase auth credenitals  ${userCredential.toString()}\n');
        return Resource(status: Status.Success);
      case TwitterLoginStatus.cancelledByUser:
        return Resource(status: Status.Success);
      case TwitterLoginStatus.error:
        return Resource(status: Status.Error);
      default:
        return null;
    }
  }

  Future<UserCredential> signInWithGitHub() async {
  // Create a new provider
  GithubAuthProvider githubProvider = GithubAuthProvider();

  return await FirebaseAuth.instance.signInWithProvider(githubProvider);
}

}

class Resource {
  final Status status;
  Resource({required this.status});
}

enum Status { Success, Error, Cancelled }
