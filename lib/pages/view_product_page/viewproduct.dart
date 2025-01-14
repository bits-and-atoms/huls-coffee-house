import 'package:flutter/material.dart';
import 'package:huls_coffee_house/config/config.dart';
import 'package:huls_coffee_house/pages/login_ui/widgets/buttons.dart';
import 'package:huls_coffee_house/pages/view_product_page/components/addons.dart';
import 'package:huls_coffee_house/pages/view_product_page/components/addtocart.dart';
import 'package:huls_coffee_house/pages/view_product_page/components/checkout.dart';

import '../../models/models.dart';

class ViewProduct extends StatefulWidget {
  final ProductModel product;

  const ViewProduct({Key? key, required this.product}) : super(key: key);
  static const String routeName = '/viewproduct';

  @override
  State<ViewProduct> createState() => _ViewProductState();
}

class _ViewProductState extends State<ViewProduct> {
  int quantity = 1;
  num totalamount = 0;
  num fixamount = 0;
  bool addons = true;

  @override
  void initState() {
    super.initState();
    // Set fixamount using widget.items.itemPrice in initState
    fixamount = widget.product.price;
    totalamount = totalamount + fixamount;
  }

  @override
  Widget build(BuildContext context) {
    final Size screensize = MediaQuery.of(context).size;
    final double height = screensize.height;
    final double width = screensize.width;

    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.startTop,
      floatingActionButton: const GoBackButton(),
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Container(
              margin: EdgeInsets.fromLTRB(width * 0.0555555555555556,
                  height * 0.0625, width * 0.0555555555555556, 0),
              height: height * 0.2575,
              width: width * 0.897,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: Colors.white,
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Image(
                  image: AssetImage(widget.product.imageURL ?? defaultImage),
                  fit: BoxFit.cover,
                ),
              )),
          SizedBox(
            height: height * 0.05,
          ),
          SizedBox(
            width: 319,
            child: Text(
              widget.product.itemName,
              style: const TextStyle(
                color: Color(0xFF323643),
                fontSize: 28,
                fontFamily: 'SofiaPro',
                fontWeight: FontWeight.w400,
                height: 0.04,
                letterSpacing: -0.56,
              ),
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          Container(
            alignment: Alignment.center,
            //color: Colors.black,
            height: height * 0.05,
            width: width,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  '₹$totalamount',
                  style: const TextStyle(
                    color: Color(0xFFFE724C),
                    fontSize: 17.01,
                    fontFamily: 'SofiaPro',
                    fontWeight: FontWeight.w400,
                    height: 0,
                  ),
                ),
                SizedBox(
                  width: width * 0.421,
                ),
                GestureDetector(
                    onTap: () {
                      if (quantity != 0) {
                        quantity--;
                        totalamount = totalamount - fixamount;
                        setState(() {});
                      }
                    },
                    child: Image.asset(
                      'assets/images/minusicon.png',
                      height: height * 0.0375,
                      width: width * 0.0833,
                    )),
                SizedBox(
                  width: width * 0.1091388888888889,
                ),
                Text(
                  quantity.toString(),
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                    fontFamily: 'SofiaPro',
                    fontWeight: FontWeight.w400,
                    height: 0,
                  ),
                ),
                SizedBox(
                  width: width * 0.08,
                ),
                GestureDetector(
                    onTap: () {
                      quantity++;

                      setState(() {
                        totalamount = totalamount + fixamount;
                      });
                    },
                    child: Image.asset(
                      'assets/images/plusicon.png',
                      height: height * 0.0375,
                      width: width * 0.0833,
                    )),
              ],
            ),
          ),
          SizedBox(
            height: height * 0.03375,
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(width * 0.03055, 0, 0, 0),
            child: const Row(
              children: [
                Text(
                  ' Add Ons',
                  style: TextStyle(
                    color: Color(0xFF323643),
                    fontSize: 18,
                    fontFamily: 'SofiaPro',
                    fontWeight: FontWeight.w400,
                    height: 0,
                  ),
                ),
              ],
            ),
          ),
          GestureDetector(
            onTap: () {
              addons = false;
              setState(() {});
            },
            child: const Addons(
              name: 'Candels',
              image: 'assets/images/demo1.png',
              price: '+20',
              addon: false,
            ),
          ),
          const Addons(
            name: 'Sparkels',
            image: 'assets/images/demo2.png',
            price: '+20',
            addon: false,
          ),
          SizedBox(
            height: height * 0.0225,
          ),
          CheckoutButton(
            product: widget.product,
          ),
          SizedBox(
            height: height * 0.1325,
          ),
          AddToCartButton(
            product: widget.product,
          )
        ],
      ),
    );
  }
}
