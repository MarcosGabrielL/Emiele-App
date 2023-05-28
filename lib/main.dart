import 'package:flutter/material.dart';
import 'package:jurisconexao_cliente/pages/login.dart';
import 'package:jurisconexao_cliente/pages/new_solicitation.dart';
import 'package:jurisconexao_cliente/screens/forgot_password/forgot_password_screen.dart';
import 'package:jurisconexao_cliente/screens/splash/splash_screen.dart';
import 'package:jurisconexao_cliente/service/security.dart';
import 'package:jurisconexao_cliente/widgets/category_selector.dart';
import 'package:jurisconexao_cliente/widgets/favorite_contacts.dart';
import 'package:jurisconexao_cliente/widgets/recent_chats.dart';
import 'package:jurisconexao_cliente/components/fab_bottom_app_bar.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primaryColor: const Color(0xFF011C38),
        //colorScheme: ColorScheme.fromSwatch().copyWith(secondary: Color(0x20FEF9EB)),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  AuthService authManager = AuthService();
  bool isLoggedIn = false; // Variable to control if the user is logged in
  bool isFirstTime = true;

  @override
  void initState() {
    super.initState();
    checkLoginStatus();
  }

  Future<void> checkLoginStatus() async {
    isLoggedIn = await authManager.checkLoginStatus();
    isFirstTime = await authManager.checkisFirstTimeStatus();
    setState(() {}); // Update the state to reflect the login status change
  }

  @override
  Widget build(BuildContext context) {
    if (isFirstTime) {
      return SplashScreen();
    } else {
      if (!isLoggedIn) {
        return LoginPage(); // Se o usuário não estiver logado, retorna a página de login
      }
    }

    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        leading: IconButton(
          icon: const Icon(Icons.menu),
          iconSize: 30.0,
          color: Colors.white,
          onPressed: () {},
        ),
        title: Text(
          'Jurisconexão',
          style: TextStyle(
            fontSize: 28.0,
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        elevation: 0.0,
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.search),
            iconSize: 30.0,
            color: Colors.white,
            onPressed: () {},
          ),
        ],
      ),
      body: Column(
        children: <Widget>[
          CategorySelector(),
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomLeft,
                  colors: [
                    const Color(0xFF011C38),
                    Colors.black,
                  ],
                ),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30.0),
                  topRight: Radius.circular(30.0),
                ),
              ),
              child: Column(
                children: <Widget>[
                  FavoriteContacts(),
                  RecentChats(),
                ],
              ),
            ),
          ),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        tooltip: 'Increment',
        child: Icon(Icons.question_mark, size: 35.0),
        elevation: 1.0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16.0),
          side: BorderSide(
            color: Theme.of(context)
                .primaryColor, // Add your desired border color here
            width: 2.0, // Add your desired border width here
          ), // Add border radius here
          // Add other properties for border customization, such as side and color
        ),
      ),
      bottomNavigationBar: Container(
        height: 50.0, // Defina a altura desejada aqui
        child: BottomAppBar(
          shape: CircularNotchedRectangle(),
          color: Theme.of(context).primaryColor,
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.center,
            verticalDirection: VerticalDirection.down,
            textDirection: TextDirection.ltr,
            textBaseline: TextBaseline.alphabetic,
            children: <Widget>[
              IconButton(
                padding: EdgeInsets.zero,
                constraints: BoxConstraints(),
                icon: Icon(Icons.home, size: 25.0),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => ForgotPasswordScreen()),// NewSoliticitacion()),
                  );
                },
                color: Colors.white,
              ),
              IconButton(
                padding: EdgeInsets.zero,
                constraints: BoxConstraints(),
                icon: Icon(Icons.search, size: 25.0),
                onPressed: () {
                  // Add your logic here for the search button
                },
                color: Colors.white,
              ),
              IconButton(
                padding: EdgeInsets.zero,
                constraints: BoxConstraints(),
                icon: Icon(Icons.favorite, size: 0),
                onPressed: () {
                  // Add your logic here for the favorite button
                },
                color: Colors.transparent,
              ),
              IconButton(
                padding: EdgeInsets.zero,
                constraints: BoxConstraints(),
                icon: Icon(Icons.favorite, size: 25.0),
                onPressed: () {
                  // Add your logic here for the favorite button
                },
                color: Colors.white,
              ),
              IconButton(
                padding: EdgeInsets.zero,
                constraints: BoxConstraints(),
                icon: Icon(Icons.settings, size: 25.0),
                onPressed: () {
                  // Add your logic here for the settings button
                },
                color: Colors.white,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
