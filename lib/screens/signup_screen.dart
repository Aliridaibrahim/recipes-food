import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:recipesfood/resources/auth_methodes.dart';
import 'package:recipesfood/responsive/mobile_screen_layout.dart';
import 'package:recipesfood/responsive/web_screen_layout.dart';
import 'package:recipesfood/screens/login_screen.dart';
import 'package:recipesfood/utils/colors.dart';
import 'package:recipesfood/utils/util.dart';
import 'package:recipesfood/widgets/text_filed_input.dart';

import '../responsive/responsive_layout.dart';
import '../utils/globalvariable.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({Key? key}) : super(key: key);

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _bioController = TextEditingController();
  bool _isLoading = false;
  Uint8List? _image;

  @override
  void dispose() {
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _usernameController.dispose();
  }

  void signUpUser() async {
    setState(() {
      _isLoading = true;
    });

    // signup user using our authmethodds
    String res = await AuthMethods().signUpUser(
        email: _emailController.text,
        password: _passwordController.text,
        username: _usernameController.text,
        bio: _bioController.text,
        file: _image!);
    if (res == "success") {
      setState(() {
        _isLoading = false;
      });
      // navigate to the home screen
      if (context.mounted) {
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(
            builder: (context) => const ResponsiveLayout(
              mobileScreenLayout: MobileScreenLayout(),
              webScreenLayout: WebScreenLayout(),
            ),
          ),
        );
      }
    } else {
      setState(() {
        _isLoading = false;
      });
      // show the error
      if (context.mounted) {
        showSnackBar(context, res);
      }
    }
  }

  selectImage() async {
    Uint8List im = await pickImage(ImageSource.gallery);

    setState(() {
      _image = im;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Stack(
          children:[ Container(

           // padding: const EdgeInsets.symmetric(horizontal: 32),
            padding: MediaQuery.of(context).size.width > webScreenSize
                ? EdgeInsets.symmetric(
                horizontal: MediaQuery.of(context).size.width / 3)
                : const EdgeInsets.symmetric(horizontal: 32),
            width: double.infinity,
            child: Column(
             // mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Flexible(
                  flex: 2,
                  child: Container(),
                ),

                const SizedBox(
                  height: 64,
                ),
                Stack(
                  children: [
                    _image != null
                        ? CircleAvatar(
                      radius: 64,
                      backgroundImage: MemoryImage(_image!),
                      backgroundColor: Colors.red,
                    )
                        : const CircleAvatar(
                      radius: 64,
                      backgroundImage: NetworkImage(
                          'https://i.stack.imgur.com/l60Hf.png'),
                      backgroundColor: Colors.red,
                    ),
                    Positioned(
                      bottom: -10,
                      left: 80,
                      child: IconButton(
                        onPressed: selectImage,
                        icon: const Icon(Icons.add_a_photo),
                      ),
                    )
                  ],
                ),
                const SizedBox(
                  height: 24,
                ),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.black, // Set the background color here
                    borderRadius: BorderRadius.circular(10), // Optional: Add rounded corners
                  ),
                  child: TextFieldInput(
                    hintText: 'Enter your username',
                    textInputType: TextInputType.text,
                    textEditingController: _usernameController,
                  ),
                ),
                const SizedBox(
                  height: 24,
                ),
                Container(
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
                  decoration: BoxDecoration(
                    color: Colors.black, // Set the background color here
                    borderRadius: BorderRadius.circular(10), // Optional: Add rounded corners
                  ),
                  child: TextFieldInput(
                    hintText: 'Enter your password',
                    textInputType: TextInputType.text,
                    textEditingController: _passwordController,
                  ),
                ),
                const SizedBox(
                  height: 24,
                ),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.black, // Set the background color here
                    borderRadius: BorderRadius.circular(10), // Optional: Add rounded corners
                  ),
                  child: TextFieldInput(
                    hintText: 'Enter your bio',
                    textInputType: TextInputType.text,
                    textEditingController: _bioController,
                  ),
                ),
                const SizedBox(
                  height: 24,
                ),
                InkWell(
                  onTap: signUpUser,
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
                      'Sign up',
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
                        'Already have an account?',
                      ),
                    ),
                    GestureDetector(
                      onTap: () => Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => const LoginScreen(),
                        ),
                      ),
                      child: Container(
                        padding: const EdgeInsets.symmetric(vertical: 8),
                        child: const Text(
                          ' Login.',
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
