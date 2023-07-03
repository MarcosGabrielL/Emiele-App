
import '../../service/Produto.dart';
import 'ProdutoDTO.dart';
import 'Venda.dart';

class RequestWrapper {
  List<ProdutoDTO> produtos;
  Venda vendas;

  RequestWrapper({
    required this.produtos,
    required this.vendas,
  });

  Object? toJson() {}
}