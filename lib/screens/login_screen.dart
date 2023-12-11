import 'package:flutter/material.dart';
import 'package:recipesfood/responsive/mobile_screen_layout.dart';


import '../resources/auth_methodes.dart';
import '../responsive/responsive_layout.dart';
import '../responsive/web_screen_layout.dart';
import '../utils/colors.dart';
import '../utils/globalvariable.dart';
import '../utils/util.dart';
import '../widgets/text_filed_input.dart';
import 'signup_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _isLoading = false;

  @override
  void dispose() {
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();
  }

  void loginUser() async {
    setState(() {
      _isLoading = true;
    });
    String res = await AuthMethods().loginUser(
        email: _emailController.text, password: _passwordController.text);
    if (res == 'success') {
      if (context.mounted) {
        Navigator.of(context).pushAndRemoveUntil(
            MaterialPageRoute(
              builder: (context) => const ResponsiveLayout(
                mobileScreenLayout: MobileScreenLayout(),
                webScreenLayout: WebScreenLayout(),
              ),
            ),
                (route) => false);

        setState(() {
          _isLoading = false;
        });
      }
    } else {
      setState(() {
        _isLoading = false;
      });
      if (context.mounted) {
        showSnackBar(context, res);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
    //  resizeToAvoidBottomInset: false,
      body: SafeArea(

        child: Stack(
          children: [Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/img_getstarted.png'), // Replace with your image path
                fit: BoxFit.cover, // Adjust the fit as needed
              ),
            ),
            padding: MediaQuery.of(context).size.width > webScreenSize
                ? EdgeInsets.symmetric(
                horizontal: MediaQuery.of(context).size.width / 3)
                : const EdgeInsets.symmetric(horizontal: 32),
            width: double.infinity,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Flexible(
                  flex: 9,
                  child: Container(
                    padding: const EdgeInsets.all(0.0),
                    decoration: BoxDecoration(
                      image: const DecorationImage(
                        image: AssetImage('assets/images/image-2.png'),
                        fit: BoxFit.cover,
                      ),
                    //  color: Colors.white,
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                ),
                const SizedBox(
                  height:60,
                ),
                Container(
                  padding: const EdgeInsets.all(0.0),
                  decoration: BoxDecoration(
                    color: Colors.black, // Set the background color here
                    borderRadius: BorderRadius.circular(10), // Optional: Add rounded corners
                  ),
                  child: TextFieldInput(
                    hintText: 'Enter your email',
                    textInputType: TextInputType.emailAddress,
                    textEditingController: _emailController,
                  ),
                ),
                const SizedBox(
                  height: 24,
                ),
            Container(
              padding: const EdgeInsets.all(0.0),
              decoration: BoxDecoration(
                color: Colors.black, // Set the background color here
                borderRadius: BorderRadius.circular(10), // Optional: Add rounded corners
              ),
              child: TextFieldInput(
                hintText: 'Enter your password',
                textInputType: TextInputType.text,
                textEditingController: _passwordController,
                isPass: true,

              ),
            ),

                const SizedBox(
                  height: 24,
                ),
                InkWell(
                  onTap: loginUser,
                  child: Container(
                    width: double.infinity,
                    alignment: Alignment.center,
                    padding: const EdgeInsets.symmetric(vertical: 12),
                    decoration: const ShapeDecoration(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(4)),
                      ),
                      color: blueColor,
                    ),
                    child: !_isLoading
                        ? const Text(
                      'Log in',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    )
                        : const CircularProgressIndicator(
                      color: primaryColor,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 12,
                ),
                Flexible(
                  flex: 2,
                  child: Container(),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(vertical: 8),
                      child: const Text(
                        'Dont have an account?',
                      ),
                    ),
                    GestureDetector(
                      onTap: () => Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => const SignupScreen(),
                        ),
                      ),
                      child: Container(
                        padding: const EdgeInsets.symmetric(vertical: 8),
                        child: const Text(
                          ' Signup.',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),]
        ),
      ),
    );
  }
}
