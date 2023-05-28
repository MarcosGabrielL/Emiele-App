import 'package:flutter/material.dart';
import 'package:jurisconexao_cliente/components/constant.dart';

import '../pages/login.dart';
import 'config/size_config.dart';

class NoAccountText extends StatelessWidget {
  const NoAccountText({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "Não Tem uma Conta? ",
          style: TextStyle(fontSize: getProportionateScreenWidth(16)),
        ),
        GestureDetector(
          onTap: () =>
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => LoginPage()),
              ),
          child: Text(
            "Cadastrar-se",
            style: TextStyle(
                fontSize: getProportionateScreenWidth(16),
                color: kPrimaryColor),
          ),
        ),
      ],
    );
  }
}