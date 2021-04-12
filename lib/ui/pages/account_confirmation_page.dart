part of 'pages.dart';

class AccountConfirmationPage extends StatefulWidget {
  final RegistrationData registrationData;

  AccountConfirmationPage(this.registrationData);

  @override
  _AccountConfirmationPageState createState() =>
      _AccountConfirmationPageState();
}

class _AccountConfirmationPageState extends State<AccountConfirmationPage> {
  bool isSigningUp = false;

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        context
            .read<PageBloc>()
            .add(GoToPreferencePage(widget.registrationData));
        return;
      },
      child: Scaffold(
        body: Container(
          color: CupertinoColors.systemBackground,
          padding: EdgeInsets.symmetric(horizontal: defaultMargin),
          child: ListView(
            children: [
              Column(
                children: [
                  Container(
                    margin: EdgeInsets.only(
                      top: 20,
                      bottom: 90,
                    ),
                    height: 56,
                    child: Stack(
                      children: [
                        Align(
                          alignment: Alignment.centerLeft,
                          child: GestureDetector(
                            onTap: () {
                              context.read<PageBloc>().add(GoToSplashPage());
                            },
                            child: Icon(
                              Icons.arrow_back,
                              color: Colors.black,
                            ),
                          ),
                        ),
                        Center(
                          child: Text(
                            "Confirm\nNew Account",
                            style: blackTextFont.copyWith(fontSize: 20),
                            textAlign: TextAlign.center,
                          ),
                        )
                      ],
                    ),
                  ),
                  Container(
                    width: 150,
                    height: 150,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                            image:
                                (widget.registrationData.profileImage == null)
                                    ? AssetImage('assets/user_pic.png')
                                    : FileImage(
                                        widget.registrationData.profileImage),
                            fit: BoxFit.cover)),
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  Text(
                    "Welcome",
                    style: blackTextFont.copyWith(
                      fontSize: 16,
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                  Text(
                    "${widget.registrationData.name}",
                    style: blackTextFont.copyWith(fontSize: 20),
                  ),

                  SizedBox(
                    height: 110,
                  ),
                  (isSigningUp == true)
                      ? SpinKitCircle(
                          color: accentColor1,
                          size: 45,
                        )
                      : SizedBox(
                          width: 250,
                          height: 45,
                          child: ElevatedButton(
                            onPressed: () async {
                              setState(() {
                                isSigningUp = true;
                              });

                              imageFileToUpload =
                                  widget.registrationData.profileImage;

                              FetchResult result = await AuthServices.signUp(
                                  widget.registrationData.email,
                                  widget.registrationData.password,
                                  widget.registrationData.name,
                                  widget.registrationData.selectedGenres,
                                  widget.registrationData.selectedLang);
                              if (result == null) {
                                setState(() {
                                  isSigningUp = false;
                                });

                                Flushbar(
                                  duration: Duration(milliseconds: 1500),
                                  flushbarPosition: FlushbarPosition.TOP,
                                  backgroundColor: Colors.pinkAccent,
                                  message: result.message,
                                ).show(context);
                              }
                            },
                            style: ElevatedButton.styleFrom(
                                primary: accentColor1,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8),
                                )),
                            child: Text(
                              "Create My Account",
                              style: whiteTextFont.copyWith(fontSize: 16),
                            ),
                          ),
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
