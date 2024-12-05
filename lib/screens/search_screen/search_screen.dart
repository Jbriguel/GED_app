import 'package:flutter/material.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  @override
  Widget build(BuildContext context) {
    return MediaQuery(
      data: MediaQuery.of(context)
          .copyWith(textScaler: const TextScaler.linear(1)),
      child: Scaffold(
        appBar: AppBar(
          surfaceTintColor: Colors.white,
          backgroundColor: Colors.white,
          automaticallyImplyLeading: true,
          elevation: 1.0,
          centerTitle: true,
          title: const Text(
            "Rechercher",
            style: TextStyle(
                color: Colors.black, fontFamily: "Aller", fontSize: 15),
          ),
        ),
        body: Center(),
      ),
    );
  }
}
