import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ForgotPasswordPage extends StatefulWidget {
  const ForgotPasswordPage({Key? key}) : super(key: key);
  static final String id = 'forgot_password_page';
  @override
  State<ForgotPasswordPage> createState() => _ForgotPasswordPageState();
}

class _ForgotPasswordPageState extends State<ForgotPasswordPage> {

  final _emailControl = TextEditingController();

  @override
  void dispose(){
    _emailControl.dispose();
    super.dispose();
  }

  Future resetPassword()async{
    try{
      await FirebaseAuth.instance
          .sendPasswordResetEmail(email: _emailControl.text.trim());
      showDialog(context: context, builder: (context){
        return AlertDialog(
          content: Text('Password reset link sent! check your email!'),
        );
      });
    }on FirebaseAuthException catch(e){
      print(e);
      showDialog(context: context, builder: (context){
        return AlertDialog(
          content: Text(e.message.toString()),
        );
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.red.shade50,
      appBar: AppBar(
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Enter your email and we will send you a password reset link',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 20),),
            SizedBox(height: 15,),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 15),
              decoration: BoxDecoration(
                color: Colors.grey.shade100,
                border: Border.all(color: Colors.white),
                borderRadius: BorderRadius.circular(12),
              ),
              child: TextField(
                onTap: resetPassword,
                decoration: InputDecoration(
                  hintText: 'Email',
                  border: InputBorder.none,
                  hintStyle: TextStyle(
                    color: Colors.grey
                  )
                ),
              ),
            ),
            SizedBox(height: 15),
            MaterialButton(onPressed: resetPassword,
              color: Colors.red.shade700,
              child: Text('Reset Paassword',
              style: TextStyle(color: Colors.red.shade50),),
            ),
        ],
        ),
      ),
    );
  }
}
