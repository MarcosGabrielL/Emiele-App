
import '../../models/Cart.dart';

class CartUtil {

   static double calculateValorTotalItens(List<Cart> cartList) {
    double total = 0.0;

    for (var cart in cartList) {
      double price = double.parse(cart.product.precoun);
      total += price * cart.numOfItem;
    }

    return total;
  }

   static int calculateNumTotalItens(List<Cart> cartList) {
     int total = 0;

     for (var cart in cartList) {

       total += total + cart.numOfItem;
     }

     return total;
   }

   static List<Cart> addOrUpdateCartItem(List<Cart> cartList, Cart newItem) {
     // Verifica se o item já existe na lista
     bool itemExists = false;
     for (var cart in cartList) {
       if (cart.product.id == newItem.product.id) {
         cartList.remove(cart);
         break;
       }
     }

       cartList.add(newItem);


     for (var cart in cartList) {
       print("${cart.product.codigo}: ${cart.numOfItem}");
     }

     return cartList;

   }

}