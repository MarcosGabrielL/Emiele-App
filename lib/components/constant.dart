import 'package:flutter/material.dart';
import 'package:jurisconexao_cliente/components/config/size_config.dart';

import '../models/TrackOrderModal.dart';
import '../models/cartModal.dart';
import '../models/paymentModal.dart';
import '../models/recommendedModal.dart';
import '../models/reviewModal.dart';

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


final trackOrderList = [
  TrackOrderModal(
      icon: Icons.card_travel,
      title: "Ready to Pickup",
      subtitle: "Order from E-Commerce",
      time: "08.00"),
  TrackOrderModal(
      icon: Icons.person,
      title: "Order Processed",
      subtitle: "We are preparing your order",
      time: "09.50"),
  TrackOrderModal(
      icon: Icons.payment,
      title: "Payment Confirmed",
      subtitle: "Awaiting Confirmation",
      time: "11.30"),
  TrackOrderModal(
      icon: Icons.receipt,
      title: "Order Placed",
      subtitle: "We have received your order",
      time: "02.15"),
];

final paymentDetailList = [
  PaymentModal(
      date: "Jan 01",
      details: "Buy IPhoneX",
      amount: 1000.0,
      textColor: Colors.red),
  PaymentModal(
      date: "Aug 15",
      details: "Flat ₹650 off",
      amount: 650.0,
      textColor: Colors.green),
  PaymentModal(
      date: "Dec 03",
      details: "Congrats! Flat ₹180",
      amount: 180.0,
      textColor: Colors.green),
  PaymentModal(
      date: "Feb 14",
      details: "Buy Shoes Upto 50% Off",
      amount: 540.0,
      textColor: Colors.red),
  PaymentModal(
      date: "Sep 08",
      details: "Buy Footwear on Discount",
      amount: 210.0,
      textColor: Colors.red),
  PaymentModal(
      date: "Apr 18",
      details: "Congrats! ₹375 Rewarded",
      amount: 375.0,
      textColor: Colors.green),
];

final reviewList = [
  ReviewModal(
    image: "assets/images/mensFashion.jpg",
    name: "John Travolta",
    rating: 3.5,
    date: "01 Jan 2021",
    comment:
    "Lorem Ipsum is simply dummy text of the printing and typesetting industry.",
  ),
  ReviewModal(
    image: "assets/images/girlsFashion.jpg",
    name: "Scarlett Johansson",
    rating: 2.5,
    date: "21 Feb 2021",
    comment:
    "Lorem Ipsum is simply dummy text of the printing and typesetting industry.",
  ),
  ReviewModal(
    image: "assets/images/user1.jpg",
    name: "Jennifer Lawrence",
    rating: 4.5,
    date: "17 Mar 2021",
    comment:
    "Lorem Ipsum is simply dummy text of the printing and typesetting industry.",
  ),
  ReviewModal(
    image: "assets/images/user11.jpg",
    name: "Michael Jordan",
    rating: 1.5,
    date: "12 Apr 2021",
    comment:
    "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.",
  ),
  ReviewModal(
    image: "assets/images/user2.jpg",
    name: "Nicole Kidman",
    rating: 2.0,
    date: "28 May 2021",
    comment:
    "Lorem Ipsum is simply dummy text of the printing and typesetting industry.",
  ),
  ReviewModal(
    image: "assets/images/user10.jpg",
    name: "James Franco",
    rating: 4.0,
    date: "14 Nov 2020",
    comment:
    "Lorem Ipsum is simply dummy text of the printing and typesetting industry.",
  ),
  ReviewModal(
    image: "assets/images/user3.jpg",
    name: "Margot Robbie",
    rating: 1.0,
    date: "14 Nov 2020",
    comment:
    "Lorem Ipsum is simply dummy text of the printing and typesetting industry.",
  ),
  ReviewModal(
    image: "assets/images/user9.jpg",
    name: "Nicolas Cage",
    rating: 3.0,
    date: "14 Nov 2020",
    comment:
    "Lorem Ipsum is simply dummy text of the printing and typesetting industry.",
  ),
  ReviewModal(
    image: "assets/images/user4.jpg",
    name: "Emma Stone",
    rating: 5.0,
    date: "14 Nov 2020",
    comment:
    "Lorem Ipsum is simply dummy text of the printing and typesetting industry.",
  ),
  ReviewModal(
    image: "assets/images/user8.jpg",
    name: "Johnny Depp",
    rating: 3.5,
    date: "14 Nov 2020",
    comment:
    "Lorem Ipsum is simply dummy text of the printing and typesetting industry.",
  ),
  ReviewModal(
    image: "assets/images/user5.jpg",
    name: "Natalie Portman",
    rating: 3.5,
    date: "14 Nov 2020",
    comment:
    "Lorem Ipsum is simply dummy text of the printing and typesetting industry.",
  ),
  ReviewModal(
    image: "assets/images/user7.jpg",
    name: "Anne Hathaway",
    rating: 3.5,
    date: "14 Nov 2020",
    comment:
    "Lorem Ipsum is simply dummy text of the printing and typesetting industry.",
  ),
  ReviewModal(
    image: "assets/images/user6.jpg",
    name: "Charlize Theron",
    rating: 3.5,
    date: "14 Nov 2020",
    comment:
    "Lorem Ipsum is simply dummy text of the printing and typesetting industry.",
  ),
];

final cartItems = [
  CartModal(
      image: "assets/images/iMac.jpg",
      title: "Apple iMac All-In-One Desktop",
      desc: "60.96 cm (24-inch) (8-core Apple M1 chip/8 GB/256 GB), MJV93HN/A",
      price: 1712.34,
      quantity: 0),
  CartModal(
      image: "assets/images/watch.jpg",
      title: "SEIKO",
      desc: "Presage SRPD37J1",
      price: 557.84,
      quantity: 0),
  CartModal(
      image: "assets/images/book.jpg",
      title: "Carpe Diem",
      desc: "Paperback – Import, 26 May 2009",
      price: 24.89,
      quantity: 0),
  CartModal(
      image: "assets/images/joyStick.jpg",
      title: "Xbox Wireless Controller",
      desc: "Carbon Black",
      price: 76.12,
      quantity: 0),
  CartModal(
      image: "assets/images/shoes.jpg",
      title: "Nike Air Max 270",
      desc: "React Marathon Running Shoes/Sneakers Multi-Color DA2610-161",
      price: 120.00,
      quantity: 0),
  CartModal(
      image: "assets/images/dumbbell.jpg",
      title: "Cockatoo Dumbbell",
      desc: "Rubber Coated Professional Hex Dumbbell Set",
      price: 78.56,
      quantity: 0),
  CartModal(
      image: "assets/images/football.jpg",
      title: "Nivia Simbolo Football",
      desc: "Size 5 (White/Yellow)",
      price: 18.00,
      quantity: 0),
  CartModal(
      image: "assets/images/shirt.jpg",
      title: "Checked Casual Shirt",
      desc: "Flying Machine Men Yellow & Blue Regular Fit",
      price: 21.45,
      quantity: 0),
  CartModal(
      image: "assets/images/furniture.jpg",
      title: "Wolper Lounge Chair",
      desc: "Ivory Nude",
      price: 315.00,
      quantity: 0),
  CartModal(
      image: "assets/images/headPhone.jpg",
      title: "Sony WH-XB700 Wireless Bluetooth Headphones",
      desc:
      "Extra Bass Headphones with 30 Hours Battery Life, Passive Operation, Quick Charge, Headset with mic for Phone Calls with Alexa - (Black)",
      price: 128.26,
      quantity: 0),
  CartModal(
      image: "assets/images/camera.jpg",
      title: "Canon EOS M50 Mirrorless Camera",
      desc: "Camera with 15-45 mm Lens Kit",
      price: 756.22,
      quantity: 0),
];


final recommendedList = [
  RecommendedModal(
      image: "assets/images/iMac.jpg",
      title: "Apple iMac All-In-One Desktop",
      price: 1712.34,
      rating: 7.8,
      sale: 449),
  RecommendedModal(
      image: "assets/images/watch.jpg",
      title: "SEIKO",
      price: 557.84,
      rating: 4.2,
      sale: 249),
  RecommendedModal(
      image: "assets/images/book.jpg",
      title: "Carpe Diem",
      price: 24.89,
      rating: 5.6,
      sale: 223),
  RecommendedModal(
      image: "assets/images/joyStick.jpg",
      title: "Xbox Wireless Controller",
      price: 76.12,
      rating: 8.9,
      sale: 826),
  RecommendedModal(
      image: "assets/images/shoes.jpg",
      title: "Nike Air Max 270",
      price: 120.00,
      rating: 7.6,
      sale: 924),
  RecommendedModal(
      image: "assets/images/dumbbell.jpg",
      title: "Cockatoo Dumbbell",
      price: 78.56,
      rating: 6.6,
      sale: 762),
  RecommendedModal(
      image: "assets/images/football.jpg",
      title: "Nivia Simbolo Football",
      price: 18.00,
      rating: 5.5,
      sale: 456),
  RecommendedModal(
      image: "assets/images/shirt.jpg",
      title: "Checked Casual Shirt",
      price: 21.45,
      rating: 7.8,
      sale: 685),
  RecommendedModal(
      image: "assets/images/furniture.jpg",
      title: "Wolper Lounge Chair",
      price: 315.00,
      rating: 7.9,
      sale: 528),
  RecommendedModal(
      image: "assets/images/headPhone.jpg",
      title: "Sony WH-XB700 Wireless Bluetooth Headphones",
      price: 128.26,
      rating: 8.4,
      sale: 785),
  RecommendedModal(
      image: "assets/images/camera.jpg",
      title: "Canon EOS M50 Mirrorless Camera",
      price: 756.22,
      rating: 8.8,
      sale: 864),
];