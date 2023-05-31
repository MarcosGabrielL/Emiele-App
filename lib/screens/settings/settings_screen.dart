

import 'package:flutter/material.dart';
import 'package:jurisconexao_cliente/main.dart';
import 'package:jurisconexao_cliente/screens/settings/settings/settings.dart';
import '../../components/bottomnavigate_bar.dart';
import '../../components/config/size_config.dart';
import '../../components/constant.dart';
import '../../components/custom_floatingActionButton.dart';
import '../notification/notificationList.dart';
import 'components/about/about_screen.dart';
import 'components/callCenter/callCenter.dart';
import 'components/message/message.dart';
import 'components/orders/trackOrder.dart';
import 'components/payment/paymentDetails.dart';

class Account extends StatefulWidget {

  @override
  _AccountState createState() => _AccountState();
}

class _AccountState extends State<Account> {
  var scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: kWhiteColor,
      body: Column(
        children: [
          Stack(
            clipBehavior: Clip.none, alignment: Alignment.center,
            children: [
              Container(
                height: MediaQuery.of(context).size.height * 0.2,
                decoration: BoxDecoration(
                  color: Theme.of(context).primaryColor,
                  borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(30.0),
                    bottomLeft: Radius.circular(30.0),
                  ),
                ),

              ),
              Positioned(
                bottom: -60.0,
                child: Container(
                  height: 125.0,
                  width: 125.0,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100.0),
                    border: Border.all(
                      color: kWhiteColor,
                      width: kLess,
                    ),
                    image: DecorationImage(
                      image: AssetImage(profile),
                    ),
                  ),
                ),
              ),
              Positioned(
                bottom: -88.0,
                child: Text(
                  'Usuario',
                  style: kOrangeTextStyle,
                ),
              ),
            ],
          ),
          SizedBox(height: getProportionateScreenHeight(20)),
          Expanded(
            child: ListView.builder(
              padding: EdgeInsets.only(top: 88.0),
              itemCount: labels.length,
              itemBuilder: (context, index) {
                return ListTile(
                  // dense: true,
                    leading: Icon(
                      icons[index],
                      color: kPrimaryColor,
                    ),
                    title: Text(labels[index]),
                    onTap: () => Navigator.of(context)
                        .push(MaterialPageRoute(builder: (context) {
                      switch (labels[index]) {
                        case 'Notificações':
                          return NotificationList();
                          break;
                        case 'Formas de Pagamento':
                          return PaymentDetails();
                          break;
                        //case 'Message':
                          //return Message_config();
                          //break;
                        case 'Pagamentos':
                          return TrackOrder();
                          break;
                        case 'Configuração Conta':
                          return Setting();
                          break;
                        case 'Ajuda':
                          return CallCenter();
                        case 'Sobre':
                          return About();
                          break;
                        default:
                          return MyApp();
                      }
                    }))
                  // onTap: () => this.setState(
                  //   () {
                  //     switch (labels[index]) {
                  //       case 'Notifications':
                  //         return snackBarMsg(context, 'Notifications');
                  //         break;
                  //       case 'Payments':
                  //         return snackBarMsg(context, 'Payments');
                  //         break;
                  //       case 'Message':
                  //         return snackBarMsg(context, 'Message');
                  //         break;
                  //       case 'My Orders':
                  //         return snackBarMsg(context, 'My Orders');
                  //         break;
                  //       case 'Setting Account':
                  //         return snackBarMsg(context, 'Setting Account');
                  //         break;
                  //       case 'Call Center':
                  //         return snackBarMsg(context, 'Call Center');
                  //         break;
                  //       case 'About Application':
                  //         return snackBarMsg(context, 'About Application');
                  //         break;
                  //       default:
                  //         return snackBarMsg(context, 'Notifications');
                  //         break;
                  //     }
                  //   },
                  // ),
                );
              },
            ),
          ),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: CustomFloatingActionButton(),
      bottomNavigationBar: Container(
        height: 50.0, // Defina a altura desejada aqui
        child: CustomBottomAppBar(),
      ),
    );
  }

  snackBarMsg(BuildContext context, String msg) {
    var sb = SnackBar(
      elevation: kRadius,
      content: Text(msg),
      duration: Duration(seconds: 2),
      action: SnackBarAction(
        // textColor: kWhiteColor,
        label: 'OK',
        onPressed: () {},
      ),
    );
  }
}