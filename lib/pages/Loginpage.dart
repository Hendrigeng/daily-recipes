import 'package:flutter/material.dart';
import 'package:email_validator/email_validator.dart';
import 'package:daily_recipes/pages/homepage.dart';
import 'package:daily_recipes/pages/signupage.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:daily_recipes/services/preferences.services.dart';
import 'package:provider/provider.dart';


class Login extends StatefulWidget {
  Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  late TextEditingController emailController;
  late TextEditingController passwordController;
  late GlobalKey<FormState> fromKey;
  bool obsecureText = true;

  @override
  void initState() {
    emailController = TextEditingController();
    passwordController = TextEditingController();
    fromKey = GlobalKey<FormState>();
    super.initState();
  }

  void toggleObsecure() {
    obsecureText = !obsecureText;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Container(
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("Assets/images/logo.jpg"), fit: BoxFit.cover)),
          height: MediaQuery.of(context).size.height,
          padding: EdgeInsets.all(60),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                padding: const EdgeInsets.only(top: 60.0),
                child: Center(
                  child: Container(
                      width: 300,
                      height: 150,
                      child: Image.asset("Assets/images/logo2.png")),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Text("Sign In",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold)),
              TextFormField(
                  style: TextStyle(color: Colors.white),
                  keyboardType: TextInputType.emailAddress,
                  controller: emailController,
                  decoration: const InputDecoration(
                    label: Text('Email', style: TextStyle(color: Colors.white)),
                    prefixIcon: Icon(Icons.email, color: Colors.white),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'email is required';
                    }

                    if (!EmailValidator.validate(value)) {
                      return 'Not Valid Email';
                    }
                    return null;
                  }),
              const SizedBox(
                height: 15,
              ),
              TextFormField(
                  style: TextStyle(color: Colors.white),
                  obscureText: obsecureText,
                  controller: passwordController,
                  decoration: InputDecoration(
                      label: const Text('Password',
                          style: TextStyle(color: Colors.white)),
                      prefixIcon: Icon(Icons.lock, color: Colors.white),
                      suffixIcon: InkWell(
                        onTap: () => toggleObsecure(),
                        child: Icon(obsecureText
                            ? Icons.visibility_off
                            : Icons.visibility),
                      )),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'password is required';
                    }

                    if (value.length < 6) {
                      return 'password too short';
                    }
                    return null;
                  }),
              const SizedBox(
                height: 15,
              ),
              Container(
                alignment: Alignment.centerRight,
                child: TextButton(
                  onPressed: () {
                    Navigator.push(
                        context, MaterialPageRoute(builder: (_) => Signup()));
                  },
                  child: Text(
                    'Forgot Password?',
                    style: TextStyle(
                      color: Colors.cyan[600],
                      fontSize: 15,
                      decoration: TextDecoration.none,
                    ),
                    textAlign: TextAlign.left,
                  ),
                ),
              ),
              Container(
                height: 50,
                width: 600,
                decoration: BoxDecoration(
                    color: Colors.orange,
                    borderRadius: BorderRadius.circular(20)),
                child: TextButton(
                  onPressed: () {
                    Navigator.pushReplacement(
                        context, MaterialPageRoute(builder: (_) =>  HomePage()));
                  },
                  child: Text(
                    'Sign In',
                    style: TextStyle(color: Colors.white, fontSize: 25),
                  ),
                ),
              ),
              SizedBox(
                height: 50,
              ),
              TextButton(
                onPressed: () {
                  Navigator.push(
                      context, MaterialPageRoute(builder: (_) => Signup()));
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Don\'t have an account? ',
                        style: TextStyle(color: Colors.white, fontSize: 15)),
                    Text(' Register',
                        style: TextStyle(color: Colors.orange, fontSize: 15))
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
