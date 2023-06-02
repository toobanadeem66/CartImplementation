import 'package:cartimplementation2/products_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class ShoppingCart extends StatefulWidget {
  const ShoppingCart({Key? key, required this.cart, required this.updateCart})
      : super(key: key);
  final List<Products> cart;
  final VoidCallback updateCart;
  @override
  State<ShoppingCart> createState() => ShoppingCartState();
}

class ShoppingCartState extends State<ShoppingCart> {
  @override
  Widget build(BuildContext context) {
    Widget TileTrailing(Products product) {
      return product.qty < 1
          ? IconButton(
              onPressed: () {
                product.qty++;
                widget.cart.add(product);
                widget.updateCart();
                setState(() {});
              },
              icon: const Icon(Icons.add))
          : Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                IconButton(
                    onPressed: () {
                      product.qty--;
                      product.qty < 0 ? product.qty = 0 : null;
                      product.qty < 1 ? widget.cart.remove(product) : null;
                      widget.updateCart();
                      setState(() {});
                    },
                    icon: const Icon(Icons.remove)),
                Text(product.qty.toString()),
                IconButton(
                    onPressed: () {
                      product.qty++;
                      widget.updateCart();
                      setState(() {});
                    },
                    icon: const Icon(Icons.add)),
              ],
            );
    }

    return Scaffold(
        appBar: AppBar(
          title: Center(child: Text("Shopping Cart")),
          centerTitle: true,
        ),
        body: widget.cart.isNotEmpty
            ? Padding(
                padding: const EdgeInsets.all(8.0),
                child: ListView(
                  shrinkWrap: true,
                  children: widget.cart
                      .map(
                        (product) => Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: ListTile(
                            leading: CircleAvatar(
                              radius: 23,
                              backgroundColor: Colors.white,
                              child: ClipRRect(
                                child: Image.network(
                                  product.ImgURL,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            title: Text(product.name),
                            tileColor: Colors.black12,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10)),
                            visualDensity: VisualDensity(vertical: 1),
                            trailing: TileTrailing(product),
                          ),
                        ),
                      )
                      .toList(),
                ),
              )
            : Center(child: Text("Shopping Cart is Empty")));
  }
}
