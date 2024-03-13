import 'package:flutter/material.dart';
import 'package:grocery_list/api/grocerylist_api.dart';
import '../model/grocerylist_model.dart';
import '../constants/colors.dart';
import '../widgets/product.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final groceryList = getGroceryList();
  List<GroceryList> _foundProduct = [];
  final _productController = TextEditingController();

  @override
  void initState() {
    _foundProduct = groceryList as List<GroceryList>;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: tdBGColor,
      // appBar: _buildAppBar(),
      body: Stack(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(
              horizontal: 20,
              vertical: 15,
            ),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(10, 35, 10, 10),
                  child: searchBox(),
                ),
                const Padding(
                  padding: EdgeInsets.all(8),
                  child: Text(
                    'Grocery List',
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                Expanded(
                  child: ListView(
                    children: [
                      for (GroceryList productt in _foundProduct.reversed)
                        Product(
                          product: productt,
                          onBought: _handleToDoChange,
                          onDeleteProduct: _deleteProduct,
                        ),
                    ],
                  ),
                )
              ],
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Row(children: [
              FloatingActionButton(
                backgroundColor: Colors.teal,
                onPressed: () async {
                  showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          title: const Text('Add Todo'),
                          content: TextField(
                            controller: _productController,
                          ),
                          actions: [
                            ElevatedButton(
                                child: const Text('Add'),
                                onPressed: () async {
                                  // if (_productController.text.isNotEmpty) {
                                  //   _addToDoItem(_productController.text);
                                  //   _productController.clear();
                                  //   Navigator.pop(context);
                                  // }
                                  if (_productController.text.isNotEmpty) {
                                    await create(_productController.text);
                                    _productController.clear();
                                    // ignore: use_build_context_synchronously
                                    Navigator.pop(context);
                                  }
                                })
                          ],
                        );
                      });
                },
                child: const Icon(Icons.add),
              ),
            ]),
          ),
        ],
      ),
    );
  }

  void _handleToDoChange(GroceryList prod) {
    //isBought Update
    setState(() {
      prod.isBought = !(prod.isBought);
    });
  }

  void _deleteProduct(int id) {
    setState(() async {
      await deleteProduct(id);
    });
  }

  // Future<void> _addProduct(String prod) async {
  //   await create(_productController as String);
  //   _productController.clear();
  // }

  // void _runFilter(String enteredKeyword) async {
  //   List<GroceryList> results = [];
  //   if (enteredKeyword.isEmpty) {
  //     results = groceryList as List<GroceryList>;
  //   } else {
  //     results = groceryList
  //         .where((product) => product.product!
  //             .toLowerCase()
  //             .contains(enteredKeyword.toLowerCase()))
  //         .toList();
  //   }

  //   setState(() {
  //     _foundProduct = results;
  //   });
  // }

  Widget searchBox() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      child: const TextField(
        // onChanged: (value) => _runFilter(value),
        decoration: InputDecoration(
          contentPadding: EdgeInsets.all(0),
          prefixIcon: Icon(
            Icons.search,
            color: tdBlack,
            size: 20,
          ),
          prefixIconConstraints: BoxConstraints(
            maxHeight: 20,
            minWidth: 25,
          ),
          border: InputBorder.none,
          hintText: 'Search',
          hintStyle: TextStyle(color: tdGrey),
        ),
      ),
    );
  }

  // AppBar _buildAppBar() {
  //   return AppBar(
  //     backgroundColor: tdBGColor,
  //     elevation: 0

  //   );
  // }
}
