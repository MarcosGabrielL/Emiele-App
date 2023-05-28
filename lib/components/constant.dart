import 'package:flutter/material.dart';
import 'package:jurisconexao_cliente/components/config/size_config.dart';

const kPrimaryColor =  const Color(0xFF011C38);
const kPrimaryLightColor = Color(0xFFFFECDF);
const kPrimaryGradientColor = LinearGradient(
  begin: Alignment.topLeft,
  end: Alignment.bottomRight,
  colors: [Color(0xFFFFA53E), Color(0xFFFF7643)],
);
const kSecondaryColor = Color(0xFF979797);
const kTextColor = Color(0xFF757575);

const kAnimationDuration = Duration(milliseconds: 200);

final headingStyle = TextStyle(
  fontSize: getProportionateScreenWidth(28),
  fontWeight: FontWeight.bold,
  color: Colors.black,
  height: 1.5,
);

const defaultDuration = Duration(milliseconds: 250);

// Form Error
final RegExp emailValidatorRegExp =
RegExp(r"^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
final RegExp phoneValidatorRegExp = RegExp(r'^\+55\d{8,}$');
final  RegExp passValidatorRegExp = RegExp(r'^\+55\d{8,}$');
const String kEmailNullError = "Por favor digite seu email";
const String kInvalidEmailError = "Please Enter Valid Email";
const String kPassNullError = "Please Enter your password";
const String kShortPassError = "Password is too short";
const String kMatchPassError = "Passwords don't match";
const String kNamelNullError = "Please Enter your name";
const String kPhoneNumberNullError = "Please Enter your phone number";
const String kAddressNullError = "Please Enter your address";

final otpInputDecoration = InputDecoration(
  contentPadding:
  EdgeInsets.symmetric(vertical: getProportionateScreenWidth(15)),
  border: outlineInputBorder(),
  focusedBorder: outlineInputBorder(),
  enabledBorder: outlineInputBorder(),
);

OutlineInputBorder outlineInputBorder() {
  return OutlineInputBorder(
    borderRadius: BorderRadius.circular(getProportionateScreenWidth(15)),
    borderSide: BorderSide(color: kTextColor),
  );
}


const avatarList = [
  {
    'avatar': 'assets/avatar-0.png',
  },
  {
    'avatar': 'assets/avatar-1.png',
  },
  {
    'avatar': 'assets/avatar-2.png',
  },
  {
    'avatar': 'assets/avatar-3.png',
  },
  {
    'avatar': 'assets/avatar-4.png',
  },
  {
    'avatar': 'assets/avatar-5.png',
  },
  {
    'avatar': 'assets/avatar-1.png',
  },
  {
    'avatar': 'assets/avatar-2.png',
  },
];

const userList = [
  {
    'avatar': 'assets/avatar-1.png',
    'name': 'Justin O\'Moore',
    'message': 'Hey there! whats up? Is everything fine ',
    'time': '18:35'
  },
  {
    'avatar': 'assets/avatar-2.png',
    'name': 'Batman',
    'message': 'Hey there! whats up? Is everything fine ',
    'time': '18:36'
  },
  {
    'avatar': 'assets/avatar-3.png',
    'name': 'Justin O\'Moore',
    'message': 'Hey there! whats up? Is everything fine ',
    'time': '18:37'
  },
  {
    'avatar': 'assets/avatar-4.png',
    'name': 'Justin O\'Moore',
    'message': 'Hey there! whats up? Is everything fine ',
    'time': '18:38'
  },
  {
    'avatar': 'assets/avatar-5.png',
    'name': 'Justin O\'Moore',
    'message': 'Hey there! whats up? Is everything fine ',
    'time': '18:39'
  },
  {
    'avatar': 'assets/avatar-1.png',
    'name': 'Justin O\'Moore',
    'message': 'Hey there! whats up? Is everything fine ',
    'time': '18:40'
  },
  {
    'avatar': 'assets/avatar-2.png',
    'name': 'Justin O\'Moore',
    'message': 'Hey there! whats up? Is everything fine ',
    'time': '18:41'
  },
];

const messages = [
  {
    'from': 'sender',
    'message': 'hi',
    'time': '18:35',
  },
  {
    'from': 'receiver',
    'message': 'hello',
    'time': '18:36',
  },
  {
    'from': 'sender',
    'message': 'whats up! where are you?',
    'time': '18:37',
  },
  {
    'from': 'receiver',
    'message': 'Fine. I am in Banaglore',
    'time': '18:38',
  },
  {
    'from': 'sender',
    'message': 'How is your life going man',
    'time': '18:39',
  },
  {
    'from': 'receiver',
    'message': 'Going well. I am planning to move in mumbai. let see what happen',
    'time': '18:40',
  },
  {
    'from': 'sender',
    'message': 'Thats great',
    'time': '18:41',
  },
  {
    'from': 'receiver',
    'message': 'Hmmm',
    'time': '18:42',
  },
  {
    'from': 'sender',
    'message': 'ok',
    'time': '18:43',
  },
  {
    'from': 'receiver',
    'message': 'bye',
    'time': '18:44',
  },



];