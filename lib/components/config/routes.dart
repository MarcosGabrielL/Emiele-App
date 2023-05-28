import 'package:flutter/widgets.dart';

import '../../pages/login.dart';

// We use name route
// All our routes will be available here
final Map<String, WidgetBuilder> routes = {

  LoginPage.routeName: (context) => LoginPage(),
  
};