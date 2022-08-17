// ignore_for_file: library_private_types_in_public_api

import 'package:carousel_pro/carousel_pro.dart';


import 'package:flutter/material.dart';
import 'package:sniff_me/constants.dart';
import 'package:sniff_me/models/product.dart';
import 'package:sniff_me/components/items.dart';
import 'package:sniff_me/components/categories.dart';
import 'package:sniff_me/pages/details/details_page.dart';

class CartPage extends StatefulWidget {
  const CartPage({Key key}) : super(key: key);

  @override
  _CartPageState createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  final List<String> images = [
    'https://i.pinimg.com/originals/80/d3/64/80d364e09d31fcba8af274926d4332ff.jpg',
    'https://www.rd.com/wp-content/uploads/2021/01/GettyImages-588935825.jpg',
    'https://hips.hearstapps.com/hmg-prod.s3.amazonaws.com/images/dog-puppy-on-garden-royalty-free-image-1586966191.jpg',
    'https://i.pinimg.com/originals/ef/59/0d/ef590d3e2990e6827d96ad8ce55a755b.png',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('CartPage'),
        automaticallyImplyLeading: false,
        backgroundColor: Colors.pink,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(
              height: 250,
              width: double.infinity,
              child: Carousel(
                dotBgColor: Colors.transparent,
                dotIncreasedColor: Colors.pinkAccent[400],
                dotSpacing: 30,
                images: images
                    .map(
                      (item) => Container(
                    child: Image.network(
                      item,
                      fit: BoxFit.cover,
                    ),
                  ),
                )
                    .toList(),
              ),
            ),
            const SizedBox(height: 20),
            Categories(),
            const SizedBox(
              height: 20,
            ),
            Flexible(
              fit: FlexFit.loose,
              child: Padding(
                padding:
                const EdgeInsets.symmetric(horizontal: kDefaultPaddin),
                child: GridView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: products.length,
                  gridDelegate:
                  const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: kDefaultPaddin,
                    crossAxisSpacing: kDefaultPaddin,
                    childAspectRatio: 0.75,
                  ),
                  itemBuilder: (context, index) => ItemCard(
                    product: products[index],
                    press: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => DetailsScreen(
                          product: products[index],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

Widget buildImage(String urlImage, int index) => Container(
  margin: const EdgeInsets.symmetric(horizontal: 12),
  color: Colors.grey,
  child: Image.network(
    urlImage,
    fit: BoxFit.cover,
  ),
);
