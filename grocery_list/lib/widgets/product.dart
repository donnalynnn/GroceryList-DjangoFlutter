// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:grocery_list/model/grocerylist_model.dart';
import '../constants/colors.dart';

class Product extends StatelessWidget {
  final GroceryList product;
  final onBought; //update function
  final onDeleteProduct;

  const Product({
    Key? key,
    required this.product,
    required this.onBought, //if bought then crash out but dont delete
    required this.onDeleteProduct,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 20),
      child: ListTile(
        onTap: () {
          onBought(product);
        },
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
        tileColor: Colors.white,
        leading: Icon(
          product.isBought ? Icons.check_box : Icons.check_box_outline_blank,
          color: tdBlue,
        ),
        title: Text(
          product.product!,
          style: TextStyle(
            fontSize: 16,
            color: tdBlack,
            decoration: product.isBought ? TextDecoration.lineThrough : null,
          ),
        ),
        trailing: Container(
          padding: const EdgeInsets.all(0),
          margin: const EdgeInsets.symmetric(vertical: 12),
          height: 35,
          width: 35,
          decoration: BoxDecoration(
            color: tdRed,
            borderRadius: BorderRadius.circular(5),
          ),
          child: IconButton(
            color: Colors.white,
            iconSize: 18,
            icon: const Icon(Icons.delete),
            onPressed: () {
              // print('Clicked on delete icon');
              onDeleteProduct(product.id);
            },
          ),
        ),
      ),
    );
  }
}