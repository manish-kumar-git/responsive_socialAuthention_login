import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:responsive_login_ui/views/storyTime.dart';


  class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}
  final GoogleSignIn _googleSignIn = GoogleSignIn();


void signOutGoogle() async{
  await _googleSignIn.signOut().catchError((e) => print(e)).whenComplete(() => print("User Sign Out"));
  
}
class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
     body: Padding(
       padding: const EdgeInsets.all(48.0),
       child: Column(
         mainAxisSize: MainAxisSize.min,
         children: <Widget>[
           const Center(
             child: Text(
               'Welcome User',
               style: TextStyle(
                   fontSize: 25,
                   fontWeight: FontWeight.bold,
                   color: Colors.black54),
             ),
           ),
           const SizedBox(height: 40),
           GestureDetector(
            onTap: ()=>Navigator.push(context, MaterialPageRoute(builder: (context)=>StoryPoint())),
             child: Container(
              width: 100,
              height: 100,
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(100),color: Colors.cyanAccent),
             ),
           ),
           Image.asset("assets/girl.jpg",scale: 5,),
           const SizedBox(height: 40),
           MaterialButton(
             onPressed: () async {
               // var userCredential = await FirebaseAuth.instance.currentUser;
               //         print(userCredential);
               //         userCredential!.delete().then((value) => print('Successs'));
               signOutGoogle();
               Navigator.pop(context);
             },
             color: Colors.black,
             elevation: 5,
             shape: RoundedRectangleBorder(
                 borderRadius: BorderRadius.circular(40)),
             child: const Padding(
               padding: EdgeInsets.all(8.0),
               child: Text(
                 'Sign Out',
                 style: TextStyle(fontSize: 25, color: Colors.white),
               ),
             ),
           )
         ],
       ),
     ),
    );
  }
}