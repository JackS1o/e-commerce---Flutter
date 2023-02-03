import 'package:flutter/material.dart';
import '../api/requests.dart';
import '../widgets/products.dart';
import '../widgets/shopping_cart.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    DataProvider.fetchData();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'E-Commerce',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('E-Commerce'),
          actions: <Widget>[
            Padding(
              padding: const EdgeInsets.only(right: 20.0),
              child: GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const ShoppingCartScreen(
                        key: Key('shoppingCartScreen'),
                      ),
                    ),
                  );
                },
                child: const Icon(Icons.shopping_cart, size: 26.0),
              ),
            )
          ],
        ),
        body: FutureBuilder(
          future: DataConcact.fetchAllData(),
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              return const Center(
                child: Text('Erro ao carregar dados'),
              );
            } else if (snapshot.hasData) {
              return buildProductsList(snapshot.data, context);
            } else {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
          },
        ),
      ),
    );
  }
}
