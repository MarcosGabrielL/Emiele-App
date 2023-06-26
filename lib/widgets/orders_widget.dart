import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:jurisconexao_cliente/screens/categories/styles/colors.dart';

import '../../../components/config/size_config.dart';
class Orders extends StatelessWidget {
  const Orders({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Column(
        children: [
          OrdersCard(
            id: 1,
            totalPrice: 34.23,
            date: '23/06/2023',
            category: 'Cancelado',
            image:  AppColors.orange,
            numOfBrands: 4,
            press: () {},
          ),
          OrdersCard(
            id: 1,
            totalPrice: 34.23,
            date: '23/06/2023',
            category: 'Aberto',
            image:  AppColors.pink,
            numOfBrands: 4,
            press: () {},
          ),
          OrdersCard(
            id: 1,
            totalPrice: 34.23,
            date: '23/06/2023',
            category: 'Aguardando',
            image: AppColors.purple,
            numOfBrands: 4,
            press: () {},
          ),
          OrdersCard(
            id: 1,
            totalPrice: 34.23,
            date: '23/06/2023',
            category: 'finalizado',
            image: Colors.white, //AppColors.orange,
            numOfBrands: 4,
            press: () {},
          ),
          OrdersCard(
            id: 1,
            totalPrice: 34.23,
            date: '23/06/2023',
            category: 'finalizado',
            image: Colors.white, //AppColors.pink,
            numOfBrands: 4,
            press: () {},
          ),
          OrdersCard(
            id: 1,
            totalPrice: 34.23,
            date: '23/06/2023',
            category: 'finalizado',
            image: Colors.white, //AppColors.purple,
            numOfBrands: 4,
            press: () {},
          ),
          SizedBox(height: getProportionateScreenWidth(20)),
        ],
      ),
    );
  }
}

class OrdersCard extends StatelessWidget {
  const OrdersCard({
    Key? key,
    required this.id,
    required this.totalPrice,
    required this.date,
    required this.category,
    required this.image,
    required this.numOfBrands,
    required this.press,
  }) : super(key: key);

  final double totalPrice;
  final String category,date;
  final Color image;
  final int numOfBrands;
  final int id;
  final GestureTapCallback press;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(
        getProportionateScreenWidth(20),
        getProportionateScreenWidth(10),
        getProportionateScreenWidth(20),
        getProportionateScreenWidth(10),
      ),
      child: GestureDetector(
        onTap: press,
        child: SizedBox(
          width: SizeConfig.screenWidth * 0.9,
          height: getProportionateScreenWidth(150),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Stack(
              children: [
                ClipRect(
                  child: Container(
                    color: image,
                    width: double.infinity,
                    height: double.infinity,
                  ),
                ),

                Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Color(0xFF343434).withOpacity(0.4),
                        Color(0xFF343434).withOpacity(0.15),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: getProportionateScreenWidth(15.0),
                    vertical: getProportionateScreenWidth(20),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Status: $category',
                        style: TextStyle(
                          fontSize: getProportionateScreenWidth(14),
                          fontWeight: FontWeight.bold,
                          color: category != 'finalizado' ? Colors.white : Colors.black,
                        ),
                      ),
                      SizedBox(height: 5),
                      Text(
                        'Total: \$${totalPrice.toStringAsFixed(2)}',
                        style: TextStyle(
                          fontSize: getProportionateScreenWidth(14),
                          color: category != 'finalizado' ? Colors.white : Colors.black,
                        ),
                      ),
                      SizedBox(height: 10),
                      Text(
                        'Date: $date',
                        style: TextStyle(
                          fontSize: getProportionateScreenWidth(14),
                          color: category != 'finalizado' ? Colors.white : Colors.black,
                        ),
                      ),
                      SizedBox(height: 10),
                      Row(
                        children: [
                          Expanded(
                            child: Text(
                              'Leave a Review',
                              style: TextStyle(
                                fontSize: getProportionateScreenWidth(14),
                                color: category != 'finalizado' ? Colors.white : Colors.black,
                              ),
                            ),
                          ),
                          Icon(
                            Icons.star,
                            color: Colors.yellow,
                          ),
                          Icon(
                            Icons.star,
                            color: Colors.yellow,
                          ),
                          Icon(
                            Icons.star,
                            color: Colors.yellow,
                          ),
                          Icon(
                            Icons.star,
                            color: Colors.yellow,
                          ),
                          Icon(
                            Icons.star_border,
                            color: Colors.yellow,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }


}