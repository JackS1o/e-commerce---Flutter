import 'package:e_commerce/widgets/products.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ShoppingCartScreen extends StatelessWidget {
  const ShoppingCartScreen({required Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Carrinho de Compras"),
      ),
      body: Consumer<ShoppingCartModel>(
        builder: (context, shoppingCart, child) {
          double total = 0;
          for (var item in shoppingCart.shoppingCart) {
            total += double.parse(item['preco'].replaceAll(",", "."));
          }

          return Column(
            children: [
              Expanded(
                child: ListView.builder(
                  itemCount: shoppingCart.shoppingCart.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      leading: Image.network(
                        shoppingCart.shoppingCart[index]['imagem'],
                        width: 100,
                        height: 100,
                        fit: BoxFit.contain,
                      ),
                      title: Text(shoppingCart.shoppingCart[index]['nome']),
                      subtitle: Text(shoppingCart.shoppingCart[index]['preco']),
                    );
                  },
                ),
              ),
              Container(
                padding: const EdgeInsets.all(20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text("Total: "),
                    Text("R\$ ${total.toStringAsFixed(2)}"),
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
