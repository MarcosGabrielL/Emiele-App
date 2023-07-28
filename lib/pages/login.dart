import 'dart:convert';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:jurisconexao_cliente/components/my_button.dart';
import 'package:jurisconexao_cliente/components/my_textfield.dart';
import 'package:jurisconexao_cliente/components/square_tile.dart';
import 'package:jurisconexao_cliente/main.dart';
import 'package:jurisconexao_cliente/pages/register.dart';
import 'package:jurisconexao_cliente/service/security.dart';
import 'package:jurisconexao_cliente/service/validating.dart';

import '../components/constant.dart';
import '../screens/forgot_password/forgot_password_screen.dart';

class LoginPage extends StatelessWidget {
  static var routeName;

  LoginPage({super.key});





  // text editing controllers
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();


    // sign user in method
    Future<void> signUserIn(BuildContext context) async {

      String email = usernameController.value.text;
      String password = passwordController.value.text;

      if(Validation.validateFields(context, email,password, '', 01)) {
        try {
          AuthService authManager = AuthService();
          final ret = await authManager.authenticate(context, email, password);
          // Handle the registration success and process the registerModel object
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => MyApp()),
          );
          print('12: Authentication successful: $ret');
        } catch (e) {
          // Handle registration failure and error exceptions
          print('12: Authentication failed: $e');
        }
      }else{

      }

    }



  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        behavior: HitTestBehavior.opaque,
        child: Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
        child: SingleChildScrollView(
        child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
        const SizedBox(height: 90),
              // logo
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.memory(
              Uint8List.fromList(Base64Decoder().convert(logov[0].data)),
                    width: 130,
                    height: 130,
                  ),
                ],
              ),


              const SizedBox(height: 60),

              // welcome back, you've been missed!
              Text(
                'Bem-vindo de volta, sentimos sua falta!',
                style: TextStyle(
                  color: Colors.grey[700],
                  fontSize: 16,
                ),
              ),

              const SizedBox(height: 25),

              // username textfield
              MyTextField(
                controller: usernameController,
                hintText: 'Email',
                obscureText: false,
              ),

              const SizedBox(height: 10),

              // password textfield
              MyTextField(
                controller: passwordController,
                hintText: 'Senha',
                obscureText: true,
              ),

              const SizedBox(height: 10),

              // forgot password?
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    InkWell(
                      child: Text(
                        'Esqueceu a conta?',
                        style: TextStyle(color: Colors.grey[700]),

                      ),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => ForgotPasswordScreen()),
                        );
                      },
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 25),

              // sign in button
              MyButtonPrimary(
                onTap: () => signUserIn(context),
                text: "Entrar",
              ),

              const SizedBox(height: 20),

            // or continue with
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: Row(
                  children: [
                    Expanded(
                      child: Divider(
                        thickness: 0.5,
                        color: Colors.grey[400],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10.0),
                      child: Text(
                        'Ou entre com',
                        style: TextStyle(color: Colors.grey[700]),
                      ),
                    ),
                    Expanded(
                      child: Divider(
                        thickness: 0.5,
                        color: Colors.grey[400],
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),

              // google + apple sign in buttons
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  // google button
                  SquareTile(imagePath: 'assets/images/google.png'),

                  SizedBox(width: 25),

                  // apple button
                  SquareTile(imagePath: 'assets/images/apple.png')
                ],
              ),



              const SizedBox(height: 30),

              // not a member? register now
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Não tem uma conta?',
                    style: TextStyle(color: Colors.grey[700]),
                  ),
                  const SizedBox(width: 4),
                  GestureDetector(
                    onTap: () {
                      // Add the navigation logic to open the register.dart file here
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => RegisterPage()),
                      );
                    },
                    child: const Text(
                      'Registre-se',
                      style: TextStyle(
                        //color: kPrimaryColor,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              )
        ],
        ),
        ),
        ),
        ),
    );
  }
}