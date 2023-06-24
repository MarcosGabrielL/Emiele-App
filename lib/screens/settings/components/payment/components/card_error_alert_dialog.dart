import 'package:flutter/material.dart';

class CardErrorAlertDialog extends StatelessWidget {
  const CardErrorAlertDialog({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
        content: Stack(
          clipBehavior: Clip.none,
          children: [
            Positioned(
              right: 80.0,
              top: -90.0,
              child: Image.asset(
                'assets/images/close.png',
                height: 90,
                width: 90,
              ),
            ),
            Positioned(
              right: -40.0,
              top: -40.0,
              child: InkResponse(
                onTap: () {
                  Navigator.of(context).pop();
                },
                child: const CircleAvatar(
                  backgroundColor: Colors.transparent,
                  child: Icon(Icons.close, color: Colors.white),
                ),
              ),
            ),
            Column(
              mainAxisSize: MainAxisSize.min,
              children: const [
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    'Erro ao Adicionar o Cartão',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.green,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    'Tente novamente ou entre em contato com seu banco',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                  ),
                ),
              ],
            ),
          ],
        ));
  }
}