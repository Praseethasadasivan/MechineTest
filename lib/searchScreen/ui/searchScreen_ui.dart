import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mechine_test/employee/employee.dart';
import 'package:mechine_test/searchScreen/searchScreen_provider.dart';
import 'package:provider/provider.dart';

class SearchScreenUI extends StatefulWidget {
  const SearchScreenUI({Key? key}) : super(key: key);

  @override
  State<SearchScreenUI> createState() => _SearchScreenUIState();
}

class _SearchScreenUIState extends State<SearchScreenUI> {
  @override
  void initState() {
    Future.microtask(() async {
      await context.read<SearchScreenProvider>().downloadFromApi();
    });
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    SearchScreenProvider _provider = context.watch<SearchScreenProvider>();
    return Scaffold(
      appBar: AppBar(
        title: const Text("Search Screen"),
      ),
      body: _buildBody(_provider),
    );
  }

  Widget _buildBody(SearchScreenProvider _provider) {
    return Column(
      children: [
        SizedBox(
          width: MediaQuery.of(context).size.width,
          child: TextField(
            decoration: InputDecoration(
                hintText: "Seach here",
                suffixIcon:
                    IconButton(onPressed: () {}, icon: Icon(Icons.search))),
            keyboardType: TextInputType.name,
            inputFormatters: [
              FilteringTextInputFormatter.allow(RegExp("[a-zA-Z0-9 ]"))
            ],
            textInputAction: TextInputAction.search,
            maxLength: 50,
            onChanged: (value) {
              _provider.searchUsingName(value);
            },
          ),
        ),
        _provider.isLoading
            ? Container()
            : Expanded(
                child: ListView.separated(
                    itemBuilder: (context, index) {
                      return Column(
                        children: [
                          GestureDetector(
                            child: Container(
                              padding: EdgeInsets.symmetric(
                                  vertical: 10, horizontal: 20),
                              decoration: BoxDecoration(
                                  color: Color.fromARGB(255, 34, 230, 220),
                                  borderRadius: BorderRadius.circular(5)),
                              child: Text(
                                  _provider.employeeSearchResult[index].name),
                            ),
                            onTap: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => EmployeeScreen()));
                            },
                          )
                        ],
                      );
                    },
                    separatorBuilder: (context, index) {
                      return const Divider();
                    },
                    itemCount: _provider.employeeSearchResult.length))
      ],
    );
  }
}
