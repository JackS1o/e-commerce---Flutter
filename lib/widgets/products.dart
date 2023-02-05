import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:e_commerce/widgets/shopping_cart.dart';
import 'package:styled_widget/styled_widget.dart';
import '../screens/brazilian_product_details.dart';
import '../screens/european_product_details.dart';

class ShoppingCartModel with ChangeNotifier {
  final List<Map<String, dynamic>> _shoppingCart = [];

  List<Map<String, dynamic>> get shoppingCart => _shoppingCart;

  void addToCart(Map<String, dynamic> product) {
    _shoppingCart.add(product);
    notifyListeners();
  }

  void removeFromCart(Map<String, dynamic> product) {
    _shoppingCart.remove(product);
    notifyListeners();
  }
}

Widget buildProductsList(List products, BuildContext context) =>
    SingleChildScrollView(
      child: Wrap(
        direction: Axis.horizontal,
        spacing: 20,
        runSpacing: 20,
        children: List.generate(
          products.length,
          (index) => InkWell(
            onTap: () {
              int id = int.parse(products[index]['id']);
              if (products[index]['index'] < 159) {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ProductDetail(
                      productId: id,
                    ),
                  ),
                );
              } else {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => EuropeanProductDetail(
                      productId: id,
                    ),
                  ),
                );
              }
            },
            child: SizedBox(
              height: 300,
              width: 300,
              child: Card(
                child: Column(
                  children: [
                    Image.network(
                      products[index]['imagem'],
                      width: 200,
                      height: 200,
                      fit: BoxFit.contain,
                      loadingBuilder: (context, child, loadingProgress) =>
                          loadingProgress == null
                              ? child
                              : const CircularProgressIndicator(),
                    ),
                    Text(products[index]['nome']),
                    Text(
                        "R\$ ${products[index]['preco'].replaceAll(",", ".")}"),
                    Text(
                      products[index]['desconto'] != null
                          ? "Com desconto R\$ ${double.parse(products[index]['preco'].replaceAll(",", ".")) - double.parse(products[index]['desconto'].replaceAll(",", "."))}"
                          : '',
                      style: const TextStyle(color: Colors.red),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        ElevatedButton(
                          child: const Text('Carrinho',
                              style: TextStyle(fontSize: 12)),
                          onPressed: () {
                            Provider.of<ShoppingCartModel>(context,
                                    listen: false)
                                .addToCart(products[index]);
                          },
                        ).width(80),
                        ElevatedButton(
                          onPressed: () {
                            Provider.of<ShoppingCartModel>(context,
                                    listen: false)
                                .addToCart(products[index]);
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const ShoppingCartScreen(
                                    key: Key('shoppingCartScreen')),
                              ),
                            );
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor:
                                const Color.fromARGB(255, 241, 93, 93),
                          ),
                          child: const Text('Comprar',
                              style: TextStyle(fontSize: 12)),
                        ).width(80),
                      ],
                    ).alignment(Alignment.center),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    ).alignment(Alignment.center);
