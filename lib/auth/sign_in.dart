import 'package:demo/Auth/auth_packages.dart';
import 'package:demo/homes/dashboard.dart';
import 'dart:io';
import 'package:flutter/foundation.dart';


class SignIn extends StatefulWidget {
  const SignIn({super.key});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  bool isVisiblePass = true;
  final FocusNode emailFocus = FocusNode();
  final FocusNode passFocus = FocusNode();
  final FocusNode buttonFocus = FocusNode();
  TextEditingController emailController = TextEditingController();
  TextEditingController passController = TextEditingController();

  String emailError = '';
  String passwordError = '';
  String confirmError = '';
  String email = '';
  String password = '';

  final _formKey = GlobalKey<FormState>();

  Future<void> getData() async {
    try{
      email = (await Provider.of<Preference>(context, listen: false).getEmail())!;
      password = ( await Provider.of<Preference>(context, listen: false).getPassword())!;
    }
        catch(error){
      if (kDebugMode) {
        print(error);
      }
    }
  }

  _fieldFocusChange(BuildContext context, FocusNode currentFocus,
      FocusNode nextFocus) {
    currentFocus.unfocus();
    FocusScope.of(context).requestFocus(nextFocus);
  }

  void visibility() {
    setState(() {
      isVisiblePass = !isVisiblePass;
    });
  }

  // PrefManager prefManager = new PrefManager();

  @override
  void initState(){
    getData();
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    var errorBorder = const UnderlineInputBorder(
        borderSide: BorderSide(
            color: ColorConstants.primaryBlack
        )
    );
    var hintStyle =  Theme.of(context).textTheme.labelSmall;
    var labelStyle = Theme.of(context).textTheme.labelSmall;
    var errorStyle =  Theme.of(context).textTheme.labelSmall?.copyWith(color: Colors.red);

    return Scaffold(
      backgroundColor: ColorConstants.primaryColor,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: ColorConstants.primaryColor,
        automaticallyImplyLeading: false,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Log in', style: TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.w700
              ),
              ),
              TextFormField(
                controller: emailController,
                onChanged: (value){
                  setState(() {
                    if(value.isEmpty){
                      emailError = "Please Enter the email";
                    } else if(CommonFunction.emailValidation(email: value)){
                      emailError = 'Please Enter the Valid Email';
                    } else {
                      emailError = "";
                    }
                  });
                },
                decoration: InputDecoration(
                    hintText: "Enter the email",
                    labelText: "Email",
                    errorText: emailError,
                    hintStyle: hintStyle,
                    labelStyle: labelStyle,
                    errorStyle: errorStyle,
                    errorBorder: errorBorder
                ),
              ),
              Sized.sHeight(15),
              TextFormField(
                obscureText: isVisiblePass,
                controller: passController,
                onChanged: (value){
                  setState(() {
                    if(value.isEmpty){
                      passwordError = "Please Enter the password";
                    } else if(value.length < 6){
                      passwordError = 'Password is to short';
                    } else {
                      passwordError = "";
                    }
                  });
                },
                decoration: InputDecoration(
                  hintText: "Enter the password",
                  labelText: "Password",
                  errorText: passwordError,
                  hintStyle: hintStyle,
                  labelStyle: labelStyle,
                  errorStyle: errorStyle,
                  errorBorder: errorBorder,
                  suffixIcon: IconButton(
                      onPressed: visibility,
                      icon:Icon(isVisiblePass ? Icons.visibility : Icons.visibility_off,color: ColorConstants.primaryBlack,)
                  ),
                ),
              ),
              Sized.sHeight(15),
              Align(
                  alignment: Alignment.centerRight,
                  child: GestureDetector(child: const Text(
                    'Forget Password', textAlign: TextAlign.right,)
                  )
              ),
              Sized.sHeight(15),
              ButtonFile(
                  buttonName: "Log In",
                  voidCallback: () {
                    if(email.isEmpty && password.isEmpty){
                      Message.showMessage('Please Create an Account first');
                    } else {
                      if(email != emailController.text){
                        Message.showMessage('Invalid Email');
                      } else if (password != passController.text){
                        Message.showMessage('Invalid Password');
                      } else {
                        Provider.of<Preference>(context, listen: false).setIsLoggedIn(true);
                        Routes.removeRoute(context: context,  widgets: const Dashboard());
                      }
                    }
                  }
              ),
              Sized.sHeight(15),

              const Center(
                child: Text(
                  'Or Sign up with social account',
                  textAlign: TextAlign.right,),
              ),
              Sized.sHeight(15),
              Center(
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ImageView(
                        socialClicks: () {}, images: ImageConstants.facebook),
                    const SizedBox(
                      width: 20,
                    ),
                    ImageView(
                        socialClicks: () {}, images: ImageConstants.google),
                    Platform.isIOS == true
                        ? const SizedBox(
                      width: 20,
                    )
                        : Container(),
                    Platform.isIOS
                        ? ImageView(
                        socialClicks: () {}, images: ImageConstants.apple)
                        : Container()
                  ],
                ),
              ),
              Sized.sHeight(15),
              AuthButton(
                  message: "If you don't have an account ?",
                  buttonText: "Sign Up",
                  callBack: () {
                    Routes.pushRoute(context: context,  widgets: const SignUp());
                  }
              )
            ],
          ),
        ),
      ),
    );
  }
}