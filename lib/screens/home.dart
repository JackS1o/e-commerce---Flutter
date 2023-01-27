import 'package:flutter/material.dart';
import '../api/requests.dart';

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
        ),
        body: FutureBuilder(
          future: DataProvider.fetchData(),
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              return const Center(
                child: Text('Erro ao carregar dados'),
              );
            } else if (snapshot.hasData) {
              return ListView.builder(
                itemCount: snapshot.data.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(snapshot.data[index]['nome']),
                    subtitle: Text(snapshot.data[index]['descricao']),
                    leading: Image.network(snapshot.data[index]['imagem']),
                    trailing: Text(snapshot.data[index]['preco']),
                  );
                },
              );
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
