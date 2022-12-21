import 'package:flutter/material.dart';

class _Product {
  _Product({required this.name, required this.qty});
  String name;
  int qty;
  bool inCart = false;

  int firstqty = 0;

  void decrement() {
    firstqty += 1;
    if (this.qty != 0) {
      this.qty -= 1;
    } else {
      this.qty = firstqty - 1;
      this.firstqty = 0;
    }
    this.inCart = (qty == 0) ? true : false;
  }
}

List<_Product> productData = [_Product(name: "Telur", qty: 3)];

class ShopListApp extends StatelessWidget {
  const ShopListApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Shop List App',
      home: Scaffold(
        appBar: AppBar(title: Text("Shopping List")),
        body: _ProductList(),
      ),
    );
  }
}

class _ProductList extends StatefulWidget {
  _ProductList({super.key});

  @override
  State<_ProductList> createState() => __ProductListState();
}

class __ProductListState extends State<_ProductList> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: productData.length,
      itemBuilder: (context, index) {
        return ListTile(
          contentPadding: EdgeInsets.symmetric(vertical: 10, horizontal: 12),
          onTap: () {
            setState(() {
              productData[index].decrement();
            });
          },
          leading: CircleAvatar(
            backgroundColor:
                productData[index].inCart ? Colors.grey : Colors.amber,
            radius: 30,
            child: Text(
              productData[index].name[0],
              style: TextStyle(fontSize: 24, color: Colors.white),
            ),
          ),
          title: Text(
            "${productData[index].name} x${productData[index].qty}",
            style: productData[index].inCart
                ? TextStyle(
                    color: Colors.black38,
                    fontSize: 24,
                    decoration: TextDecoration.lineThrough)
                : TextStyle(
                    fontSize: 24,
                  ),
          ),
        );
      },
    );
  }
}
