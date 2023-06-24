import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../components/config/size_config.dart';

class Categories extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    List<Map<String, dynamic>> categories = [
      {"icon": "assets/icons/Flash Icon.svg", "text": "Civil"},
      {"icon": "assets/icons/Bill Icon.svg", "text": "Penal"},
      {"icon": "assets/icons/Game Icon.svg", "text": "Trabalhista"},
      {"icon": "assets/icons/Gift Icon.svg", "text": "Empresa"},
      {"icon": "assets/icons/Discover.svg", "text": "Tributário"},
      {"icon": "assets/icons/Flash Icon.svg", "text": "Ambiental"},
      {"icon": "assets/icons/Bill Icon.svg", "text": "Exterior"},
      {"icon": "assets/icons/Game Icon.svg", "text": "Adm"},
      {"icon": "assets/icons/Gift Icon.svg", "text": "Cliente"},
      {"icon": "assets/icons/Discover.svg", "text": "Previdência"},
    ];
    return SizedBox(
      height: getProportionateScreenWidth(100),
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: categories.length,
        itemBuilder: (context, index) => CategoryCard(
          icon: categories[index]["icon"],
          text: categories[index]["text"],
          press: () {},
        ),
      ),
    );
  }
}

class CategoryCard extends StatelessWidget {
  const CategoryCard({
    Key? key,
    required this.icon,
    required this.text,
    required this.press,
  }) : super(key: key);

  final String? icon, text;
  final GestureTapCallback press;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: press,
      child: SizedBox(
        width: getProportionateScreenWidth(75),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 5.0),
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.all(getProportionateScreenWidth(15)),
                height: getProportionateScreenWidth(55),
                width: getProportionateScreenWidth(55),
                decoration: BoxDecoration(
                  color: const Color(0xFFEADDFF),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Icon(Icons.question_mark), //SvgPicture.asset(icon!),
              ),
              SizedBox(height: 5),
              Text(text!,
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 13))
            ],
          ),
        ),
      ),
    );
  }
}
