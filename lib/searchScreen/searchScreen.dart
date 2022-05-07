import 'package:flutter/material.dart';
import 'package:mechine_test/searchScreen/searchScreen_provider.dart';
import 'package:mechine_test/searchScreen/ui/searchScreen_ui.dart';
import 'package:provider/provider.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => SearchScreenProvider(),
      child: const SearchScreenUI(),
    );
  }
}
