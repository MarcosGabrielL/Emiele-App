import 'package:flutter/material.dart';
import 'package:jurisconexao_cliente/components/my_button.dart';
import 'package:jurisconexao_cliente/components/my_textfield.dart';
import 'package:jurisconexao_cliente/components/square_tile.dart';
import 'package:jurisconexao_cliente/models/auth_request_register.dart';
import 'package:jurisconexao_cliente/pages/login.dart';
import 'package:jurisconexao_cliente/pages/register.dart';
import 'package:jurisconexao_cliente/service/security.dart';

import '../main.dart';

class RegisterPage extends StatelessWidget {
  RegisterPage({super.key});


  // text editing controllers
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();

  // sign user in method
  Future<void> signUserIn(BuildContext context) async {

    String name = '';
    String email = usernameController.value.text;
    String password = passwordController.value.text;

    try {
      AuthService authManager = AuthService();
      final ret = await authManager.signUp(name, email, password);
      // Handle the registration success and process the registerModel object
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => MyApp()),
      );
      print('11: Registration successful: $ret');
    } catch (e) {
      // Handle registration failure and error exceptions
      print('11: Registration failed: $e');
    }

  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(height: 50),

              // logo
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    'assets/images/logo.png',
                    width: 100,
                    height: 100,
                  ),
                ],
              ),


              const SizedBox(height: 50),

              // welcome back, you've been missed!
              Text(
                'Bem-Vindo! Cadastre-se agora',
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
              CheckboxListTile(
                title: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 0.0, vertical: 0.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        'Eu concordo com os ',
                        style: TextStyle(color: Colors.grey[700], fontSize: 12),
                      ),
                      GestureDetector(
                        onTap: () {
                          // Add the navigation logic to open the LoginPage here
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => LoginPage()),
                          );
                        },
                        child: Text(
                          'Termos e Condições',
                          style: TextStyle(
                            color: Color(0xFF011C38),
                            fontWeight: FontWeight.bold,
                            fontSize: 14,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                value: false,
                onChanged: (value) {
                  // Add your code here to handle the checkbox value change
                },
                controlAffinity: ListTileControlAffinity.leading,
              ),





              const SizedBox(height: 20),

              // sign in button
              MyButtonPrimary(
                onTap: () => signUserIn(context),
                text: "Cadastrar-se",
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
                    'Já tem uma conta?',
                    style: TextStyle(color: Colors.grey[700]),
                  ),
                  const SizedBox(width: 4),
                  GestureDetector(
                    onTap: () {
                      // Add the navigation logic to open the register.dart file here
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => LoginPage()),
                      );
                    },
                    child: const Text(
                      'Entrar',
                      style: TextStyle(
                        color: Color(0xFF011C38),
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
    );
  }
}