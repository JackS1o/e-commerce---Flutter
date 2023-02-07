import 'package:e_commerce/api/requests.dart';
import 'package:e_commerce/widgets/products.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:styled_widget/styled_widget.dart';

import '../screens/home.dart';

class ShoppingCartScreen extends StatefulWidget {
  const ShoppingCartScreen({required Key key}) : super(key: key);

  @override
  _ShoppingCartScreenState createState() => _ShoppingCartScreenState();
}

class _ShoppingCartScreenState extends State<ShoppingCartScreen> {
  Map<String, int> itemCount = {};
  List<Map<String, dynamic>> uniqueItems = [];
  double total = 0;

  @override
  Widget build(BuildContext context) {
    final shoppingCart = Provider.of<ShoppingCartModel>(context);
    uniqueItems = shoppingCart.shoppingCart.toSet().toList();

    for (var item in shoppingCart.shoppingCart) {
      if (item['desconto'] != null) {
        total += double.parse(item['preco'].replaceAll(",", ".")) -
            double.parse(item['desconto'].replaceAll(",", "."));
      }
      total += double.parse(item['preco'].replaceAll(",", "."));
      if (itemCount.containsKey(item['id'])) {
        itemCount[item['id']] = itemCount[item['id']]! + 1;
      } else {
        itemCount[item['id']] = 1;
      }
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text("Carrinho de Compras"),
      ),
      body: Column(
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
                  subtitle: Text(uniqueItems[index]['desconto'] != null
                      ? "${double.parse(uniqueItems[index]['preco'].replaceAll(",", ".")) - double.parse(uniqueItems[index]['desconto'].replaceAll(",", "."))} x ${itemCount[uniqueItems[index]['id']]}"
                      : "${uniqueItems[index]['preco']} x ${itemCount[uniqueItems[index]['id']]}"),
                  trailing: SizedBox(
                    width: 100,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: <Widget>[
                        IconButton(
                          icon: const Icon(Icons.remove),
                          onPressed: () {
                            shoppingCart.removeFromCart(uniqueItems[index]);
                            setState(() {
                              itemCount = {};
                              total = 0;
                            });
                          },
                        ),
                        Text(itemCount[uniqueItems[index]['id']].toString()),
                        IconButton(
                          icon: const Icon(Icons.add),
                          onPressed: () {
                            shoppingCart.addToCart(uniqueItems[index]);
                            setState(() {
                              itemCount = {};
                              total = 0;
                            });
                          },
                        ),
                      ],
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
          ElevatedButton(
            onPressed: () {
              UserProducts.fetchUserProducts(
                uniqueItems,
                itemCount,
              );
              setState(() {
                shoppingCart.clearCart();
                itemCount = {};
                total = 0;
              });
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const HomeScreen(),
                ),
              );
            },
            child: const Text("Finalizar Compra"),
          ).padding(all: 20),
        ],
      ),
    );
  }
}
