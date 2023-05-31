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

const kAccentColor = Color(0xFFF1F1F1);
const kWhiteColor = Color(0xFFFFFFFF);
const kLightColor = Color(0xFF808080);
const kDarkColor = Color(0xFF303030);
const kTransparent = Colors.transparent;

const kDefaultPadding = 24.0;
const kLessPadding = 10.0;
const kFixPadding = 16.0;
const kLess = 4.0;

const kShape = 30.0;

const kRadius = 0.0;
const kAppBarHeight = 56.0;
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



const kHeadTextStyle = TextStyle(
  fontSize: 24.0,
  fontWeight: FontWeight.bold,
);

const kSubTextStyle = TextStyle(
  fontSize: 18.0,
  color: kLightColor,
);

const kTitleTextStyle = TextStyle(
  fontSize: 20.0,
  color: kPrimaryColor,
);

const kDarkTextStyle = TextStyle(
  fontSize: 20.0,
  color: kDarkColor,
);

const kDivider = Divider(
  color: kAccentColor,
  thickness: kLessPadding,
);

const kSmallDivider = Divider(
  color: kAccentColor,
  thickness: 5.0,
);

const String pieChart = 'assets/images/pieChart.png';
const String trophy = 'assets/images/trophy.png';
const String chat = 'assets/images/chat.png';
const String whiteShape = 'assets/images/whitebg.svg';
const String logo = 'assets/images/shoppingBag.png';
const String profile = 'assets/images/profile.jpg';
const String bg = 'assets/images/background.jpg';
const String manShoes = 'assets/images/manShoes.jpg';
const String success = 'assets/images/success.gif';
const String chatBubble = 'assets/images/emptyChat.png';
const String emptyOrders = 'assets/images/orders.png';
const String callCenter = 'assets/images/center.png';
const String conversation = 'assets/images/conversation.png';

List<Map<String, String>> introData = [
  {
    'image': pieChart,
    'headText': 'Track your routine',
    'descText':
    "Whether it's sets, reps, weight used, you can track it all with our intuitive interface.",
  },
  {
    'image': trophy,
    'headText': 'Set personal goals',
    'descText':
    "We're all in the gym for a reason: goals. set goals for diet and fitness.",
  },
  {
    'image': chat,
    'headText': 'Chat with others',
    'descText': "Inspire and help each other reach fitness and diet goals.",
  },
];

final labels = [
  'Notifications',
  'Payments',
  'Message',
  'My Orders',
  'Setting Account',
  'Call Center',
  'About Application',
];

final icons = [
  Icons.notifications,
  Icons.payment,
  Icons.message,
  Icons.local_dining,
  Icons.settings,
  Icons.person,
  Icons.info,
];

final paymentLabels = [
  'Credit card / Debit card',
  'Cash on delivery',
  'Paypal',
  'Google wallet',
];

final paymentIcons = [
  Icons.credit_card,
  Icons.money_off,
  Icons.payment,
  Icons.account_balance_wallet,
];

final settingLabel = [
  'Account',
  'Address',
  'Telephone',
  'Email',
  'Setting',
  'Order Notifications',
  'Discount Notifications',
  'Credit Card',
  'Logout',
];

List<String> chipsMobile = [
  "IPhone",
  "Samsung",
  "OnePlus",
  "RealMe",
  "Xiomi",
  "Oppo",
  "Vivo",
];

List<String> chipsCategory = [
  "Mobiles",
  "Cloths",
  "Electronics",
  "Furnitures",
  "Shoes",
  "Laptops",
  "Watches",
];

final List<String> sliderImages = [
  "assets/images/books.jpg",
  "assets/images/cameras.jpg",
  "assets/images/mensShoes.jpg",
  "assets/images/watches.jpg",
  "assets/images/headphones.jpg",
  "assets/images/girlsFootwear.jpg",
  "assets/images/joysticks.jpg",
  "assets/images/desktop.jpg",
  "assets/images/gymEquipments.jpg",
];

final menuLabels = [
  'Camera',
  "Furniture",
  'Headphone',
  'Gaming',
  'Fashion',
  'Health Care',
  'Computer',
  'Equipment',
  'Sport',
  'Ticket',
  'Books',
  'Cloths',
];

final menuIcons = [
  Icons.camera,
  Icons.home,
  Icons.headset,
  Icons.games,
  Icons.format_shapes,
  Icons.healing,
  Icons.computer,
  Icons.equalizer,
  Icons.gamepad,
  Icons.traffic,
  Icons.book,
  Icons.collections,
];
