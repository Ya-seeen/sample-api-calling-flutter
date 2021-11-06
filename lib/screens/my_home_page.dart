import 'package:flutter/material.dart';
import 'package:sabuj_demo/models/product.dart';
import 'package:sabuj_demo/product_service.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  List<Product> products = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _getProductList();
  }

  _getProductList() async {
    await ProductService().getProductList()!.then((values) {
      products = values;
      setState(() {});
    }).catchError((err) {
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sample API Calling'),
      ),
      body: SingleChildScrollView(
        child: products.isNotEmpty?SizedBox(
          width: double.infinity,
          child: Column(
            children: [
              for(int i = 0; i < products.length; i++)
                Card(
                  child: Row(
                    children: [
                      Expanded(
                        child: Image.network(products[i].imageLink!),
                        flex: 3,
                      ),
                      const SizedBox(width: 8),
                      Expanded(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(products[i].id.toString()),
                              Text(products[i].productType!),
                              Text(products[i].name!),
                              Text(products[i].price!)
                            ],
                          ),
                        flex: 10,
                      )
                    ],
                  ),
                )
            ],
          ),
        ):Container(alignment: Alignment.center, child: const CircularProgressIndicator()),
      ),
    );
  }
}
