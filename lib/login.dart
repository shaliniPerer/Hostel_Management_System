import 'package:flutter/material.dart';
import 'package:untitled1/signup.dart';
import 'package:untitled1/student.dart';

class login extends StatefulWidget {
  login({Key? key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<login> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _isPasswordVisible = false;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
        child: Scaffold(
        body: SizedBox(
        width: size.width,
        height: size.height,
        child: SingleChildScrollView(
        child: Stack(
        children: [
        Image.asset(
        "assets/login1.jpg",
    ),
    const PageTitleBar(title: 'Login to your account'),
    Padding(
    padding: const EdgeInsets.only(top: 320.0),
    child: Container(
    width: double.infinity,
    decoration: const BoxDecoration(
    color: Colors.white,
    borderRadius: BorderRadius.only(
    topLeft: Radius.circular(50),
    topRight: Radius.circular(50),
    ),
    ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(
            height: 15,
          ),
          const SizedBox(
            height: 20,
          ),
          SizedBox(
            height: 20,
          ),
          Form(
            child: Column(
              children: [
                Padding(padding: EdgeInsets.all(10)),
                TextField(
                  controller: _usernameController,
                  decoration: InputDecoration(
                    hintText: 'Username',
                    // a
                    prefixIcon: Icon(Icons.person),
                    filled: true,
                    // Enables the fill color
                    fillColor: Colors.grey[200],
                    // Light grey background color
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                      // Rounded corners
                      borderSide: BorderSide
                          .none, // Removes the border line
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                      borderSide: BorderSide.none,
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                      borderSide: BorderSide.none,
                    ),
                  ),
                ),

                SizedBox(height: 16),
                TextField(
                  controller: _passwordController,
                  obscureText: !_isPasswordVisible,
                  decoration: InputDecoration(
                    hintText: 'Password',
                    prefixIcon: Icon(Icons.lock),
                    suffixIcon: IconButton(
                      icon: Icon(
                        _isPasswordVisible
                            ? Icons.visibility
                            : Icons.visibility_off,
                      ),
                      onPressed: () {
                        setState(() {
                          _isPasswordVisible =
                          !_isPasswordVisible;
                        });
                      },
                    ),
                    filled: true,
                    // Enables the fill color
                    fillColor: Colors.grey[200],
                    // Light grey background color
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                      // Rounded corners
                      borderSide: BorderSide
                          .none, // Removes the border line
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                      borderSide: BorderSide.none,
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                      borderSide: BorderSide.none,
                    ),
                  ),
                ),

                // TextField(
                //   controller: _passwordController,
                //   decoration: InputDecoration(
                //     labelText: 'Password',
                //     border: OutlineInputBorder(),
                //   ),
                //   obscureText: true,
                // ),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    final username = _usernameController.text;
                    final password = _passwordController.text;

                    // Perform login action here
                    print('Username: $username');
                    print('Password: $password');

                    // For demonstration, show a simple alert dialog
                    showDialog(
                      context: context,
                      builder: (context) => AlertDialog(
                        title: Text('Login Successful'),
                        content: Text('Welcome, $username!'),
                        actions: [
                          TextButton(
                            onPressed: () =>
                                Navigator.of(context).pop(),
                            child: Text('OK'),
                          ),
                        ],
                      ),
                    );
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Student(username: username),
                      ),
                    );
                  },
                  child: Text(
                    'Login',
                    style: TextStyle(color: Colors.black),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                    padding: EdgeInsets.symmetric(
                        horizontal: 70, vertical: 16),
                  ),

                ),
                SizedBox(
                  height: 15,
                ),
                UnderPart(
                  title: "Don't have an account?",
                  navigatorText: "Register here",
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                            const signup()));
                  },
                ),
                const SizedBox(
                  height: 20,
                ),
                const Text(
                  'Forgot password?',
                  style: TextStyle(
                      color: Colors.black,
                      fontFamily: 'OpenSans',
                      fontWeight: FontWeight.w600,
                      fontSize: 13),
                ),
                const SizedBox(
                  height: 20,
                )
              ],
            ),
          )
        ],
      ),
    ),
    )
        ],
        ),
        ),
        ),
        ),
    );
  }
}

switchListTile() {
  return Padding(
    padding: const EdgeInsets.only(left: 50, right: 40),
    child: SwitchListTile(
      dense: true,
      title: const Text(
        'Remember Me',
        style: TextStyle(fontSize: 16, fontFamily: 'OpenSans'),
      ),
      value: true,
      activeColor: Colors.yellow,
      onChanged: (val) {},
    ),
  );
}

class UnderPart extends StatelessWidget {
  final String title;
  final String navigatorText;
  final VoidCallback onTap;

  const UnderPart(
      {Key? key,
        required this.title,
        required this.navigatorText,
        required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(title),
        GestureDetector(
          onTap: onTap,
          child: Text(
            navigatorText,
            style: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold),
          ),
        ),
      ],
    );
  }
}

class PageTitleBar extends StatelessWidget {
  const PageTitleBar({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 260.0),
      child: Container(
        width: double.infinity,
        height: MediaQuery.of(context).size.height / 4,
        decoration: const BoxDecoration(
          color: Colors.grey,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(50),
            topRight: Radius.circular(50),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.only(top: 16.0),
          child: Text(
            title,
            textAlign: TextAlign.center,
            style: const TextStyle(
                fontFamily: 'OpenSans',
                fontSize: 20,
                letterSpacing: 1,
                fontWeight: FontWeight.bold,
                color: Color(0xfff575861)),
          ),
        ),
      ),
    );
  }
}