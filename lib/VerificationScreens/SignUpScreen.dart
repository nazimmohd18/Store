import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import '../Utils/Colors.dart';
import 'LoginScreen.dart';
import 'package:firebase_auth/firebase_auth.dart';
class SignUpScreen extends StatefulWidget {
  static const routeName = 'SignUp';
  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey();
  TextEditingController _nameController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _mobileController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  TextEditingController _confirmPasswordController = TextEditingController();


  final _nameFocusNode = FocusNode();
  final _emailFocusNode = FocusNode();
  final _mobileFocusNode = FocusNode();
  final _passwordFocusNode = FocusNode();
  final _confirmPasswordFocusNode = FocusNode();


  String _nameErrorText;
  String _emailErrorText;
  String _mobileErrorText;
  String _passwordErrorText;
  String _confirmErrorText;

  bool _passwordVisible;
  bool isCheck = false;

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
    super.initState();
    _passwordVisible = false;
  }

  Future<void> _submit() async {
    try {
      _formKey.currentState.save();
      if (!_formKey.currentState.validate()) {
        return;
      }
      // Navigator.of(context).pushReplacementNamed(SuccessfulSignUpScreen.routeName);
      //   print(awaitingAuth);
      //   if (awaitingAuth) {
      //     Navigator.of(context).pushReplacementNamed(NavigationScreen.routeName);

      //   }
    } catch (e) {
      print(e);
      // Scaffold.of(context).showSnackBar(SnackBar(
      //   backgroundColor: Colors.red,
      //   content: Text(e.toString()),
      // ));
    }
  }

  void goToLoginScreen(BuildContext context) {
    Navigator.of(context).pushNamed(LoginScreen.routeName);
  }



  @override
  Widget build(BuildContext context) {
    final deviceHeight = MediaQuery.of(context).size.height;
    final deviceWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      key: _formKey,
      resizeToAvoidBottomInset: false,
      body: Container(
        width: deviceHeight,
        height: deviceHeight,

        child: SingleChildScrollView(
          padding: EdgeInsets.fromLTRB(deviceWidth* .05, deviceWidth* .20, deviceWidth* .05, deviceWidth* .1),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(child: Text('STORE',style: TextStyle(fontSize: 28,fontWeight: FontWeight.w600,color: orange,letterSpacing: 10)),),
              SizedBox(height: deviceWidth* .05,),
              Center(child: Text('Welcome to SignUp Page !',style: TextStyle(fontSize: 18,fontWeight: FontWeight.w600),)),
              SizedBox(height: deviceWidth* .2,),
              Text('Name',style: TextStyle(fontSize: 16,fontWeight: FontWeight.w600)),
              Container(
                margin: EdgeInsets.symmetric(
                    vertical: deviceWidth * .025),
                decoration: BoxDecoration(
                    border: Border(bottom: BorderSide(color: grey))
                ),

                width: deviceWidth,
                child: TextFormField(
                  controller: _nameController,
                  focusNode: _nameFocusNode,
                  textInputAction: TextInputAction.next,
                  keyboardType: TextInputType.text,
                  onFieldSubmitted: (_) {
                    FocusScope.of(context)
                        .requestFocus(_emailFocusNode);
                  },
                  validator: (value) {
                    if (value.isEmpty) {
                      return "Name is Required";
                    }
                    return null;
                  },
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                  ),
                  decoration: InputDecoration(
                    hintText:
                    "Enter Your Name",
                    hintStyle: TextStyle(
                      color: grey,
                      fontSize: 15,
                    ),
                    enabledBorder: InputBorder.none,
                    disabledBorder: InputBorder.none,
                    focusedBorder: InputBorder.none,
                    border: InputBorder.none,
                    errorText: _nameErrorText,
                  ),
                ),
              ),
              SizedBox(height: deviceWidth* .025,),
              Text('Email',style: TextStyle(fontSize: 16,fontWeight: FontWeight.w600)),
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
                        .requestFocus(_mobileFocusNode);
                  },
                  onChanged: (value){
                    email= value;
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
              SizedBox(height: deviceWidth* .025,),
              Text('Phone',style: TextStyle(fontSize: 16,fontWeight: FontWeight.w600)),
              Container(
                margin: EdgeInsets.symmetric(
                    vertical: deviceWidth * .025),
                decoration: BoxDecoration(
                    border: Border(bottom: BorderSide(color: grey))
                ),
                width: deviceWidth,
                child: TextFormField(
                  controller: _mobileController,
                  focusNode: _mobileFocusNode,
                  textInputAction: TextInputAction.next,
                  keyboardType: TextInputType.number,
                  onFieldSubmitted: (_) {
                    FocusScope.of(context)
                        .requestFocus(

                        _passwordFocusNode);
                  },
                  validator: (value) {
                    if (value.isEmpty) {
                      return "Mobile Number is Required";
                    }
                    return null;
                  },
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                  ),
                  decoration: InputDecoration(
                    hintText: "Enter Phone number",
                    hintStyle: TextStyle(
                      color: grey,
                      fontSize: 15,
                    ),
                    enabledBorder: InputBorder.none,
                    disabledBorder: InputBorder.none,
                    focusedBorder: InputBorder.none,
                    border: InputBorder.none,
                    errorText: _mobileErrorText,
                  ),
                ),
              ),
              SizedBox(height: deviceWidth* .025,),
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
                  obscureText: true,
                  onFieldSubmitted: (_) {
                    FocusScope.of(context)
                        .requestFocus(_confirmPasswordFocusNode);
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
                      color: grey,
                      fontSize: 15,
                    ),
                    enabledBorder: InputBorder.none,
                    disabledBorder: InputBorder.none,
                    focusedBorder: InputBorder.none,
                    border: InputBorder.none,
                    errorText: _passwordErrorText,

                  ),
                ),
              ),
              SizedBox(height: deviceWidth* .025,),
              Text('Confirm Password',style: TextStyle(fontSize: 16,fontWeight: FontWeight.w600)),
              Container(
                decoration: BoxDecoration(
                    border: Border(bottom: BorderSide(color: grey))
                ),
                margin: EdgeInsets.symmetric(
                    vertical: deviceWidth * .025),
                width: deviceWidth,
                child: TextFormField(
                  controller: _confirmPasswordController,
                  focusNode: _confirmPasswordFocusNode,
                  textInputAction: TextInputAction.done,
                  keyboardType: TextInputType.text,
                  obscureText: !_passwordVisible,
                  onFieldSubmitted: (_) {
                    _submit();
                  },
                  validator: (value) {
                    if (value.isEmpty) {
                      return "Confirm Password is Required";
                    }
                    return null;
                  },
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                  ),
                  decoration: InputDecoration(
                    hintText: "Confirm Password",
                    hintStyle: TextStyle(
                      color: Colors.grey,
                      fontSize: 15,
                    ),
                    enabledBorder: InputBorder.none,
                    disabledBorder: InputBorder.none,
                    focusedBorder: InputBorder.none,
                    border: InputBorder.none,
                    errorText: _confirmErrorText,
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
                child: InkWell(onTap: () async {
                   _submit();
                 // print(email);
                 // print(password);
                   try{
                final newUser = await  _auth.createUserWithEmailAndPassword(email: email, password: password);
                if (newUser != null){
                  goToLoginScreen(context);
                }
                   }

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
                        "Sign Up",
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
                  Text("Have an account ? ",style: TextStyle(fontSize: 16,fontWeight: FontWeight.w600),),
                  InkWell(
                      onTap: (){
                         goToLoginScreen(context);
                      },
                      child: Text('Sign In',style: TextStyle(color: orange,fontWeight: FontWeight.w600,fontSize: 18),))
                ],)


            ],
          ),
        ),
      ),
    );
  }
}
