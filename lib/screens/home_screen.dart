import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:ict_final/data/models/product_data_model.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  void getProducts() async {
    final uri = Uri.parse('https://fakestoreapi.com/products');
    final response = await http.get(uri);
    if (response.statusCode == 200) {
      final List<dynamic> listOfData = json.decode(response.body);
      for (var map in listOfData) {
        ProductDataModel product = ProductDataModel.fromJson(map);
        elements.add(product);
      }
      setState(() {});
    } else {
      print('Failed to fetch products');
    }
  }

  List<ProductDataModel> elements = [];

  @override
  void initState() {
    super.initState();
    getProducts();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        title: Text('Home Screen'),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.shopping_cart),
          ),
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.search),
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: elements.length,
        itemBuilder: (context, index) {
          return Container(
            margin: EdgeInsets.all(10),
            padding: EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
              border: Border.all(
                color: Colors.grey,
                width: 1,
              ),
            ),
            child: Row(
              children: [
                Expanded(
                  flex: 2,
                  child: Image.network(
                    elements[index].image,
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  flex: 4,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        elements[index].title,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          fontSize: 30,
                        ),
                      ),
                      Text(
                        elements[index].description.toString(),
                        maxLines: 3,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.grey[800],
                        ),
                      ),
                      Text(
                        elements[index].price.toString(),
                        style: TextStyle(
                          fontSize: 40,
                          color: Colors.green,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),[]
          );
        },
      ),
    );
  }
}
