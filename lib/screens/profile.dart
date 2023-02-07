import 'package:flutter/material.dart';
import 'package:styled_widget/styled_widget.dart';

import '../api/requests.dart';

class UserProfile extends StatefulWidget {
  const UserProfile({super.key});

  @override
  State<UserProfile> createState() => _UserProfileState();
}

class _UserProfileState extends State<UserProfile> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Perfil',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Perfil'),
        ),
        body: FutureBuilder(
          future: GetUserProducts.getUserProducts(),
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              return const Center(
                child: Text('Erro ao carregar dados'),
              );
            } else if (snapshot.hasData) {
              return SingleChildScrollView(
                child: Wrap(
                  direction: Axis.horizontal,
                  spacing: 20,
                  runSpacing: 20,
                  children: List.generate(
                    snapshot.data.length,
                    (index) => InkWell(
                      child: SizedBox(
                        height: 300,
                        width: 300,
                        child: Card(
                          child: Column(
                            children: [
                              Image.network(
                                snapshot.data[index]['image'],
                                width: 200,
                                height: 200,
                                fit: BoxFit.contain,
                                loadingBuilder: (context, child,
                                        loadingProgress) =>
                                    loadingProgress == null
                                        ? child
                                        : const CircularProgressIndicator(),
                              ),
                              Text(snapshot.data[index]['name']),
                              Text(
                                  "R\$ ${snapshot.data[index]['price'].replaceAll(",", ".")}"),
                            ],
                          ),
                        ),
                      ),
                    ),
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
      ),
    );
  }
}
