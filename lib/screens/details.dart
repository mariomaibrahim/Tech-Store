import 'package:flutter/material.dart';
import 'home_screen.dart';

class ItemsDetails extends StatelessWidget {
  final Product product;

  const ItemsDetails({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        backgroundColor: Colors.grey[200],
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Icon(Icons.laptop, color: Colors.black),
            Text(
              " Tech",
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              " Shop",
              style: TextStyle(
                color: Colors.orange,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        elevation: 0.0,
        iconTheme: IconThemeData(color: Colors.black, weight: 200),
      ),
      body: ListView(
        children: [
          Container(
            margin: EdgeInsets.only(top: 3),
            child: Image.asset(
              product.image,
              width: 300,
              height: 300,
              fit: BoxFit.contain,
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 3),
            child: Text(
              product.name,
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 3),
            child: Text(
              product.subtitle,
              style: TextStyle(
                color: Colors.grey[600],
                fontWeight: FontWeight.bold,
                fontSize: 15,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 5, bottom: 20),
            child: Text(
              "\$${product.price}",

              style: TextStyle(
                color: Colors.orange,
                fontWeight: FontWeight.bold,
                fontSize: 17,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Color  :   ",style: TextStyle(fontWeight: FontWeight.w600),),
              Container(
                height: 20,
                width: 20,
                decoration: BoxDecoration(
                  color: Colors.black87,
                  borderRadius: BorderRadius.circular(30),
                  border: Border.all(color:Colors.orange,width: 1)
                ),
              ),
              Text(" Black"),
              SizedBox(width: 10,),
              Container(
                height: 20,
                width: 20,
                decoration: BoxDecoration(
                  color: Colors.grey[500],
                  borderRadius: BorderRadius.circular(30),
                  border: Border.all(color:Colors.orange,width: 1)
                ),
              ),
              Text(" Grey"),SizedBox(width: 10,),
              Container(
                height: 20,
                width: 20,
                decoration: BoxDecoration(
                  color: Colors.white70,
                  borderRadius: BorderRadius.circular(30),
                  border: Border.all(color:Colors.orange,width: 1)
                ),
              ),
              Text(" White"),
            ],
          ),
        ],
      ),
    );
  }
}
