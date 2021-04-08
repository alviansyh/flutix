part of 'pages.dart';

class SignInPage extends StatefulWidget {
  @override
  _SignInPageState createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  bool isValidEmail = false;
  bool isValidPassword = false;
  bool isSigningIn = false;

  @override
  Widget build(BuildContext context) {
    context
        .read<ThemeBloc>()
        .add(ChangeTheme(ThemeData().copyWith(primaryColor: accentColor2)));
    return WillPopScope(
      onWillPop: () {
        context.read<PageBloc>().add(GoToSplashPage());
        return;
      },
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Container(
          padding: EdgeInsets.symmetric(horizontal: defaultMargin),
          child: ListView(
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 30,
                  ),
                  SizedBox(
                    height: 70,
                    child: Image.asset('assets/logo.png'),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 70, bottom: 40),
                    child: Text(
                      "Welcome Back, \nExplorer!",
                      style: blackTextFont.copyWith(fontSize: 20),
                    ),
                  ),
                  TextField(
                    onChanged: (text) {
                      setState(() {
                        isValidEmail = EmailValidator.validate(text);
                      });
                    },
                    controller: emailController,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        labelText: "Email Address",
                        hintText: "Email Address"),
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  TextField(
                    onChanged: (text) {
                      setState(() {
                        isValidPassword = text.length >= 6;
                      });
                    },
                    controller: passwordController,
                    obscureText: true,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        labelText: "Password",
                        hintText: "Password"),
                  ),
                  SizedBox(
                    height: 6,
                  ),
                  Row(
                    children: [
                      Text(
                        "Forgot Password?",
                        style: greyTextFont.copyWith(
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      SizedBox(width: 5),
                      Text(
                        "Get Now",
                        style: purpleTextFont.copyWith(fontSize: 12),
                      )
                    ],
                  ),
                  Center(
                    child: Container(
                      width: 50,
                      height: 50,
                      margin: EdgeInsets.only(top: 40, bottom: 30),
                      child: (isSigningIn)
                          ? SpinKitCircle(
                              color: mainColor,
                            )
                          : FloatingActionButton(
                              elevation: 0,
                              child: Icon(
                                Icons.arrow_forward,
                                color: (isValidEmail && isValidPassword)
                                    ? Colors.white
                                    : Colors.grey,
                              ),
                              backgroundColor: (isValidEmail && isValidPassword)
                                  ? mainColor
                                  : disableColor,
                              onPressed: (isValidEmail && isValidPassword)
                                  ? () async {
                                      setState(() {
                                        isSigningIn = true;
                                      });

                                      FetchResult result =
                                          await AuthServices.signIn(
                                        emailController.text,
                                        passwordController.text,
                                      );

                                      if (result.user == null) {
                                        setState(() {
                                          isSigningIn = false;
                                        });
                                        Flushbar(
                                          duration: Duration(seconds: 4),
                                          flushbarPosition: FlushbarPosition.TOP,
                                          backgroundColor: Colors.pinkAccent,
                                          message: result.message,
                                        ).show(context);
                                      }
                                    }
                                  : null,
                            ),
                    ),
                  ),
                  Row(
                    children: [
                      Text(
                        "Start Fresh Now",
                        style: greyTextFont.copyWith(fontWeight: FontWeight.w400),
                      ),
                      SizedBox(width: 5),
                      Text(
                        "Sign Up",
                        style: purpleTextFont,
                      )
                    ],
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
