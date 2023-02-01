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
          Map<String, int> itemCount = {};
          List<Map<String, dynamic>> uniqueItems = [];
          double total = 0;

          uniqueItems = shoppingCart.shoppingCart.toSet().toList();

          for (var item in shoppingCart.shoppingCart) {
            total += double.parse(item['preco'].replaceAll(",", "."));
            if (itemCount.containsKey(item['id'])) {
              itemCount[item['id']] = itemCount[item['id']]! + 1;
            } else {
              itemCount[item['id']] = 1;
            }
          }

          return Column(
            children: [
              Expanded(
                child: ListView.builder(
                  itemCount: uniqueItems.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      leading: Image.network(
                        uniqueItems[index]['imagem'],
                        width: 100,
                        height: 100,
                        fit: BoxFit.contain,
                      ),
                      title: Text(uniqueItems[index]['nome']),
                      subtitle: Text(
                          "${uniqueItems[index]['preco']} x ${itemCount[uniqueItems[index]['id']]}"),
                      trailing: SizedBox(
                        width: 100,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                        ),
                      ),
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
