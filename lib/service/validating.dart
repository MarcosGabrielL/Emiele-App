import 'package:flutter/material.dart';

import 'package:flutter/material.dart';
import 'package:jurisconexao_cliente/service/SnackBar.dart';

class Validation {

  static bool isEmailValid(String email) {
    // Expressão regular para validar o formato de email
    final emailRegex = RegExp(r'^[\w-]+(\.[\w-]+)*@([\w-]+\.)+[a-zA-Z]{2,7}$');
    return emailRegex.hasMatch(email);
  }

  static bool isPhoneValid(String phone) {
    // Expressão regular para validar o formato de email
    final phoneValidatorRegExp = RegExp(r'^\+55\d{8,}$');
    return phoneValidatorRegExp.hasMatch(phone);
  }

   static bool isPasswordValid(String password) {
    return password.length >= 8;
  }

   static bool validateFields(BuildContext context, String email, String password, String number, int code) {

    if (!isEmailValid(email)) {
      // Email inválido
      Message.showSnackBar(context, 02);
      return false;
    } else if (!isPasswordValid(password)) {
      // Senha com menos de 8 caracteres
      Message.showSnackBar(context, 01);
      return false;
    } else {
      if(isPhoneValid(number) && code == 02){
        return false;
      }else {
        // Campos válidos, continuar com a lógica desejada
        return true;
      }
    }
  }

}