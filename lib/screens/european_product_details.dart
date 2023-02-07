import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:styled_widget/styled_widget.dart';

import '../api/requests.dart';
import '../widgets/products.dart';
import '../widgets/shopping_cart.dart';

class EuropeanProductDetail extends StatefulWidget {
  final int productId;

  const EuropeanProductDetail({super.key, required this.productId});

  @override
  State<EuropeanProductDetail> createState() => _EuropeanProductDetailState();
}

class _EuropeanProductDetailState extends State<EuropeanProductDetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Detalhes do Produto'),
        actions: <Widget>[
          Padding(
            padding: const EdgeInsets.only(right: 20.0),
            child: GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const ShoppingCartScreen(
                          key: Key('shoppingCartScreen')),
                    ),
                  );
                },
                child: const Icon(Icons.shopping_cart, size: 26.0)),
          )
        ],
      ),
      body: FutureBuilder(
        future: ProductDetailByIdEuropeanProvider.fetch(widget.productId),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return const Center(
              child: Text('Erro ao carregar dados'),
            );
          } else if (snapshot.hasData) {
            return SizedBox(
              height: double.infinity,
              width: 500,
              child: Card(
                child: Column(
                  children: [
                    Image.network(
                      snapshot.data!['imagem'],
                      width: 300,
                      height: 400,
                      fit: BoxFit.contain,
                      loadingBuilder: (context, child, loadingProgress) =>
                          loadingProgress == null
                              ? child
                              : const CircularProgressIndicator(),
                    ),
                    Text(snapshot.data!['nome']),
                    Text("R\$ ${snapshot.data!['preco']}"),
                    Text(
                      "Com desconto R\$ ${double.parse(snapshot.data!['preco'].replaceAll(",", ".")) - double.parse(snapshot.data!['desconto'].replaceAll(",", "."))}",
                      style: const TextStyle(color: Colors.red),
                    ),
                    Text(snapshot.data!['descricao']),
                    Text(snapshot.data!['categoria']),
                    const SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        ElevatedButton(
                          child: const Text('Adicionar ao Carrinho'),
                          onPressed: () {
                            Provider.of<ShoppingCartModel>(context,
                                    listen: false)
                                .addToCart(snapshot.data!);
                          },
                        ).width(200),
                        ElevatedButton(
                          onPressed: () {
                            Provider.of<ShoppingCartModel>(context,
                                    listen: false)
                                .addToCart(snapshot.data!);
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
                          child: const Text('Comprar'),
                        ).width(200),
                      ],
                    ).alignment(Alignment.center),
                  ],
                ),
              ),
            ).alignment(Alignment.center);
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}
