import 'auth_packages.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {

  bool isVisiblePass = true;
  bool isVisibleConfirmPass = true;
  bool isTerms = false;

  String nameError = '';
  String emailError = '';
  String passwordError = '';
  String confirmError = '';

  final _formKey = GlobalKey<FormState>();

  final FocusNode nameFocus = FocusNode();
  final FocusNode emailFocus = FocusNode();
  final FocusNode passFocus = FocusNode();
  final FocusNode passConfirmFocus = FocusNode();
  final FocusNode buttonFocus= FocusNode();

  TextEditingController nameController = TextEditingController();
  TextEditingController passController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController confirmController = TextEditingController();

  _fieldFocusChange(
      BuildContext context, FocusNode currentFocus, FocusNode nextFocus) {
    currentFocus.unfocus();
    FocusScope.of(context).requestFocus(nextFocus);
  }

  void visibilityPass()
  {
    setState(() {
      isVisiblePass = !isVisiblePass;
    });
  }

  void visibilityCPass()
  {
    setState(() {
      isVisibleConfirmPass = !isVisibleConfirmPass;
    });
  }

  @override
  Widget build(BuildContext context) {

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
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Sign up', style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.w700
                ),
                ),
                const SizedBox(
                  height: 15,
                ),
                TextFormField(
                  controller: nameController,
                  onChanged: (value){
                    setState(() {
                      if(value.isEmpty){
                        nameError = "Please Enter the username";
                      } else if(value.length < 5){
                        nameError = 'Too Short name';
                      } else {
                        nameError = "";
                      }
                    });
                  },
                  decoration: InputDecoration(
                    hintText: "Enter the username",
                    labelText: "Username",
                    errorText: nameError,
                      hintStyle: hintStyle,
                      labelStyle: labelStyle,
                      errorStyle: errorStyle,
                      errorBorder: errorBorder
                  ),
                ),
                const SizedBox(
                  height: 15,
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
                const SizedBox(
                  height: 15,
                ),
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
                        onPressed: visibilityPass,
                        icon:Icon(isVisiblePass ? Icons.visibility : Icons.visibility_off,color: ColorConstants.primaryBlack,)
                     ),
                  ),
                ),

                const SizedBox(
                  height: 15,
                ),
                TextFormField(
                  obscureText: isVisibleConfirmPass,
                  controller: confirmController,
                  onChanged: (value){
                    setState(() {
                      if(value.isEmpty){
                        confirmError = "Please Enter the Confirm password";
                      }  else if(value != passController.text) {
                        confirmError = "Password is not match";
                      } else {
                        confirmError = "";
                      }
                    });
                  },
                  decoration: InputDecoration(
                    hintText: "Enter the Confirm password",
                    labelText: "Confirm Password",
                    errorText: confirmError,
                    errorBorder: errorBorder,
                      hintStyle: hintStyle,
                      labelStyle: labelStyle,
                      errorStyle: errorStyle,
                    suffixIcon: IconButton(
                        onPressed: visibilityCPass,
                        icon:Icon(isVisibleConfirmPass ? Icons.visibility : Icons.visibility_off,color: ColorConstants.primaryBlack,)
                    ),
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),

                GestureDetector(
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Checkbox(
                        value: isTerms,
                        activeColor: ColorConstants.primaryBlack,
                        onChanged: (value){
                          setState(() {
                            isTerms = !isTerms;
                          });
                        },

                      ),
                      Sized.sWidth(10),
                      RichText(
                        textAlign: TextAlign.left,
                        text: const TextSpan(
                            style: TextStyle(color: ColorConstants.primaryBlack,),
                            children:[
                              TextSpan(text: 'By signing up you agree to our \n'),
                              TextSpan(text: 'Term & Condition',style: TextStyle(textBaseline: TextBaseline.alphabetic,decoration: TextDecoration.underline,fontWeight: FontWeight.w700),),
                              TextSpan(text: ' Or '),
                              TextSpan(text: ' Privacy Policy',style: TextStyle(textBaseline: TextBaseline.alphabetic,decoration: TextDecoration.underline, fontWeight: FontWeight.w700)),
                            ]
                        ),
                      ),
                    ],
                  ),
                ),
                Sized.sHeight(20),
                ButtonFile(
                  buttonName: "Sign Up",
                  voidCallback: (){
                    if(nameController.text.isEmpty){
                      Message.showMessage('Please enter the name');
                    } else if(emailController.text.isEmpty){
                      Message.showMessage('Please enter the email');
                    } else if(passController.text.isEmpty){
                      Message.showMessage('Please enter the password');
                    } else if(confirmController.text.isEmpty){
                      Message.showMessage('Please enter the confirmPassword');
                    } else if (passController.text != confirmController.text){
                      Message.showMessage('Password Not match');
                    } else if (CommonFunction.emailValidation(email: emailController.text)){
                      Message.showMessage('Please enter the valid Email');
                    } else if (passController.text.length < 6 && confirmController.text.length < 6){
                      Message.showMessage('Password be more then 6 character');
                    } else  if(isTerms == false){
                      Message.showMessage('Please accept the term and condition');
                    } else {
                      Provider.of<Preference>(context, listen: false).setEmail(emailController.text);
                      Provider.of<Preference>(context, listen: false).setPassword(passController.text);
                      Provider.of<Preference>(context, listen: false).setUsername(nameController.text);
                      Message.showMessage('User create successfully');
                      Routes.removeRoute(context: context,  widgets: const SignIn());
                    }
                  },
                ),

                Sized.sHeight(20),
                AuthButton(
                    message: "Already have an Account ?",
                    buttonText: "Sign In",
                    callBack: () {
                      Routes.removeRoute(context: context,  widgets: const SignIn());
                    }
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
