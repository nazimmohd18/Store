import 'package:flutter/material.dart';
import '../Utils/Colors.dart';
import 'SignUpScreen.dart';
import '../Screens/HomePage.dart';
import 'package:firebase_auth/firebase_auth.dart';
class LoginScreen extends StatefulWidget {
  static const routeName = 'Login';

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  final _emailFocusNode = FocusNode();
  final _passwordFocusNode = FocusNode();

  String _emailErrorText;
  String _passwordErrorText;

  bool _passwordVisible;

  final _auth = FirebaseAuth.instance;
  String email;
  String password;

  @override
  void dispose() {
    super.dispose();
    _passwordFocusNode.dispose();
  }

  @override
  void initState() {
    _passwordVisible = false;
    super.initState();
  }

  Future<void> _submit() async {
    try {
      _formKey.currentState.save();
      if (!_formKey.currentState.validate()) {
        return;
      }
      // Navigator.of(context).pushReplacementNamed(HomeScreen.routeName);
      //   print(awaitingAuth);
      //   if (awaitingAuth) {
      //     Navigator.of(context).pushReplacementNamed(NavigationScreen.routeName);

      //   }
    } catch (e) {
      print(e);
      //  Scaffold.of(context).showSnackBar(SnackBar(
      //   backgroundColor: Colors.red,
      //   content: Text(e.toString()),
      // ));
    }
  }

  void goToSignUpScreen(BuildContext context) {
    Navigator.of(context).pushNamed(SignUpScreen.routeName);
  }

  void goToHomePage(BuildContext context) {
    Navigator.of(context).pushNamed(HomePage.routeName);
  }

  @override
  Widget build(BuildContext context) {
    final deviceHeight = MediaQuery.of(context).size.height;
    final deviceWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      key: _formKey,
      resizeToAvoidBottomInset: false,
      body: SingleChildScrollView(
        child: Container(
          width: deviceHeight,
          height: deviceHeight,
          padding: EdgeInsets.all(deviceWidth* .05),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(child: Text('STORE',style: TextStyle(fontSize: 28,fontWeight: FontWeight.w600,color: orange,letterSpacing: 10)),),
              SizedBox(height: deviceWidth* .05,),
              Center(child: Text('Welcome to Login Page !',style: TextStyle(fontSize: 18,fontWeight: FontWeight.w600),)),
              SizedBox(height: deviceWidth* .2,),
              Text('Email',style: TextStyle(fontSize: 16,fontWeight: FontWeight.w600),),
              Container(
                margin: EdgeInsets.symmetric(
                    vertical: deviceWidth * .025),
                decoration: BoxDecoration(
                    border: Border(bottom: BorderSide(color: grey))
                ),

                width: deviceWidth,
                child: TextFormField(
                  controller: _emailController,
                  focusNode: _emailFocusNode,
                  textInputAction: TextInputAction.next,
                  keyboardType: TextInputType.emailAddress,
                  onFieldSubmitted: (_) {
                    FocusScope.of(context)
                        .requestFocus(_passwordFocusNode);
                  },
                  onChanged: (value){
                    email = value;
                  },
                  validator: (value) {
                    if (value.isEmpty) {
                      return "Email is Required";
                    }
                    return null;
                  },
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                  ),
                  decoration: InputDecoration(
                    hintText: "Enter Email Address",
                    hintStyle: TextStyle(
                      color: grey,
                      fontSize: 15,
                    ),
                    enabledBorder: InputBorder.none,
                    disabledBorder: InputBorder.none,
                    focusedBorder: InputBorder.none,
                    border: InputBorder.none,
                    errorText: _emailErrorText,
                  ),
                ),
              ),
            SizedBox(height: deviceWidth* .025,
            ),
              Text('Password',style: TextStyle(fontSize: 16,fontWeight: FontWeight.w600)),

              Container(
                decoration: BoxDecoration(
                    border: Border(bottom: BorderSide(color: grey))
                ),
                margin: EdgeInsets.symmetric(
                    vertical: deviceWidth * .025),
                width: deviceWidth,
                child: TextFormField(
                  controller: _passwordController,
                  focusNode: _passwordFocusNode,
                  textInputAction: TextInputAction.done,
                  keyboardType: TextInputType.text,
                  obscureText: !_passwordVisible,
                  onFieldSubmitted: (_) {
                    _submit();
                  },
                  onChanged: (value){
                    password= value;
                  },
                  validator: (value) {
                    if (value.isEmpty) {
                      return "Password is Required";
                    }
                    return null;
                  },
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                  ),
                  decoration: InputDecoration(
                    hintText: "Enter Password",
                    hintStyle: TextStyle(
                      fontSize: 15,
                      color: grey
                    ),
                    enabledBorder: InputBorder.none,
                    disabledBorder: InputBorder.none,
                    focusedBorder: InputBorder.none,
                    border: InputBorder.none,
                    errorText: _passwordErrorText,
                    suffixIcon: IconButton(
                      icon: Icon(
                        // Based on passwordVisible state choose the icon
                        _passwordVisible
                            ? Icons.visibility_outlined
                            : Icons.visibility_off_outlined,
                        color: grey,
                        size: 25,
                      ),
                      onPressed: () {
                        // Update the state i.e. toogle the state of passwordVisible variable
                        setState(() {
                          _passwordVisible = !_passwordVisible;
                        });
                      },
                    ),
                  ),
                ),
              ),
              SizedBox(height: deviceWidth* .25,),

              Align(
                alignment: Alignment.center,
                child: InkWell(onTap: ()async {
                  _submit();
                  try{
                  final user = await _auth.signInWithEmailAndPassword(email: email, password: password);
                  if (user != null) {
                    goToHomePage(context);
                  }}
                  catch(e){
                    print(e);
                  }
                },
                  child: Container(
                    width: deviceWidth,
                    height: 50,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: lightOrange
                    ),
                    child: Center(
                      child: Text(
                        "Sign In",
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                          color: white
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: deviceWidth* .15,),

              Row(mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Don't have an account ? ",style: TextStyle(fontSize: 16,fontWeight: FontWeight.w600),),
                  InkWell(
                      onTap: (){
                         goToSignUpScreen(context);
                      },
                      child: Text('Sign Up',style: TextStyle(color: orange,fontWeight: FontWeight.w600,fontSize: 18),))
                ],)

            ],
          ),
        ),
      ),
    );
  }
}
