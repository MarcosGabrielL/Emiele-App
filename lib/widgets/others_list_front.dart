import 'package:flutter/material.dart';
import 'package:jurisconexao_cliente/models/message_model.dart';
import 'package:jurisconexao_cliente/screens/chat_screen.dart';
import 'package:jurisconexao_cliente/widgets/popular_cards.dart';

import '../components/config/size_config.dart';
import '../screens/details/details_screen.dart';
import 'cards_horizontal.dart';

class ListFront extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        decoration: BoxDecoration(
          color: Colors.transparent,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30.0),
            topRight: Radius.circular(30.0),
          ),
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30.0),
            topRight: Radius.circular(30.0),
          ),
          child: ListView.builder(
            itemCount: 1,
            itemBuilder: (BuildContext context, int index) {
              final Message chat = chats[index];
              return GestureDetector(
                onTap: () => (
                ),
                child: Container(
                  margin: EdgeInsets.only(top: 5.0, bottom: 5.0, right: 0.0),
                  padding:
                  EdgeInsets.symmetric(horizontal: 0.0, vertical: 0.0),
                  decoration: BoxDecoration(
                    color: Colors.transparent,
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(20.0),
                      bottomRight: Radius.circular(20.0),
                    ),
                  ),
                  child: Column(
                    children: [
                      SpecialParaVoce(),
                      SizedBox(height: getProportionateScreenWidth(40)),
                      PopularSearchs(),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
