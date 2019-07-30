import 'package:carousel_pro/carousel_pro.dart';
import 'package:flutter/material.dart';
import 'package:loja_virtual/datas/product_data.dart';

class ProductScreen extends StatefulWidget {
  final ProductData productData;

  ProductScreen(this.productData);

  @override
  _ProductScreenState createState() => _ProductScreenState(productData);
}

class _ProductScreenState extends State<ProductScreen> {
  final ProductData productData;
  String size;

  _ProductScreenState(this.productData);

  @override
  Widget build(BuildContext context) {
    final Color prymaryColor = Theme.of(context).primaryColor;

    return Scaffold(
      appBar: AppBar(
        title: Text(productData.title),
        centerTitle: true,
      ),
      body: ListView(
        children: <Widget>[
          AspectRatio(
            aspectRatio: 0.9,
            child: Carousel(
              images: productData.images.map((url) {
                return NetworkImage(url);
              }).toList(),
              dotSize: 6,
              dotSpacing: 16,
              dotBgColor: Colors.transparent,
              dotColor: prymaryColor,
              autoplay: false,
              animationCurve: ElasticInCurve(),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Text(
                  productData.title,
                  style: TextStyle(fontWeight: FontWeight.w500),
                  maxLines: 3,
                ),
                Text(
                  "R\$ ${productData.price.toStringAsFixed(2)}",
                  style: TextStyle(
                      fontWeight: FontWeight.w700,
                      color: Theme.of(context).primaryColor,
                      fontSize: 22),
                ),
                SizedBox(
                  height: 16,
                ),
                Text(
                  "Tamanho",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                ),
                SizedBox(
                  height: 34,
                  child: GridView(
                      padding: EdgeInsets.symmetric(vertical: 4),
                      scrollDirection: Axis.horizontal,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 1,
                        mainAxisSpacing: 8,
                        childAspectRatio: 0.5,
                      ),
                      children: productData.sizes != null
                          ? productData.sizes.map((s) {
                              return GestureDetector(
                                onTap: () {
                                  setState(() {
                                    if (size == s) {
                                      size = null;
                                    } else {
                                      size = s;
                                    }
                                  });
                                },
                                child: Container(
                                  decoration: BoxDecoration(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(4)),
                                    border: Border.all(
                                        color: size == s
                                            ? prymaryColor
                                            : Colors.grey,
                                        width: 2),
                                  ),
                                  width: 50,
                                  alignment: Alignment.center,
                                  child: Text(s),
                                ),
                              );
                            }).toList()
                          : []),
                ),
                SizedBox(
                  height: 16,
                ),
                SizedBox(
                  height: 44,
                  child: RaisedButton(
                    onPressed: size != null ? () {} : null,
                    child: Text(
                      "Adicionar ao carrinho",
                      style: TextStyle(fontSize: 16),
                    ),
                    color: prymaryColor,
                    textColor: Colors.white,
                  ),
                ),
                SizedBox(
                  height: 16,
                ),
                Text(
                  "Descrição",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                ),
                Text(
                  productData.description,
                  style: TextStyle(fontSize: 14),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
