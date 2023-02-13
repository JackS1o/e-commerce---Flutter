import 'package:e_commerce/screens/profile.dart';
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
  String data = '';

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
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: const Text("Filtrar por:"),
                        content: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            RadioListTile(
                              value: 'false',
                              groupValue: data,
                              onChanged: (value) {
                                setState(() {
                                  data = value!;
                                });
                              },
                              title: const Text("Mais barato",
                                  style: TextStyle(
                                    color: Color.fromARGB(255, 153, 151, 51),
                                    fontWeight: FontWeight.bold,
                                  )),
                            ),
                            RadioListTile(
                              value: 'true',
                              groupValue: data,
                              onChanged: (value) {
                                setState(() {
                                  data = value!;
                                });
                              },
                              title: const Text("Mais caro",
                                  style: TextStyle(
                                    color: Color.fromARGB(255, 244, 139, 54),
                                    fontWeight: FontWeight.bold,
                                  )),
                            ),
                            RadioListTile(
                              value: 'vazio',
                              groupValue: data,
                              onChanged: (value) {
                                setState(() {
                                  data = value!;
                                });
                              },
                              title: const Text("Limpar filtro",
                                  style: TextStyle(
                                    color: Color.fromARGB(255, 244, 139, 54),
                                    fontWeight: FontWeight.bold,
                                  )),
                            ),
                          ],
                        ),
                        actions: [
                          ElevatedButton(
                            child: const Text("Ok"),
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                          ),
                        ],
                      );
                    },
                  );
                },
                child: const Icon(Icons.filter_alt, size: 26.0),
              ),
            ),
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
            ),
            Padding(
              padding: const EdgeInsets.only(right: 20.0),
              child: GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const UserProfile(
                        key: Key('userProfile'),
                      ),
                    ),
                  );
                },
                child: const Icon(Icons.person, size: 26.0),
              ),
            ),
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
              if (data == 'false') {
                snapshot.data.sort((a, b) => double.parse(a["preco"])
                    .compareTo(double.parse(b["preco"])));
                return buildProductsList(snapshot.data, context);
              } else if (data == 'true') {
                snapshot.data.sort((a, b) => double.parse(b["preco"])
                    .compareTo(double.parse(a["preco"])));
                return buildProductsList(snapshot.data, context);
              } else {
                return buildProductsList(snapshot.data, context);
              }
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
