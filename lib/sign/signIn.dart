import 'package:cakeland/sign/forgtotPWpage.dart';
import 'package:cakeland/sign/signUp.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SignIn extends StatefulWidget {
 // final VoidCallback showSignUpPage;
  const SignIn({Key? key}) : super(key: key);
  static final String id = 'signIn';
  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  Future doSignIn()async{
    await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: _emailController.text.trim(),
        password: _passwordController.text.trim());
    // if(await FirebaseAuth.instance.currentUser == null){
    //   print('null');
    //   Toast.show('Try again, wrong login!',
    //   gravity: 1,backgroundColor: Colors.red.shade700,
    //     textStyle: TextStyle(color: Colors.red.shade50),
    //     duration: 1
    //   );
    // }
  }

  @override
  void dispose(){
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.red.shade50,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(child: Container(
                height: 150,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                ),
                  child: ClipOval(child: const Image(
                      image: AssetImage('assets/images/cake_logo.png'))))),
              SizedBox(height: 20,),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('welcome to',style: GoogleFonts.
                    ubuntu(fontSize: 22,
                  color: Colors.red.shade700,
                  fontWeight: FontWeight.bold),),
                  SizedBox(width: 10,),
                  Text('Cake Land',style: GoogleFonts.
                  kolkerBrush(fontSize: 70,
                      color: Colors.red.shade800,
                      fontWeight: FontWeight.bold),),
                ],
              ),
              SizedBox(height: 20,),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 15),
                decoration: BoxDecoration(
                  color: Colors.grey.shade100,
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: Colors.white)
                ),
                child: TextField(
                  controller: _emailController,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: 'Email',
                    hintStyle: TextStyle(
                      color: Colors.grey
                    )
                  ),
                ),
              ),
              SizedBox(height: 15,),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 15),
                decoration: BoxDecoration(
                    color: Colors.grey.shade100,
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(color: Colors.white)
                ),
                child: TextField(
                  obscureText: true,
                  controller: _passwordController,
                  decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: 'Password',
                      hintStyle: TextStyle(
                          color: Colors.grey
                      )
                  ),
                ),
              ),
              SizedBox(height: 15,),
              Row(mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  GestureDetector(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context){
                        return ForgotPasswordPage();
                      }));
                    },
                    child: Text('Forgot Password',
                      style: GoogleFonts.ubuntu(
                      fontWeight: FontWeight.bold,
                      color: Colors.red.shade700
                    ),),
                  ),
                ],
              ),
              SizedBox(height: 15,),
              GestureDetector(
                onTap: (){
                  doSignIn();
                },
                child: Container(height: 50,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    color: Colors.red.shade700,
                    borderRadius: BorderRadius.circular(12),
                  ),
                    child: Center(
                      child: Text('Sign In',
                      style: GoogleFonts.ubuntu(
                        color: Colors.red.shade50,
                        fontWeight: FontWeight.bold,
                        fontSize: 18
                      ),),
                    ),
                  ),
              ),
              SizedBox(height: 15,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                //crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text('Not a member?',style:
                    GoogleFonts.ubuntu(
                      fontWeight: FontWeight.bold,
                      color: Colors.grey
                    ),),
                  SizedBox(width: 10,),
                  GestureDetector(
                    onTap: (){
                      Navigator.pushReplacementNamed(context, SignUp.id);
                    },
                    child: Text('Register now',style:
                    GoogleFonts.ubuntu(
                        fontWeight: FontWeight.bold,
                        color: Colors.red.shade700
                    ),),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
