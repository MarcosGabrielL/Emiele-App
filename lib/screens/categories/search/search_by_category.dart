import 'package:flutter/material.dart';
import 'package:jurisconexao_cliente/components/bottomnavigate_bar.dart';
import 'package:jurisconexao_cliente/components/constant.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../styles/colors.dart';
import '../styles/style.dart';

class CategoryPage extends StatelessWidget {
  const CategoryPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      body: Stack(children: [
        Align(
          alignment: Alignment.topCenter,
          child: Container(
              padding: const EdgeInsets.only(left: 24),
              height: size.height / 4,
              width: size.width,
              decoration:  BoxDecoration(
                  color: kPrimaryColor,
              ),
              child: SafeArea(
                child: Align(
                    alignment: Alignment.topCenter,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [

                            const SizedBox(
                              width: 12,
                            ),
                            Text('', style: AppStyle.m12w)
                          ],
                        ),
                        const SizedBox(
                          height: 12,
                        ),
                        Text(
                          'Refazer pedido com favotiro?',
                          style: AppStyle.b32w,
                        ),

                      ],
                    )),
              )),
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
            height: size.height - (size.height / 5),
            width: size.width,
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(34)
            ),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  // Adicione aqui os elementos que deseja exibir com scroll
                  // Exemplo de lista de teste
                  CourseCardRow(),
                  CourseCardRowInverted(),
                  CourseCardRow(),
                  CourseCardRowInverted(),

                  // ... adicione mais itens da lista aqui
                ],
              ),
            ),
          ),
        ),
      ]

      ),
      bottomNavigationBar: Container(
        height: 50.0, // Defina a altura desejada aqui
        child: CustomBottomAppBar(),
      ),
    );
  }
}

class LongCourseCard extends StatelessWidget {
  final Color background;
  final String title;
  final String subtitle;
  final String image;
  const LongCourseCard(
      {Key? key,
        required this.background,
        required this.title,
        required this.subtitle,
        required this.image})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 14),
      width: 155,
      height: 192,
      decoration: BoxDecoration(
          color: background,
          borderRadius: BorderRadius.circular(34),
          border: Border.all(color: Colors.white, width: 10),
          boxShadow: [
            BoxShadow(
                blurRadius: 50,
                color: const Color(0xFF0B0C2A).withOpacity(.09),
                offset: const Offset(10, 10))
          ]),
      child: Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
        const SizedBox(height: 16),
        Text(title, style: AppStyle.m12w),
        Text(subtitle, style: AppStyle.r10wt),
        Expanded(
          child: Stack(
            fit: StackFit.expand,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(24),
                  bottomRight: Radius.circular(24),
                ),
                child: Image.asset(
                  image,
                  fit: BoxFit.cover,
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      kSecondaryColor,
                      Colors.transparent,
                    ],
                  ),
                ),
              ),
            ],
          ),
        )]

      )

    );
  }
}

class ShortTopCourseCard extends StatelessWidget {
  final Color background;
  final String title;
  final String subtitle;
  final String image;
  const ShortTopCourseCard(
      {Key? key,
        required this.background,
        required this.title,
        required this.subtitle,
        required this.image})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 14),
      width: 155,
      height: 163,
      decoration: BoxDecoration(
          color: background,
          borderRadius: BorderRadius.circular(34),
          border: Border.all(color: Colors.white, width: 10),
          boxShadow: [
            BoxShadow(
                blurRadius: 50,
                color: const Color(0xFF0B0C2A).withOpacity(.09),
                offset: const Offset(10, 10))
          ]),
      child: Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
        const SizedBox(height: 16),
        Text(title, style: AppStyle.m12w),
        Text(subtitle, style: AppStyle.r10wt),
        Expanded(
          child: Stack(
            fit: StackFit.expand,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(24),
                  bottomRight: Radius.circular(24),
                ),
                child: Image.asset(
                  image,
                  fit: BoxFit.cover,
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      kSecondaryColor,
                      Colors.transparent,
                    ],
                  ),
                ),
              ),
            ],
          ),
        )
      ]),
    );
  }
}

class CourseCardRow extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        LongCourseCard(
        background: kSecondaryColor,
        title: 'Music Class',
        subtitle: '10 Course',
        image: 'assets/images/img1.png'
        ),
        SizedBox(width: 16), // Adicione um espaçamento entre os cards
        ShortTopCourseCard(
        background: kSecondaryColor,
    title: 'Music Class',
    subtitle: '10 Course',
    image: 'assets/images/img2.png'
        ),
      ],
    );
  }
}


class CourseCardRowInverted extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ShortTopCourseCard(
            background: kSecondaryColor,
            title: 'Music Class',
            subtitle: '10 Course',
            image: 'assets/images/img2.png'
        ),
        SizedBox(width: 16), // Adicione um espaçamento entre os cards
        LongCourseCard(
            background: kSecondaryColor,
            title: 'Music Class',
            subtitle: '10 Course',
            image: 'assets/images/img1.png'
        ),

      ],
    );
  }
}

