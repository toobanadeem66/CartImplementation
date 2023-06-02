import 'package:cartimplementation2/shopping_cart.dart';
import 'package:flutter/material.dart';
import 'package:badges/badges.dart' as badges;
import 'package:cartimplementation2/products_model.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.brown,
      ),
      home: const MyHomePage(title: 'Products'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

List<Products> cart = [];

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    void updateCart() {
      setState(() {});
    }

    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text(widget.title)),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView(
          shrinkWrap: true,
          children: products
              .map(
                (product) => ProductTile(
                  product: product,
                  cart: cart,
                  updateCart: updateCart,
                ),
              )
              .toList(),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => ShoppingCart(
                cart: cart,
                updateCart: updateCart,
              ),
            ),
          );
        },
        tooltip: 'Increment',
        child: badges.Badge(
          badgeStyle: const badges.BadgeStyle(
            badgeColor: Color.fromARGB(255, 248, 226, 218),
          ),
          badgeContent: Text(cart.length.toString()),
          child: const Icon(Icons.shopping_cart),
        ),
      ),
    );
  }
}

class ProductTile extends StatefulWidget {
  const ProductTile({
    super.key,
    required this.product,
    required this.cart,
    required this.updateCart,
  });

  final Products product;
  final List<Products> cart;
  final VoidCallback updateCart;
  @override
  State<ProductTile> createState() => _ProductTileState();
}

class _ProductTileState extends State<ProductTile> {
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
                      setState(() {});
                    },
                    icon: const Icon(Icons.add)),
              ],
            );
    }

    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: ListTile(
        leading: CircleAvatar(
          radius: 23,
          backgroundColor: Colors.white,
          child: ClipRRect(
            child: Image.network(
              widget.product.ImgURL,
              fit: BoxFit.cover,
            ),
          ),
        ),
        title: Text(widget.product.name),
        tileColor: Colors.black12,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        visualDensity: VisualDensity(vertical: 1),
        trailing: TileTrailing(widget.product),
      ),
    );
  }
}
